package org.tair.abrc;
import java.sql.ResultSet;
//import org.tair.db.WriteConn;
import org.tair.tfc.DBconnection;

public class DBTest
{
	public static void main(String args[]) throws Exception
	{
/*		System.out.println(WriteConn.get());
		DBconnection conn = WriteConn.get();
		conn.setQuery("INSERT INTO tempdb..PendingOrderNN (person_id,organization_id) VALUES (?,?)");
		conn.setQueryVariable(1, new Long(45));
		conn.setQueryVariable(2, getId());
		conn.executeUpdate();
	}

	public static Long getId() throws Exception
	{
		DBconnection conn = WriteConn.get();
		conn.setQuery("SELECT person_id FROM tempdb..PendingOrderNN");
		ResultSet rs = conn.getResultSet();
		if(rs.next())
			return rs.getLong("person_id");
		return null;
*/	}
}
