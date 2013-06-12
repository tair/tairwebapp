/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.tairquery;


import java.awt.*;
import java.io.*;
import java.sql.*;
import java.util.Hashtable;
import javax.servlet.*;
import javax.servlet.http.*;

import org.tair.tfc.*;
import org.tair.utilities.*;

import Acme.JPM.Encoders.GifEncoder;


/*******************************************************************************
 * This class takes GET requests for images with image_id and image format (jpg,
 * gif etc) concatenated together to appear as a normal file name (i.e. 6.jpg),
 * and returns a byte stream from the database. Requests are expected to be
 * embedded in an HTML &lt; img &gt;. If a thumbnail image is being requested,
 * request should have "thumb_" prefix before image id
 * 
 * Error messages are delivered as images.
 * 
 * Usage: &lt; IMG SRC="http://localhost/servlets/images/2.jpg" &gt; or &lt; IMG
 * SRC="http://localhost/servlets/images/thumb_2.jpg" &gt;
 * 
 * @since jdk1.3
 ******************************************************************************/

public class TairImageServlet extends HttpServlet {
  /**
   * 
   */
  private static final long serialVersionUID = -857437463739172826L;
  public static final int DEFAULT_WIDTH = 400;
  public static final int DEFAULT_HEIGHT = 40;
  public static final int BUFFER_SIZE = 4096;

  private Hashtable<String, String> mimeTypes;

  // prefix used to denote thumbnail images
  private String thumbPrefix = "thumb_";

