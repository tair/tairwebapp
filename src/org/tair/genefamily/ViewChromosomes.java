// Decompiled by Jad v1.5.8e2. Copyright 2001 Pavel Kouznetsov.f // Jad home
// page: http://kpdus.tripod.com/jad.html
// Decompiler options: packimports(3)
// Source File Name: ViewChromosomes.java

package org.tair.genefamily;


import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.imageio.IIOImage;
import javax.imageio.ImageIO;
import javax.imageio.ImageWriteParam;
import javax.imageio.ImageWriter;
import javax.imageio.stream.FileImageOutputStream;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.batik.dom.GenericDOMImplementation;
import org.apache.batik.svggen.SVGGraphics2D;
import org.apache.oro.text.perl.Perl5Util;
import org.apache.xmlgraphics.java2d.ps.EPSDocumentGraphics2D;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBconnection;
import org.tair.utilities.Debugger;
import org.tair.utilities.WebApp;
import org.w3c.dom.DOMImplementation;
import org.w3c.dom.Document;

import Acme.JPM.Encoders.GifEncoder;


/**
 * Handles chromosome image production and writing
 */
public class ViewChromosomes extends HttpServlet {
  private final static int NUM_FORMATS = 3;
  /**
   * Generated serial id required by Java.
   */
  private static final long serialVersionUID = -8577533562304419214L;
  /** Constant for font size */
  public static final int FONT_SIZE = 12;

  // length of each chromosome in bp - populated from database
  // when servlet initializes
  private long[] chromosomeLengths;

  // start position of centromeres in bp - populated from database
  // when servlet initializes
  private long[] centromeres;

  public void init(ServletConfig config) throws ServletException {
    super.init(config);
    try {
      DBReadManager.init();

      // load AGI chromosome lengths and centromere
      // positions from db
      loadChromosomeLengths();
      loadCentromeres();
    } catch (Exception E) {
      E.printStackTrace();
      throw new ServletException("Error initializing search servlet "
                                 + E.getMessage());
    }
    try {
      fg = new FindGenes();
    } catch (Exception E) {
      Debugger.println("Could not initialize database " + E.getMessage());
    }
  }

