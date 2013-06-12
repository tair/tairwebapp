package org.tair.db;
import org.tair.tfc.DBconnection;
import org.tair.tfc.DatabaseManager;
import org.tair.tfc.DBReadManager;
import org.tair.tfc.DBWriteManager;

public class DB
{
	public static DBconnection getRead() {
		try {
			return DBReadManager.getInstance().get_connection();
		} catch(Exception e) {}
		return null;
	}

	public static DBconnection getWrite() {
		try {
			return DBWriteManager.getInstance().get_connection();
		} catch(Exception e) {}
		return null;
	}

	public static void release(DBconnection conn) {
		if(conn != null) try {
		  DBReadManager.return_connection(conn);
		} catch (Exception sqe) {}
	}
}