  /*****************************************************************************
   * Initialize read only database connection pool and populate collection of
   * mime types to match with image suffixes
   * 
   * @param config Servlet config info.
   * @throws ServletException
   ****************************************************************************/
  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      // make sure readonly connection pool is initialized
      DBReadManager.init();
    } catch (Exception ex) {
      ex.printStackTrace();
    }

    mimeTypes = new Hashtable<String, String>();
    mimeTypes.put("gif", "image/gif");
    mimeTypes.put("jpg", "image/jpeg");
    mimeTypes.put("tiff", "image/tiff");
    mimeTypes.put("bmp", "image/vnd.wap.wbmp");
  }

  /*****************************************************************************
   * This method responds to the http get.
   * 
   * @param req servlet request object
   * @param res servlet response object
   * @throws ServlectException
   * @throws IOException
   * 
   * @since jdk1.3
   ****************************************************************************/
  public void service(HttpServletRequest req, HttpServletResponse res)
      throws ServletException, IOException {

    ServletLogger.start(getClass().getName(), req, res);

    // parse image ID & format from request path
    boolean thumbnail = parseThumbnail(req); // thumbnail images should have
                                              // "thumb_" as prefix
    String imageIdStr = parseIDString(req, thumbnail);
    String format = parseImageSuffix(req);

    // determine which table holds binary image data
    String imageTable = (thumbnail) ? "ImageThumbnail" : "ImageData";

    // get the output stream from the response object
    // so we can write stuff to it
    ServletOutputStream out = res.getOutputStream();

    if (imageIdStr == null) { // image_id parameter must be present
      sendErrorImage(res, out, "Null image_id");

    } else if (imageIdStr.length() == 0) { // image_id parameter must have a
                                            // value
      sendErrorImage(res, out, "Empty image_id");

    } else if (TextConverter.isEmpty(format)) { // must have non-null value for
                                                // format
      sendErrorImage(res, out, "Empty file format");

    } else if (!mimeTypes.containsKey(format)) { // must have valid file format
                                                  // to set content-type
      sendErrorImage(res, out, "Invalid file format");

    } else { // check if image_id is a legitimate integer
      boolean okay = true;
      try {
        Integer.parseInt(imageIdStr);
      } catch (NumberFormatException ex) {
        okay = false;
        sendErrorImage(res, out, "Invalid image_id");
      }

      if (okay) { // get image_id data from chosen table

        DBReadManager connectionPool = null;
        DBconnection conn = null;
        ResultSet rs = null;
        BufferedInputStream in = null;

        String qryStr =
            "SELECT image_data " + "FROM  " + imageTable + " WHERE image_id ="
                + imageIdStr;

        try {

          connectionPool = DBReadManager.getInstance();
          conn = connectionPool.get_connection(); // read only connection

          // result set has a pointer to the binary database object
          conn.setQuery(qryStr);
          rs = conn.getResultSet();
          if (rs == null) { // result set should never be null
            sendErrorImage(res, out, "Null result for image_id");

          } else if (!rs.next()) {

            // a result set with no next means nothing was retrieved. i.e.
            // invalid image_id
            sendErrorImage(res, out, "Unknown image_id");
          }

          // set content type for image according to image format in request
          // path suffix
          res.setContentType(mimeTypes.get(format));

          // read it by the buffer-full
          in =
              new BufferedInputStream(rs.getBinaryStream("image_data"),
                                      BUFFER_SIZE);
          byte[] buffer = new byte[BUFFER_SIZE];
          while ((in.read(buffer, 0, BUFFER_SIZE)) > -1) {
            out.write(buffer); // output to the response object
          }

        } catch (SQLException ex) { // badly formed sql or problems with the
                                    // database
          sendErrorImage(res, out, "Unknown image_id");

        } catch (IOException ex) { // problems with the network/internet
          ex.printStackTrace();
          sendErrorImage(res, out, "IO error");

        } finally { // close things up
          if (in != null) {
            in.close();
          }

          ServletLogger.end(getClass().getName(), req, res);
          
          if (conn != null) {
            conn.releaseResources();
            connectionPool.return_connection(conn);
          }
        }
      }
    }
  }

  /*****************************************************************************
   * Constructs a gif with the error message and returns it as an image.
   * 
   * @param res servlet response object
   * @param out response output stream
   * @param message the text message to be displayed
   * 
   * @since jdk1.3
   ****************************************************************************/
  void sendErrorImage(HttpServletResponse res, ServletOutputStream out,
                      String message) {
    // the frame and graphics provide a graphic environment for
    // formatting the image - there is no real graphic environment
    Frame frame = null;
    Graphics g = null;

    // assign the default image size
    int width = DEFAULT_WIDTH;
    int height = DEFAULT_HEIGHT;

    // Now, make the gif
    try {
      // frame and graphics for virtual environment for image
      frame = new Frame();
      frame.addNotify();
      Image image = frame.createImage(width, height);
      g = image.getGraphics();

      // set the font and then get the font metrics
      g.setFont(new Font("Serif", Font.PLAIN, 12));
      FontMetrics fontMetric = g.getFontMetrics(g.getFont());

      // find out the graphical size of the string
      int fontHeight = fontMetric.getHeight();
      int stringWidth = fontMetric.stringWidth(message);

      // position the string in about the center of the image
      int startX = (int)Math.max(0, (width - stringWidth) / 2.0);
      int startY = (int)Math.min(height, (height + fontHeight) / 2.0);

      // write the string to the virtual graphical environment
      g.drawString(message, startX, startY);

      // tell the browser it's getting a gif
      res.setContentType("image/gif");

      // turn the virtual graphics into a gif
      GifEncoder encoder = new GifEncoder(image, out);
      encoder.encode();
    } catch (IOException ex) {
      System.err.println("TairImageServlet.encoder : " + ex);
    } finally {
      // close stuff
      if (g != null) {
        g.dispose();
      }
      if (frame != null) {
        frame.removeNotify();
      }
    }
  }

  // requested image is thumbnail image if "thumb_" prefix is in
  // request path
  private boolean parseThumbnail(HttpServletRequest req) {
    String path = req.getPathInfo();
    return (path.indexOf(thumbPrefix) > -1);
  }

  // parse image_id from request path - if thumbnail image requested, start
  // parsing after "thumb_" prefix
  private String parseIDString(HttpServletRequest req, boolean thumbnail) {
    String path = req.getPathInfo();
    String idStr = null;

    if (thumbnail) {
      int thumbIndex = path.indexOf(thumbPrefix);
      idStr =
          path.substring((thumbIndex + thumbPrefix.length()), path
              .lastIndexOf('.'));

    } else {
      idStr = path.substring(1, path.lastIndexOf('.'));
    }
    return idStr;
  }

  // parse image suffix (.jpg .gif etc) from request path - use
  // to set content-type of response
  private String parseImageSuffix(HttpServletRequest req) {
    String path = req.getPathInfo();
    return path.substring((path.lastIndexOf('.') + 1));
  }

}
