package com.servlet;
import com.dao.DBConnection;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/ReportCriteriaServlet")
public class ReportCriteriaServlet extends HttpServlet {
	 @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");

	        String reportType     = request.getParameter("reportType");
	        String criteriaValue  = request.getParameter("criteriaValue");
	        List<Employee> employees = new ArrayList<>();
	        String reportTitle = "";

	        try {
	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = null;

	            if ("nameLetter".equals(reportType)) {
	                String letter = criteriaValue.trim().toUpperCase();
	                reportTitle = "Employees whose name starts with '" + letter + "'";
	                ps = con.prepareStatement(
	                    "SELECT * FROM employee WHERE empName LIKE ? ORDER BY empName");
	                ps.setString(1, letter + "%");

	            } else if ("yearsOfService".equals(reportType)) {
	                int years = Integer.parseInt(criteriaValue.trim());
	                reportTitle = "Employees with " + years + " or more years of service";
	                ps = con.prepareStatement(
	                    "SELECT * FROM employee " +
	                    "WHERE TIMESTAMPDIFF(YEAR, doj, CURDATE()) >= ? " +
	                    "ORDER BY doj ASC");
	                ps.setInt(1, years);

	            } else if ("salaryAbove".equals(reportType)) {
	                double salary = Double.parseDouble(criteriaValue.trim());
	                reportTitle = "Employees with salary above " + salary;
	                ps = con.prepareStatement(
	                    "SELECT * FROM employee WHERE bsalary > ? ORDER BY bsalary DESC");
	                ps.setDouble(1, salary);

	            } else {
	                request.setAttribute("error", "Unknown report type.");
	                request.getRequestDispatcher("reports.jsp").forward(request, response);
	                return;
	            }

	            ResultSet rs = ps.executeQuery();
	            while (rs.next()) {
	                employees.add(new Employee(
	                    rs.getInt("empno"),
	                    rs.getString("empName"),
	                    rs.getDate("doj"),
	                    rs.getString("gender"),
	                    rs.getDouble("bsalary")
	                ));
	            }
	            rs.close();
	            ps.close();
	            con.close();

	        } catch (NumberFormatException e) {
	            request.setAttribute("error", "Please enter a valid number.");
	            request.setAttribute("reportType", reportType);
	            request.getRequestDispatcher("report_form.jsp").forward(request, response);
	            return;
	        } catch (Exception e) {
	            request.setAttribute("error", "Database error: " + e.getMessage());
	            request.getRequestDispatcher("reports.jsp").forward(request, response);
	            return;
	        }

	        request.setAttribute("employees",   employees);
	        request.setAttribute("reportTitle", reportTitle);
	        request.setAttribute("resultCount", employees.size());
	        request.getRequestDispatcher("report_result.jsp").forward(request, response);
	    }
	
}
