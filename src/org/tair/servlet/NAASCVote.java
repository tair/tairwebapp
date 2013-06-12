/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.servlet;


import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.EMail;
import org.tair.utilities.ServletLogger;
import org.tair.utilities.TextConverter;
import org.tair.utilities.WebApp;


public class NAASCVote extends HttpServlet {
  private static final long serialVersionUID = -7406822707711128566L;
  private static final long UNKNOWN = 0L;
  private static final long YET_TO_VOTE = 1L;
  private static final long CONFIRM = 2L;
  private static final long VOTED = 3L;
  private static final long CLOSED = 4L;
  private static java.util.Date votingStart = null;
  private static java.util.Date votingEnd = null;

  public void doGet(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {
    ServletLogger.start(getClass().getName(), req, res);
    mainDispatch(findState(req), req, res);
    ServletLogger.end(getClass().getName(), req, res);
  }

  public void doPost(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {
    long state = UNKNOWN;
    String passwd = req.getParameter("password");
    String uname = req.getParameter("username");
    String cmd = req.getParameter("cmd");

    ServletLogger.start(getClass().getName(), req, res);

    passwd = (passwd != null) ? passwd.trim() : "";
    uname = (uname != null) ? uname.trim() : "";
    cmd = (cmd != null) ? cmd.trim() : "";

    DBWriteManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBWriteManager.getInstance();
      conn = connectionPool.get_connection();

      if (cmd.equals("login"))
        state = doLogin(uname, passwd, req, conn);
      else if (cmd.equals("confirm"))
        state = doConfirm(req, conn);
      else if (cmd.equals("vote"))
        state = doVote(req, conn);
      else
        req.setAttribute("error", "unknown command " + cmd + "");
    } catch (SQLException err) {
      req.setAttribute("db error", err.getMessage());
      this.log("NAASC vote error", err);
    }

    if (conn != null && connectionPool != null)
      connectionPool.return_connection(conn);

    mainDispatch(state, req, res);
    ServletLogger.end(getClass().getName(), req, res);
  }

  private void mainDispatch(long state, HttpServletRequest req,
                            HttpServletResponse res) throws ServletException,
      IOException {
    if (state == UNKNOWN)
      state = findState(req);

    if (state == YET_TO_VOTE)
      req.getRequestDispatcher("/jsp/naasc/vote.jsp").forward(req, res);
    else if (state == CONFIRM)
      req.getRequestDispatcher("/jsp/naasc/confirm.jsp").forward(req, res);
    else if (state == VOTED)
      req.getRequestDispatcher("/jsp/naasc/voted_for.jsp").forward(req, res);
    else if (state == CLOSED)
      req.getRequestDispatcher("/jsp/naasc/closed.jsp").forward(req, res);
    else
      req.getRequestDispatcher("/jsp/naasc/login.jsp").forward(req, res);
  }

  private long findState(HttpServletRequest req) {
    java.util.Date now = new java.util.Date();
    if (now.before(votingStartDate()) || now.after(votingEndDate()))
      return CLOSED;

    DBReadManager connectionPool = null;
    DBconnection conn = null;
    long state = UNKNOWN;
    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();
      state = findState(req, conn);
    } catch (SQLException err) {
      req.setAttribute("db error", err.getMessage());
      this.log("NAASC vote error", err);
    }

    if (conn != null && connectionPool != null)
      connectionPool.return_connection(conn);

    return state;
  }

  private long findState(HttpServletRequest req, DBconnection conn)
      throws SQLException {
    HttpSession session = req.getSession();
    Long pid = (Long)session.getAttribute("person_id");
    if (pid == null)
      return UNKNOWN;

    conn
        .setQuery("SELECT candidate1, candidate2, date_voted FROM NaascVoter WHERE person_id = ?");
    conn.setQueryVariable(1, pid);
    ResultSet rs = conn.getResultSet();
    if (rs.next()) {
      session.setAttribute("candidate1", rs.getString(1));
      session.setAttribute("candidate2", rs.getString(2));
      session.setAttribute("date_voted", rs.getDate(3));
      return VOTED;
    }
    session.setAttribute("candidates", getCandidates(conn));
    return YET_TO_VOTE;
  }

  private long doConfirm(HttpServletRequest req, DBconnection conn)
      throws ServletException, IOException, SQLException {
    HttpSession session = req.getSession();
    Long pid = (Long)session.getAttribute("person_id");
    if (pid == null) {
      req.setAttribute("error", "not logged in");
      return UNKNOWN;
    }

    String candidate1 = req.getParameter("candidate1");
    String candidate2 = req.getParameter("candidate2");
    candidate1 = (candidate1 != null) ? candidate1.trim() : "";
    candidate2 = (candidate2 != null) ? candidate2.trim() : "";

    ResultSet rs;

    conn
        .setQuery("SELECT COUNT(person_id) FROM NaascVoter WHERE person_id = ?");
    conn.setQueryVariable(pid);
    rs = conn.getResultSet();
    if (rs.next() && rs.getLong(1) != 0) {
      req.setAttribute("error", "You have already voted.");
      return UNKNOWN;
    }

    if (candidate1.equals("")) {
      candidate1 = candidate2;
      candidate2 = "";
    }

    if (candidate1.equals("") && candidate2.equals("")) {
      req.setAttribute("error", "You must vote for 1 or 2 candidates.");
      return UNKNOWN;
    }

    if (!candidate1.equals("")) {
      conn.setQuery("SELECT COUNT(name) FROM Candidate WHERE name = ?");
      conn.setQueryVariable(1, candidate1);
      rs = conn.getResultSet();
      if (!rs.next() || rs.getLong(1) != 1) {
        req.setAttribute("error", "'" + candidate1 + "' is not a candidate");
        return UNKNOWN;
      }
    }

    if (!candidate2.equals("")) {
      conn.setQuery("SELECT COUNT(name) FROM Candidate WHERE name = ?");
      conn.setQueryVariable(1, candidate2);
      rs = conn.getResultSet();
      if (!rs.next() || rs.getLong(1) != 1) {
        req.setAttribute("error", "'" + candidate2 + "' is not a candidate");
        return UNKNOWN;
      }
    }

    if (candidate1.equals(candidate2)) {
      req
          .setAttribute("error",
                        "You are not allowed to vote twice for the same candidate");
      return UNKNOWN;
    }

    session.setAttribute("candidate1", candidate1);
    session.setAttribute("candidate2", candidate2);
    return CONFIRM;
  }

