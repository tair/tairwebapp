package org.tair.ctx;

import javax.naming.*;

public class TestCtx
{
    public static void main(String args[]) throws Exception {
        InitialContext ctx = new InitialContext();
        System.out.println(ctx);
        System.out.println(ctx.lookup("foo"));
    }
}