  /**
   * Loads chromosome map lengths for AGI chromosome maps 1-5. This is done from
   * the database to ensure this tool's definitions of the chromosome maps
   * change as data changes.
   * 
   * @throws SQLException if a database error occurs.
   */
  private void loadChromosomeLengths() throws SQLException {
    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      String query =
        "SELECT length, chromosome "
            + "FROM Map "
            + "WHERE name = 'AGI' "
            + "AND chromosome IN ( '1', '2', '3', '4', '5' ) "
            + "ORDER BY chromosome";
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();

      int chrIndex = 0;
      this.chromosomeLengths = new long[5];
      while (results.next()) {
        long length = results.getLong("length");
        chromosomeLengths[chrIndex] = length;
        chrIndex++;
      }
      conn.releaseResources();
    } finally {
      DBReadManager.return_connection(conn);
    }
  }

  /**
   * Loads centromere positions AGI chromosome maps 1-5. This is done from the
   * database to ensure this tool's definitions of the centromeres change as
   * data changes. Centromere positions are retrieved from entries in
   * AssemblyUnit.
   * 
   * @throws SQLException if a database error occurs.
   */
  private void loadCentromeres() throws SQLException {
    DBReadManager connectionPool = null;
    DBconnection conn = null;

    try {
      connectionPool = DBReadManager.getInstance();
      conn = connectionPool.get_connection();

      // centromere names are CEN[chr number] with the
      // exception of chr. 3
      String query =
        "SELECT ga.start_position, a.name "
            + "FROM AssemblyUnit a, GlobalAssignment ga "
            + "WHERE a.map_element_id = ga.map_element_id "
            + "AND a.name IN ( "
            + "'CEN1', "
            + "'CEN2', "
            + "'CEN3, PT.2OF3', "
            + "'CEN4', "
            + "'CEN5' ) "
            + "ORDER BY name";
      conn.setQuery(query);
      ResultSet results = conn.getResultSet();

      int chrIndex = 0;
      this.centromeres = new long[5];
      while (results.next()) {
        long startPosition = results.getLong("start_position");
        centromeres[chrIndex] = startPosition;
        chrIndex++;
      }
      conn.releaseResources();

    } finally {
      DBReadManager.return_connection(conn);
    }
  }

  private String scrub(String s) {
    return s != null ? s.replaceAll("[<>]", "") : s;
  }

  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    response.setContentType("text/html");
    long millis = System.currentTimeMillis();
    String millisStr = (new Long(millis)).toString();

    PrintWriter out = response.getWriter();
    Perl5Util perl = new Perl5Util();

    ArrayList<String> lociNotFound = new ArrayList<String>();

    out.println("<html>");
    out.println("<head>");
    String title = scrub(request.getParameter("TITLE"));

    if (title == null) {
      title = "Arabidopsis Chromosomes 1-5";
    }

    out.println("<title>TAIR: Chromosome Map</title>");
    out.println("</head>");
    out.println("<body bgcolor=#FFFFFF>");
    out.println("<center><table width=602><tr><td>");
    out.println("<a href=/><img src=\"/images/logosmall.gif\" border=0></a><P>");
    out.println("<BR><span class=header>" + title + "</span><BR><BR>");

    String seqids = scrub(request.getParameter("SEQIDS"));
    String zoomStr = scrub(request.getParameter("ZOOM"));
    String bgColor = scrub(request.getParameter("BGCOLOR"));
    String coords = scrub(request.getParameter("COORDS"));
    String chrColorSelection = scrub(request.getParameter("CHRCOLOR"));
    String tickColorSelection = scrub(request.getParameter("TICKCOLOR"));

    if (chrColorSelection == null) {
      chrColorSelection = "SAUSAGE";
    }

    if (tickColorSelection == null) {
      tickColorSelection = "GRAY";
    }

    Color tickColor = null;
    if (tickColorSelection.equals("WHITE")) {
      tickColor = new Color(255, 255, 255);
    } else if (tickColorSelection.equals("BLACK")) {
      tickColor = new Color(0, 0, 0);
    } else if (tickColorSelection.equals("GRAY")) {
      tickColor = new Color(100, 100, 100);
    } else if (tickColorSelection.equals("YELLOW")) {
      tickColor = new Color(255, 255, 0);
    } else {
      tickColor = new Color(100, 100, 100);
    }

    if (bgColor == null) {
      bgColor = "";
    }
    int zoom = 100;
    try {
      zoom = Integer.parseInt(zoomStr);
    } catch (Exception exception) {
      out.println("Zoom contains illegal characters. Ignoring zoom (100%)");
    }
    Collection<String> lineCollection = new ArrayList<String>();
    if (seqids != null) {
      perl.split(lineCollection, "/\\n+/", seqids);
    }

    Collection<String> coordsLineCollection = new ArrayList<String>();
    if (coords != null) {
      perl.split(coordsLineCollection, "/\\n+/", coords);
    }

    ChromosomeMap cm =
      new ChromosomeMap(chromosomeLengths, centromeres, 5000000 / zoom);

    int errors = 0;
    for (Iterator<String> itr = lineCollection.iterator(); itr.hasNext();) {
      String line = itr.next();
      String seqid = "";
      String name = "";
      double expressionValue = 0.0D;
      Collection<String> fields = new ArrayList<String>();
      perl.split(fields, line);
      Iterator<String> fieldsItr = fields.iterator();
      if (fieldsItr.hasNext()) {
        seqid = fieldsItr.next();
        name = seqid;
      } else {
        seqid = "";
        name = "";
      }
      if (fieldsItr.hasNext()) {
        name = (String)fieldsItr.next();
        try {
          expressionValue = (new Double(name)).doubleValue();
          if (expressionValue < -5D) {
            expressionValue = -5D;
          }
          if (expressionValue > 5D) {
            expressionValue = 5D;
          }
          name = ".";
        } catch (Exception exception1) {
          errors++;
        }
        if (name.equals("")) {
          name = seqid;
        }
      } else {
        name = seqid;
      }
      if (!perl.match("/AT\\dG\\d{5}/i", seqid)) {
        lociNotFound.add(seqid);
      } else {
        String chromosomeStr =
          perl.substitute("s/.*AT([0-9])G[0-9]{5}.*/$1/i", seqid);
        int chromosome = Integer.parseInt(chromosomeStr);
        long position = fg.getStart(seqid);

        if (position < 0L) {
          lociNotFound.add(seqid);
        } else {
          String url = "TairObject?type=locus&name=" + seqid;
          int red = 100;
          int green = 100;
          if (expressionValue < 0.0D) {
            green = (int)expressionValue * -50;
          }
          if (expressionValue > 0.0D) {
            red = (int)expressionValue * 50;
          }
          if (expressionValue == 0.0D) {
            green = 100;
            red = 100;
          }
          Color featureColor = null;
          if (tickColorSelection.equals("VARIABLE")) {
            featureColor = new Color(red, green, 100);
          } else {
            featureColor = tickColor;
          }
          cm.addFeature(chromosome, position, 1L, name, url, featureColor);
        }
      }
    }

    Debugger.println(errors + " did not have legal expression values");
    int imageHeight = (int)cm.getImageHeight(FONT_SIZE);
    int imageWidth = (int)cm.getImageWidth();

    try {
      // original filename is used for the GIF format
      String filename = WebApp.getAbsDynImageDir() + "chrimage." + millisStr;
      String fnameSVG = filename + ".svg";
//      String fnameTIFF = filename + ".tif";
      String fnameEPS = filename + ".eps";
      String fnameJPEG = filename + ".jpg";

      FileOutputStream outputStream = new FileOutputStream(filename);
      FileOutputStream outSVG = new FileOutputStream(fnameSVG);
//      FileOutputStream outTIFF = new FileOutputStream(fnameTIFF);
      FileOutputStream outEPS = new FileOutputStream(fnameEPS);
      File fileJPEG = new File(fnameJPEG);
      FileImageOutputStream outJPEG = new FileImageOutputStream(fileJPEG);

      BufferedImage image = new BufferedImage(imageWidth, imageHeight, 1);
      Graphics2D[] g = new Graphics2D[NUM_FORMATS];

      // **************GIF & JPEG 
      g[0] = image.createGraphics();

      // **************EPS stuff
      // EPSDocumentGraphics2D g[1] = new EPSDocumentGraphics2D(false);
      g[1] = new EPSDocumentGraphics2D(false);
      ((EPSDocumentGraphics2D)g[1]).setGraphicContext(new org.apache.xmlgraphics.java2d.GraphicContext());
      ((EPSDocumentGraphics2D)g[1]).setupDocument(outEPS,
                                                  imageWidth,
                                                  imageHeight); // 400pt x
                                                                // 200pta*/

      // **************SVG stuff
      // Get a DOMImplementation.
      DOMImplementation domImpl =
        GenericDOMImplementation.getDOMImplementation();
      // Create an instance of org.w3c.dom.Document.
      String svgNS = "http://www.w3.org/2000/svg";
      Document document = domImpl.createDocument(svgNS, "svg", null);
      // Create an instance of the SVG Generator.
      // SVGGraphics2D g = new SVGGraphics2D(document);
      g[2] = new SVGGraphics2D(document);
      ((SVGGraphics2D)g[2]).setSVGCanvasSize(new Dimension(imageWidth,
                                                           imageHeight));

      for (int i = 0; i < NUM_FORMATS; i++) {

        g[i].setColor(new Color(255, 255, 255));
        g[i].fillRect(0, 0, imageWidth, imageHeight);
        g[i].setColor(new Color(0, 0, 0));
        // Font displayfont = new Font("SansSerif", 0, 9);
        Font displayfont = new Font("NewTimesRoman", Font.BOLD, FONT_SIZE);
        g[i].setFont(displayfont);
        Color chr = new Color(100, 100, 100);
        if (chrColorSelection.equals("BLACK")) {
          chr = new Color(0, 0, 0);
        } else if (chrColorSelection.equals("GREEN")) {
          chr = new Color(50, 150, 50);
        } else if (chrColorSelection.equals("GRAY")) {
          chr = new Color(100, 100, 100);
        } else if (chrColorSelection.equals("LIGHTGRAY")) {
          chr = new Color(200, 200, 200);
        } else {
          chr = new Color(255, 128, 128);
        }
        cm.setColors(chr, new Color(0, 0, 0), new Color(200, 200, 200));
        cm.drawMap(g[i]);
      }

      // EPS
      ((EPSDocumentGraphics2D)g[1]).finish(); // Wrap up and finalize the EPS
                                              // file

      // SVG
      Writer out1 = new OutputStreamWriter(outSVG, "UTF-8");
      ((SVGGraphics2D)g[2]).stream(out1, false /* useCSS */);

      // PNG
      // ImageEncoder encoder =
      // ImageCodec.createImageEncoder("PNG",outputStream,new
      // PNGEncodeParam.RGB());

      // TIFF
      //TIFFEncodeParam param = new TIFFEncodeParam();
      //param.setLittleEndian(true);
      //ImageEncoder encoderT =
      //  ImageCodec.createImageEncoder("TIFF", outTIFF, param);
      //encoderT.encode(image);
      //outTIFF.close();
      /** Looks like Java 1.7 doesn't directly support TIFF, abandon for now
      ImageWriter writer = ImageIO.getImageWritersByFormatName("tiff").next();
      ImageWriteParam tiffParam = writer.getDefaultWriteParam();
      tiffParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
      tiffParam.setCompressionType("LZW");
      tiffParam.setCompressionQuality(0.5F);
      
      // Create the TIFF meta data object to set little-endian byte order.
      IIOMetadata streamMetaData = writer.getDefaultStreamMetadata(null);
      String tiffMetadataFormatName =
          streamMetaData.getNativeMetadataFormatName();

      // Create the new stream metadata object for little endian byte order and
      // add it to the stream meta data.
      IIOMetadataNode newTree = new IIOMetadataNode(tiffMetadataFormatName);
      IIOMetadataNode byteOrderNode = new IIOMetadataNode("ByteOrder");
      byteOrderNode.setAttribute("value", "LITTLE_ENDIAN");
      newTree.appendChild(byteOrderNode);
      streamMetaData.setFromTree(tiffMetadataFormatName, newTree);
      
      writer.setOutput(outTIFF);
      IIOImage iioImage = new IIOImage(image, null, null);
      writer.write(streamMetaData, iioImage, tiffParam);
      */

      // JPEG
      // JPEGImageEncoder encoderJ = JPEGCodec.createJPEGEncoder(outJPEG);
      // JPEGEncodeParam jparam = JPEGCodec.getDefaultJPEGEncodeParam(image);
      ImageWriter writer = ImageIO.getImageWritersByFormatName("jpeg").next();
      ImageWriteParam jpegParam = writer.getDefaultWriteParam();
      jpegParam.setCompressionMode(ImageWriteParam.MODE_EXPLICIT);
      jpegParam.setCompressionQuality(1.0F);
      writer.setOutput(outJPEG);
      IIOImage iioImage = new IIOImage(image, null, null);
      writer.write(null, iioImage, jpegParam);

      // set JPEG compression to low compression high quality
      // jparam.setQuality((float) 1.0,false);
      // encoderJ.encode(image,jparam);
      // outJPEG.close();

      // GIF
      GifEncoder encoderG = new GifEncoder(image, outputStream);
      encoderG.encode();
      outputStream.close();
    } catch (FileNotFoundException E) {
      Debugger.println("File was not found " + E.getMessage());
    } catch (SecurityException E) {
      Debugger.println("No write permission!!!!" + E.getMessage());
    } catch (IOException E) {
      Debugger.println("IOException : " + E.getMessage());
    }
    out.println("<IMG SRC=\""
                + WebApp.getDynImageDir()
                + "chrimage."
                + millisStr
                + "\" usemap=\"#Features\" border=\"0\">");
    cm.dumpMap(out);
    out.println("<BR>Download Options:<BR><BR>");
    out.println("<a href=\""
                + WebApp.getDynImageDir()
                + "chrimage."
                + millisStr
                + ".svg\">SVG</a><BR>");
    /* TIFF no longer supported
    out.println("<a href=\""
                + WebApp.getDynImageDir()
                + "chrimage."
                + millisStr
                + ".tif\">TIFF</a><BR>");
    */
    out.println("<a href=\""
                + WebApp.getDynImageDir()
                + "chrimage."
                + millisStr
                + ".eps\">EPS (preferred by many journals)</a><BR>");
    out.println("<a href=\""
                + WebApp.getDynImageDir()
                + "chrimage."
                + millisStr
                + ".jpg\">JPEG</a><BR>");
    out.println("<BR>Loci not found:<BR>");
    for (Iterator<String> itr = lociNotFound.iterator(); itr.hasNext(); out.println(itr.next()
                                                                                    + "<BR>"))
      ;
    out.println("</td></tr></table></center>");
    out.println("</body>");
    out.println("</html>");
  }

  public void doPost(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    doGet(request, response);
  }

  private FindGenes fg;
}