  private long doVote(HttpServletRequest req, DBconnection conn)
      throws ServletException, IOException, SQLException {
    long state = findState(req, conn);
    if (state == VOTED)
      return state;

    HttpSession session = req.getSession();
    Long pid = (Long)session.getAttribute("person_id");
    String candidate1 = (String)session.getAttribute("candidate1");
    String candidate2 = (String)session.getAttribute("candidate2");

    if (candidate1 == null || candidate2 == null || pid == null) {
      req.setAttribute("error", "session is missing data");
      return UNKNOWN;
    }

    if (candidate2.equals("")) {
      conn.setQuery("INSERT INTO NaascVoter (person_id,candidate1,date_voted) "
                    + " VALUES (?,?,"
                    + TextConverter.dbQuote(new java.util.Date(), "mm/dd/yyyy") + ")");
      conn.setQueryVariable(1, pid);
      conn.setQueryVariable(2, candidate1);
    } else {
      conn
          .setQuery("INSERT INTO NaascVoter (person_id,candidate1,candidate2,date_voted) "
                    + " VALUES (?,?,?,"
                    + TextConverter.dbQuote(new java.util.Date(), "mm/dd/yyyy") + ")");
      conn.setQueryVariable(1, pid);
      conn.setQueryVariable(2, candidate1);
      conn.setQueryVariable(3, candidate2);
    }
    conn.executeUpdate();

    conn
        .setQuery("SELECT c.email FROM Community c, Person p WHERE c.community_id = p.community_id AND p.person_id = ?");
    conn.setQueryVariable(1, pid);
    ResultSet rs = conn.getResultSet();
    if (rs.next())
      emailUser(rs.getString(1), candidate1, candidate2);
    else
      this.log("Error looking up email address, " + pid);

    return findState(req, conn);
  }

  private long doLogin(String uname, String passwd, HttpServletRequest req,
                       DBconnection conn) throws SQLException {
    if (uname.equals("")) {
      req.setAttribute("error", "no such username/password");
      return UNKNOWN;
    }
    conn
        .setQuery("SELECT p.person_id, p.community_id FROM Person p, Community c, Address a "
                  + " WHERE c.user_name = ? AND c.password = ? AND p.community_id = c.community_id "
                  + "  AND a.community_id = c.community_id AND a.country_id in "
                  + "   (6,7,10,14,17,21,23,29,36,38,47,49,55,56,59,77,78,79,81,85,86,98,122,125,130,137,140,147,155,178,179,182,195,199,201,200)");
    conn.setQueryVariable(1, uname);
    conn.setQueryVariable(2, passwd);
    ResultSet rs = conn.getResultSet();
    if (rs.next()) {
      req.getSession().setAttribute("person_id", new Long(rs.getLong(1)));
      return findState(req, conn);
    }
    req.setAttribute("error", "no such username/password");
    return UNKNOWN;
  }

  private List<String> getCandidates(DBconnection conn) throws SQLException {
    conn.setQuery("SELECT name FROM Candidate WHERE name <> ''");
    ResultSet rs = conn.getResultSet();
    List<String> L = new ArrayList<String>();
    while (rs.next())
      L.add(rs.getString(1));
    Collections.shuffle(L);
    return L;
  }

  private void emailUser(String addr_to, String candidate1, String candidate2) {
    final String email_from = "informatics-no-reply@arabidopsis.org";
    final String email_to = addr_to;
    final String mail_host = WebApp.getProperty("MAIL_HOST");
    final String subject = "NAASC representative election";
    final String body =
        "\nYou have voted for:\n\n\t" + candidate1 + "\n\t" + candidate2
            + "\n\nThank you for your vote.";

    new Thread(new Runnable() {
      public void run() {
        try {
          EMail.send(mail_host, email_from, email_to, subject, body);
        } catch (MessagingException e) {
          Debugger.logMsg(this, e.getMessage());
        }
      }
    }).start();
  }

  private java.util.Date votingStartDate() {
    if (votingStart == null)
      votingStart = getDateParam("votingStartDate");
    return votingStart;
  }

  private java.util.Date votingEndDate() {
    if (votingEnd == null)
      votingEnd = getDateParam("votingEndDate");
    return votingEnd;
  }

  private java.util.Date getDateParam(String name) {
    try {
      String date = getServletConfig().getInitParameter(name);
      return DateFormat.getDateTimeInstance().parse(date);
    } catch (Exception e) {
      log("couldn't fetch init parameter: " + name);
    }
    return new java.util.Date(0);
  }
}
