package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnection {
	
	String url = "jdbc:mysql://45.76.223.233:3306/jspdemodb_account?useSSL=false";
	String username = "root";
	String password = "root";
	
    private Connection connection;
	

	public DBconnection() throws InstantiationException, IllegalAccessException {
		// TODO Auto-generated constructor stub
		
		
		try
        {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException e)
        {
            // TODO Auto-generated catch block
        	e.printStackTrace();
           
        }
		
	}
	
	public Connection getConnection()
    {
        return connection;
    }

	
	
	public void close()
    {
        if(connection !=null)
        {
            try
            {
            	connection.close();
            } catch (SQLException e)
            {
                // TODO Auto-generated catch block
                System.out.println("数据库连接关闭失败");
            }
        }
    }
}
