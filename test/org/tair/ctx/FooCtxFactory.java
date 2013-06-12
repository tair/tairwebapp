package org.tair.ctx;

import javax.naming.*;
import javax.naming.spi.InitialContextFactory;
import java.util.Hashtable;

public class FooCtxFactory implements InitialContextFactory
{
    public Context getInitialContext(Hashtable<?,?> environment) throws NamingException
    {
        return new FooCtx();
    }
}
