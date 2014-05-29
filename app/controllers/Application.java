package controllers;

import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import play.db.DB;
import play.mvc.Controller;
import play.mvc.Result;
import views.html.index;

public class Application extends Controller {

	public static Result index() throws SQLException {
		DataSource ds = DB.getDataSource();
		java.sql.Connection conn = DB.getConnection();
		java.sql.Statement stmt = conn.createStatement();
		String sql;
		sql = "SELECT ID, ProfName, Password FROM login";
		ResultSet rs = stmt.executeQuery(sql);

		// STEP 5: Extract data from result set
		while (rs.next()) {
			// Retrieve by column name
			int id = rs.getInt("ID");
			String name = rs.getString("ProfName");
			String password = rs.getString("Password");

			// Display values
			System.out.print("ID: " + id);
			System.out.print(", ProfName: " + name);
			System.out.println(", Password: " + password);
		}
		// STEP 6: Clean-up environment
		rs.close();
		stmt.close();
		conn.close();
		return ok(index.render("Your new application is ready."));
	}

}
