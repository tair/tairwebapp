package org.tair.ctx;

import javax.naming.*;
import javax.naming.spi.InitialContextFactory;
import java.util.Hashtable;
import java.util.Properties;

public class FooCtx implements Context
{
    public FooCtx() { }

    public Object addToEnvironment(String propName, Object propVal){
        return null;
    }

    public Object lookup(String name){
        //Properties props = System.getProperties();
        //if(name.contains("ReadOnly"))
        //   return new FooDataSource(props.getProperty("db.url"), props.getProperty("db.read.user"), props.getProperty("db.read.password"), props.getProperty("db.driver"));
        return null;
    }

    public void bind(Name name, Object obj){}

    public void bind(String name, Object obj){}

    public void close() {}

    public Name composeName(Name name, Name prefix){
        return null;
    }

    public String composeName(String name, String prefix){
        return "";
    }

    public Context createSubcontext(Name name){
        return null;
    }

    public Context createSubcontext(String name){
        return null;
    }

    public void destroySubcontext(Name name){ }

    public void destroySubcontext(String name){ }

    public Hashtable<?,?> getEnvironment(){
        return null;
    }

    public String getNameInNamespace(){
        return null;
    }

    public NameParser getNameParser(Name name){
        return null;
    }

    public NameParser getNameParser(String name){
        return null;
    }

    public NamingEnumeration<NameClassPair> list(Name name){
        return null;
    }

    public NamingEnumeration<NameClassPair> list(String name){
        return null;
    }

    public NamingEnumeration<Binding> listBindings(Name name){
        return null;
    }

    public NamingEnumeration<Binding> listBindings(String name){
        return null;
    }

    public Object lookup(Name name){
        return null;
    }

    public Object lookupLink(Name name){
        return null;
    }

    public Object lookupLink(String name){
        return null;
    }

    public void rebind(Name name, Object obj){}

    public void rebind(String name, Object obj){}

    public Object removeFromEnvironment(String propName){
        return null;
    }

    public void rename(Name oldName, Name newName){}

    public void rename(String oldName, String newName){}

    public void unbind(Name name){}

    public void unbind(String name) { }
}
