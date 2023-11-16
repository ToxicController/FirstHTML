

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PatientScheduling extends HttpServlet{

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException {
        String name = req.getParameter("name");
        System.out.println(name);
    }
    public static void main(String[] args) {

        String url = "jdbc:mysql://localhost:3306/patientscheduling";
        String username = "root";
        String password = "";
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);

            String sql = "SELECT * FROM Patient";
            Statement statement = connection.createStatement();
            ResultSet result = statement.executeQuery(sql);

            while(result.next())
            {
                System.out.println(result.getString(1));
                System.out.println(result.getString(2));
                System.out.println(result.getString(3));
                System.out.println(result.getString(4));
                System.out.println(result.getString(5));
                System.out.println(result.getString(6));
            }
            connection.close();

        } catch(Exception e) {
            System.out.println("Oops, error!");
            e.printStackTrace();
        }
    }
}