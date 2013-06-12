package org.tair.ctx;

import java.io.*;
import java.sql.*;

import javax.sql.*;
import java.util.*;

public class FooDataSource implements DataSource
{
    public String url;
    public String user;
    public String password;
    public String driver;

    public FooDataSource(String url, String user, String password, String driver){
        this.url = url;
        this.user = user;
        this.password = password;
        this.driver = driver;
    }

    public Connection getConnection() throws SQLException {
        try{
            Class.forName(driver);
            Properties props = new Properties();
            props.put("user", user);
            props.put("password", password);
            //props.put( "JCONNECT_VERSION", new Integer( com.sybase.jdbc2.jdbc.SybDriver.VERSION_6 ));
            //props.put("DYNAMIC_PREPARE", "true");
            return DriverManager.getConnection(url, props);
        } catch(Exception e) {}
        return null;
    }

    public Connection getConnection(String username, String password){
        return null;
    }

    public int getLoginTimeout(){return 0;}

    public PrintWriter getLogWriter(){return null;}

    public void setLoginTimeout(int seconds){}

    public void setLogWriter(PrintWriter out){}

    public boolean isWrapperFor(Class<?> arg0) throws SQLException {
      // TODO Auto-generated method stub
      return false;
    }

    public <T> T unwrap(Class<T> arg0) throws SQLException {
      // TODO Auto-generated method stub
      return null;
    }
}
