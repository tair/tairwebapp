/*
 * Copyright (c) 2008 Carnegie Institution for Science. All rights reserved.
 */
package org.tair.utilities;


import java.io.Serializable;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.faces.FacesException;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.RequestScoped;
import javax.faces.context.FacesContext;
import javax.servlet.http.HttpServletRequest;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;


/**
 * <p>
 * A Faces managed bean that accesses comments for a Comments section of a
 * specific page. PrettyFaces sets the page id using an EL expression, then
 * calls the method that gets the array of comments for that page from the
 * database. This concrete subclass inherits from the Page subclass, as
 * comments require a page number to identify a specific set of comments for
 * a page.
 * </p>
 * 
 * @author Robert J. Muller
 */
@ManagedBean(name="comment")
@RequestScoped
public class GuiComment extends GuiPage implements Serializable {
  /** Generated serial version UID */
  private static final long serialVersionUID = -6056812194314373172L;

  /** A list of comments */
  private ArrayList<Comment> comments = new ArrayList<Comment>(0);

  /** A String that contains a new comment to add to the list of comments */
  private String comment = null;

  /** The max length of a string, after which it wraps in a table cell */
  private static final int MAX_WORD_LENGTH = 50;

  /** Query for the set of comments for a page ordered by comment number */
  private static final String QUERY =
    "SELECT c.comment_number, c.community_id, p.first_name || ' ' || p.last_name AS user_name, c.comment_date, c.comment_text FROM Tair_Comment c LEFT OUTER JOIN Person p ON c.community_id = p.community_id WHERE page = ? ORDER BY 1";

  /** Query for the person's name given a community id */
  private static final String NAME_QUERY =
    "SELECT p.first_name || ' ' || p.last_name AS user_name FROM Person p WHERE community_id = ?";

  /** Query for the max comment number for the selected page + 1 */
  private static final String NEXT_SQL =
    "SELECT MAX(comment_number)+1 AS comment_number FROM Tair_Comment WHERE page = ?";

  /** INSERT statement for Comment addition */
  private static final String INSERT_SQL =
    "INSERT INTO Tair_Comment (page, comment_number, comment_date, community_id, comment_text) VALUES (?, ?, getdate(), ?, ?)";

  /**
   * Get the array of comments previously loaded by loadComments().
   * 
   * @return an array of Comment objects
   */
  public ArrayList<Comment> getComments() {
    return comments;
  }

  /**
   * Load the elements for a specific page identified by site map id.
   * 
   * @return null to display the page with the loaded elements
   */
  public String load() {
    ResultSet results = null;
    DBReadManager mgr = null;
    DBconnection c = null;

    try {
      mgr = DBReadManager.getInstance();
      c = mgr.get_connection();
      c.setQuery(QUERY);
      c.setQueryVariable(1, pageId);
      results = c.getResultSet();
      comments = new ArrayList<Comment>();

      // Get the comments in order and add to the comments list.
      while (results.next()) {
        Comment comment = new Comment();
        comment.setComment(results.getString("comment_text"));
        comment.setCommentNumber(results.getLong("comment_number"));
        BigDecimal communityId = results.getBigDecimal("community_id");
        if (results.wasNull()) {
          comment.setCommunityId(null);
        } else {
          comment.setCommunityId(communityId.toBigInteger());
        }
        comment.setUserName(results.getString("user_name"));
        comment.setCommentDate(results.getTimestamp("comment_date"));
        comments.add(comment);
      }
    } catch (SQLException e) {
      Debugger.logMsg(e, e.getMessage());
      throw new FacesException(e.getMessage(), e);
    } finally {
      if (mgr != null) {
        // Close the connection and its resources.
        DBReadManager.return_connection(c);
      }
    }
    return null;
  }

  /**
   * Set the comments.
   * 
   * @param comments The comments to set.
   */
  public void setComments(ArrayList<Comment> comments) {
    this.comments = comments;
  }

