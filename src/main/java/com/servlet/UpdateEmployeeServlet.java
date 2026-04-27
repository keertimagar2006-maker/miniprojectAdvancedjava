package com.servlet;
import com.dao.DBConnection;
import com.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/UpdateEmployeeServlet")
public class UpdateEmployeeServlet extends HttpServlet{
	// GET: fetch employee by empno and show in form
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

	        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
	    }

	    // POST: save updated details
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        request.setCharacterEncoding("UTF-8");

	        String empnoStr  = request.getParameter("empno");
	        String empName   = request.getParameter("empName");
	        String doj       = request.getParameter("doj");
	        String gender    = request.getParameter("gender");
	        String salaryStr = request.getParameter("bsalary");

	        try {
	            int    empno   = Integer.parseInt(empnoStr.trim());
	            double bsalary = Double.parseDouble(salaryStr.trim());

	            Connection con = DBConnection.getConnection();
	            PreparedStatement ps = con.prepareStatement(
	                "UPDATE employee SET empName=?, doj=?, gender=?, bsalary=? WHERE empno=?");
	            ps.setString(1, empName.trim());
	            ps.setDate(2, Date.valueOf(doj));
	            ps.setString(3, gender);
	            ps.setDouble(4, bsalary);
	            ps.setInt(5, empno);

	            int rows = ps.executeUpdate();
	            ps.close();
	            con.close();

	            if (rows > 0) {
	                request.setAttribute("success", "Employee updated successfully!");
	            } else {
	                request.setAttribute("error", "Employee not found.");
	            }

	        } catch (Exception e) {
	            request.setAttribute("error", "Error: " + e.getMessage());
	        }

	        request.getRequestDispatcher("empupdate.jsp").forward(request, response);
	    }
	}

