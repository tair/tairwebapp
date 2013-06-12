/*
* Copyright (c) 2010 Carnegie Institution for Science. All rights reserved. 
*/
package org.tair.servlet;


import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * <p>
 * A servlet that executes a command-line script and returns the output of the
 * script to the HTTP response. You supply the script name as the request URI,
 * and the query string is available to the script as an environment variable.
 * If you send content, the script gets that content as its standard input.
 * </p>
 * <p>
 * For script writers, the servlet sets up the following environment variables:
 * <li>REQUEST_METHOD: the type of HTTP request, GET or POST<\li>
 * <li>SCRIPT_NAME: the command to run (the request URI)<\li>
 * <li>QUERY_STRING: the HTTP request query string<\li>
 * <li>CONTENT_TYPE: the HTTP request content type<\li>
 * <li>CONTENT_LENGTH: the HTTP request content length<\li>
 * <li>REMOTE_ADDR: the Internet Protocol (IP) address of the client that sent
 * the request<\li>
 * <li>SERVER_PROTOCOL: the Internet Protocol for the URL to the server
 * (usually HTTP 1.1)<\li>
 * <li>SERVER_NAME: the server name part of the URL to the server<\li>
 * <li>SERVER_PORT: the port part of the URL to the server<\li>
 * <li>SERVER_CONTEXT_PATH: the web app context path to the server web app<\li>
 * <li>WEB_ROOT: the absolute file path to the root directory of the web app</li>
 * </p>
 * 
 * @author Bob Muller
 */
public class ScriptServlet extends HttpServlet {

  /** Serial version UID generated by Java */
  private static final long serialVersionUID = -462443192221607070L;

  /** Enumerated type for the HTTP request, which may be a GET or a POST. */
  public enum RequestType {
    GET, POST
  };

  /** The number of environment variables in the environment array */
  private static final int numberOfEnv = 11;

  /** The number of bytes in the byte buffer for copying stream data */
  private static final int bufferSize = 10000;

  @Override
  public void doGet(HttpServletRequest request, HttpServletResponse response)
      throws IOException, ServletException {
    doScript(request, response, RequestType.GET);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    doScript(request, response, RequestType.POST);
  }

  /**
   * Execute a script specified as a request parameter and write the script's
   * standard output to the HTTP response.
   * 
   * @param request the HTTP request from the client
   * @param response the HTTP response to the client
   * @throws IOException when there is a problem with the process io streams
   */
  private void doScript(HttpServletRequest request,
                        HttpServletResponse response, RequestType type)
      throws IOException {
    InputStream in = null;
    OutputStream out = null;
    InputStream processOut = null;
    OutputStream processIn = null;
    
    Runtime rt = Runtime.getRuntime();

    String[] env = setUpEnvironment(request, type);

    // Execute the script, supplying the environment.
    Process process = rt.exec(env[1], env);

    try {
      // Set up the response and process input and output streams.
      in = request.getInputStream();
      out = response.getOutputStream();
      processOut = process.getInputStream();
      processIn = process.getOutputStream();

      sendInputToScript(in, processIn);

      writeScriptOutputToResponse(out, processOut);
    } catch (RuntimeException e) {
      e.printStackTrace();
    } finally {
      try {
        if (in != null) {
          in.close();
        }
        if (out != null) {
          out.close();
        }
        if (processIn != null) {
          processIn.close();
        }
        if (processOut != null) {
          processOut.close();
        }
      } catch (RuntimeException e) {
        // Ignore the exception but print a stack trace for debugging.
        e.printStackTrace();
      }
    }
    
  }

  /**
   * Write the standard out stream contents generated by the script process into
   * the HTTP response to the client browser.
   * 
   * @param response the output stream for the HTTP response
   * @param process the input stream from the script
   * @throws IOException when there is a problem reading or writing the streams
   */
  private void writeScriptOutputToResponse(OutputStream response,
                                           InputStream processOut)
      throws IOException {
    int count;
    byte[] buffer = new byte[bufferSize];

    // Write the buffered script output to the response.
    count = processOut.read(buffer, 0, bufferSize);
    while (count > -1) {
      response.write(buffer, 0, count);
      count = processOut.read(buffer, 0, bufferSize);
    }
  }

  /**
   * Read an input stream and, using buffers, write the bytes to an output
   * stream.
   * 
   * @param in the input stream
   * @param out the output stream
   * @throws IOException if there is a problem reading or writing the streams
   */
  private void sendInputToScript(InputStream in, OutputStream out)
      throws IOException {
    byte[] buffer = new byte[bufferSize];
    int count = -1;

    // Send the request input stream to the script.
    if (in.available() == 0)
      count = in.read(buffer, 0, bufferSize);
    while (count > -1) {
      out.write(buffer, 0, count);
      count = -1;
      if (in.available() == 0)
        count = in.read(buffer, 0, bufferSize);
    }
    out.flush();
  }

  /**
   * Set up the environment variables for the script process using the request.
   * 
   * @param request the HTTP request
   * @param type the type of HTTP request (GET or POST)
   * @param env the array of environment variables
   */
  private String[] setUpEnvironment(HttpServletRequest request, RequestType type) {
    String[] env = new String[numberOfEnv];

    // Set the request type.
    if (type == RequestType.GET) {
      env[0] = "REQUEST_METHOD=GET";
    } else if (type == RequestType.POST) {
      env[0] = "REQUEST_METHOD=POST";
    }

    // Set the variables contained in the request.
    env[1] = "SCRIPT_NAME=" + getScriptName(request.getQueryString());
    env[2] = "QUERY_STRING=" + request.getQueryString();
    env[3] = "CONTENT_TYPE=" + request.getContentType();
    env[4] = "CONTENT_LENGTH=" + request.getContentLength();
    env[5] = "REMOTE_ADDR=" + request.getRemoteAddr();
    env[6] = "SERVER_PROTOCOL=" + request.getProtocol();
    env[7] = "SERVER_NAME=" + request.getServerName();
    env[8] = "SERVER_PORT=" + request.getServerPort();
    env[9] = "SERVER_CONTEXT_PATH=" + request.getContextPath();
    env[10] = "WEB_ROOT=" + getServletContext().getRealPath("/");

    return env;
  }
  
  /**
   * Parse the script name out of the query string. It is a variable in
   * the format "script=path", with other parameters following separated by 
   * question marks.
   * 
   * @param queryString the query string from the incoming URL
   * @return the script name
   */
  private String getScriptName(String queryString) {
    StringBuilder buffer = new StringBuilder();
    //TODO parse script from input using reg expr
    return buffer.toString();
  }
}
