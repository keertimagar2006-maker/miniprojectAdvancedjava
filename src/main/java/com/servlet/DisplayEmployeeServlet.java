package com.servlet;
import com.dao.DBConnection;
import com.model.Employee;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/DisplayEmployeeServlet")
public class DisplayEmployeeServlet extends HttpServlet {
	

	

	
	
	

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String empnoParam = request.getParameter("empno");
	        List<Employee> employees = new ArrayList<>();

	        try {
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps;

	            if (empnoParam != null && !empnoParam.trim().isEmpty()) {
	                // Search by empno
	                int empno = Integer.parseInt(empnoParam.trim());
	                ps = con.prepareStatement(
	                    "SELECT * FROM employee WHERE empno = ?");
	                ps.setInt(1, empno);
	                request.setAttribute("searchInfo", "Showing result for Empno: " + empno);
	            } else {
	                // Show all
	                ps = con.prepareStatement(
	                    "SELECT * FROM employee ORDER BY empno");
	                request.setAttribute("searchInfo", "Showing all employees");
	            }

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                Employee emp = new Employee(
	                    rs.getInt("empno"),
	                    rs.getString("empName"),
	                    rs.getDate("doj"),
	                    rs.getString("gender"),
	                    rs.getDouble("bsalary")
	                );
	                employees.add(emp);
	            }
	            rs.close();
	            ps.close();
	            con.close();

	            if (employees.isEmpty() && empnoParam != null && !empnoParam.trim().isEmpty()) {
	                request.setAttribute("error", "No employee found with Empno: " + empnoParam.trim());
	            }

	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Invalid employee number entered.");
	        } catch (Exception e) {
	            request.setAttribute("error", "Database error: " + e.getMessage());
	        }

	        request.setAttribute("employees", employees);
	        request.getRequestDispatcher("empdisplay.jsp").forward(request, response);
	    }
	
}
