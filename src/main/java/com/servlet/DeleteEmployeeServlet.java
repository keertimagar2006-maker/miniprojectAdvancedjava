package com.servlet;
import com.dao.DBConnection;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DeleteEmployeeServlet")
public class DeleteEmployeeServlet extends HttpServlet{
	

	
	

	    // GET: fetch employee to confirm before deleting
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String empnoParam = request.getParameter("empno");

	        try {
	            int empno = Integer.parseInt(empnoParam.trim());
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                "SELECT * FROM employee WHERE empno = ?");
	            ps.setInt(1, empno);
	            ResultSet rs = ps.executeQuery();

	            if (rs.next()) {
	                Employee emp = new Employee(
	                    rs.getInt("empno"),
	                    rs.getString("empName"),
	                    rs.getDate("doj"),
	                    rs.getString("gender"),
	                    rs.getDouble("bsalary")
	                );
	                request.setAttribute("employee", emp);
	            } else {
	                request.setAttribute("error", "No employee found with Empno: " + empno);
	            }
	            rs.close();
	            ps.close();
	            con.close();

	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Invalid employee number.");
	        } catch (Exception e) {
	            request.setAttribute("error", "Database error: " + e.getMessage());
	        }

	        request.getRequestDispatcher("empdelete.jsp").forward(request, response);
	    }

	    // POST: confirm and delete
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String empnoParam = request.getParameter("empno");

	        try {
	            int empno = Integer.parseInt(empnoParam.trim());
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                "DELETE FROM employee WHERE empno = ?");
	            ps.setInt(1, empno);
	            int rows = ps.executeUpdate();
	            ps.close();
	            con.close();

	            if (rows > 0) {
	                request.setAttribute("success", "Employee deleted successfully!");
	            } else {
	                request.setAttribute("error", "Employee not found.");
	            }

	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Invalid employee number.");
	        } catch (Exception e) {
	            request.setAttribute("error", "Error: " + e.getMessage());
	        }

	        request.getRequestDispatcher("empdelete.jsp").forward(request, response);
	    }
	
}