  /**
   * Add a new comment to the set of comments for the current page. Set the
   * community id to that of the currently logged in user (the user must be
   * logged in to comment).
   * 
   * @return a null to redisplay the current page
   */
  public String addComment() {
    ResultSet results = null;
    DBWriteManager mgr = null;
    DBconnection c = null;
    BigInteger communityId = null;

    // Get the community id
    HttpServletRequest request =
      (HttpServletRequest)FacesContext.getCurrentInstance().getExternalContext().getRequest();

    try {
      communityId = SessionHandler.getCommunityID(request);
    } catch (InvalidLoginException e1) {
      Debugger.println(e1.getMessage());
      // Continue with communityId set to null
      communityId = null;
    }

    String convertedComment = convertString(comment);

    try {
      // Get a write connection to the database.
      mgr = DBWriteManager.getInstance();
      c = mgr.get_connection();

      // Get the next comment number by querying the Comment table with the page
      // id stored as an attribute of the component.
      c.setQuery(NEXT_SQL);
      c.setQueryVariable(1, pageId);
      results = c.getResultSet();
      if (results.next()) {
        Long number = results.getLong("comment_number");
        if (number == null) {
          // No comments yet for this page, start at 1
          number = new Long("1");
        }
        results.close();

        c.setQuery(INSERT_SQL);
        c.setQueryVariable(1, pageId);
        c.setQueryVariable(2, number);
        if (communityId != null) {
          c.setQueryVariable(3, communityId);
        } else {
          c.setNullIntQueryVariable(3);
        }
        c.setQueryVariable(4, convertedComment);

        c.executeUpdate();

        // Create a Comment and add it to the array.
        Comment commentObject = new Comment();
        commentObject.setComment(comment);
        commentObject.setCommentDate(new Timestamp(System.currentTimeMillis()));
        commentObject.setCommentNumber(number);
        commentObject.setCommunityId(communityId);

        // If there is a community id, use it to get the person's name.
        if (communityId != null) {
          c.setQuery(NAME_QUERY);
          c.setQueryVariable(1, communityId);
          results = c.getResultSet();
          if (results.next()) {
            commentObject.setUserName(results.getString("user_name"));
          }
          results.close();
        }

        comments.add(commentObject);

        // Set the comment to null to clear the input field on response.
        comment = null;
      } else {
        throw new RuntimeException("Couldn't query new comment number");
      }

    } catch (SQLException e) {
      Debugger.logMsg(e, e.getMessage());
      throw new RuntimeException(e.getMessage(), e);
    } finally {
      if (mgr != null) {
        // Close the connection and its resources.
        DBWriteManager.return_connection(c);
      }
    }

    return null;
  }

  /**
   * Convert a string by parsing it and converting any unwelcome components to a
   * more amenable form. For example, if a word in the string is longer than 70
   * characters, insert a blank so the string will wrap. Also remove multiple
   * whitespace characters, line returns and formfeeds, and so on.
   * 
   * @param string the input string
   * @return the converted string
   */
  private String convertString(String string) {
    StringBuilder builder = new StringBuilder(string.length());
    String wordRegex = "[\\S]+";
    Pattern p = Pattern.compile(wordRegex);
    Matcher m = p.matcher(string);
    String sep = "";
    while (m.find()) {
      String word = m.group();
      while (word.length() > MAX_WORD_LENGTH) {
        String substring = word.substring(0, MAX_WORD_LENGTH);
        word = word.substring(MAX_WORD_LENGTH);
        builder.append(sep);
        builder.append(substring);
        sep = " ";
      }
      if (word.length() > 0) {
        builder.append(sep);
        builder.append(word);
        sep = " ";
      }
    }
    return builder.toString();
  }

  /**
   * Get the comment.
   * 
   * @return Returns the comment.
   */
  public String getComment() {
    return comment;
  }

  /**
   * Set the comment.
   * 
   * @param comment The comment to set.
   */
  public void setComment(String comment) {
    this.comment = comment;
  }
}
