package com.dao;
import com.model.Employee;

import java.sql.*;
import java.util.*;

public class EmployeeDAO {
	

	

	    // ─────────────────────────────────────────
	    // INSERT - Add new employee
	    // ─────────────────────────────────────────
	    public boolean addEmployee(Employee emp) throws Exception {
	        Connection con = DBConnection.getConnection();
	        String sql = "INSERT INTO employee (empno, empName, doj, gender, bsalary) VALUES (?, ?, ?, ?, ?)";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ps.setInt(1, emp.getEmpno());
	        ps.setString(2, emp.getEmpName());
	        ps.setDate(3, new java.sql.Date(emp.getDoj().getTime()));
	        ps.setString(4, emp.getGender());
	        ps.setDouble(5, emp.getBsalary());
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    }

	    // ─────────────────────────────────────────
	    // SELECT ALL - Get all employees
	    // ─────────────────────────────────────────
	    public List<Employee> getAllEmployees() throws Exception {
	        List<Employee> list = new ArrayList<>();
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM employee ORDER BY empno");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(mapRow(rs));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return list;
	    }

	    // ─────────────────────────────────────────
	    // SELECT ONE - Get employee by empno
	    // ─────────────────────────────────────────
	    public Employee getEmployeeById(int empno) throws Exception {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM employee WHERE empno = ?");
	        ps.setInt(1, empno);
	        ResultSet rs = ps.executeQuery();
	        Employee emp = null;
	        if (rs.next()) {
	            emp = mapRow(rs);
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return emp;
	    }

	    // ─────────────────────────────────────────
	    // UPDATE - Update employee details
	    // ─────────────────────────────────────────
	    public boolean updateEmployee(Employee emp) throws Exception {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "UPDATE employee SET empName=?, doj=?, gender=?, bsalary=? WHERE empno=?");
	        ps.setString(1, emp.getEmpName());
	        ps.setDate(2, new java.sql.Date(emp.getDoj().getTime()));
	        ps.setString(3, emp.getGender());
	        ps.setDouble(4, emp.getBsalary());
	        ps.setInt(5, emp.getEmpno());
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    }

	    // ─────────────────────────────────────────
	    // DELETE - Delete employee by empno
	    // ─────────────────────────────────────────
	    public boolean deleteEmployee(int empno) throws Exception {
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "DELETE FROM employee WHERE empno = ?");
	        ps.setInt(1, empno);
	        int rows = ps.executeUpdate();
	        ps.close();
	        con.close();
	        return rows > 0;
	    }

	    // ─────────────────────────────────────────
	    // REPORT 1 - Employees by name initial
	    // ─────────────────────────────────────────
	    public List<Employee> getEmployeesByNameLetter(String letter) throws Exception {
	        List<Employee> list = new ArrayList<>();
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM employee WHERE empName LIKE ? ORDER BY empName");
	        ps.setString(1, letter.toUpperCase() + "%");
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(mapRow(rs));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return list;
	    }

	    // ─────────────────────────────────────────
	    // REPORT 2 - Employees by years of service
	    // ─────────────────────────────────────────
	    public List<Employee> getEmployeesByYearsOfService(int years) throws Exception {
	        List<Employee> list = new ArrayList<>();
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM employee " +
	            "WHERE TIMESTAMPDIFF(YEAR, doj, CURDATE()) >= ? " +
	            "ORDER BY doj ASC");
	        ps.setInt(1, years);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(mapRow(rs));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return list;
	    }

	    // ─────────────────────────────────────────
	    // REPORT 3 - Employees by salary above amount
	    // ─────────────────────────────────────────
	    public List<Employee> getEmployeesBySalaryAbove(double salary) throws Exception {
	        List<Employee> list = new ArrayList<>();
	        Connection con = DBConnection.getConnection();
	        PreparedStatement ps = con.prepareStatement(
	            "SELECT * FROM employee WHERE bsalary > ? ORDER BY bsalary DESC");
	        ps.setDouble(1, salary);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            list.add(mapRow(rs));
	        }
	        rs.close();
	        ps.close();
	        con.close();
	        return list;
	    }

	    // ─────────────────────────────────────────
	    // HELPER - Map ResultSet row to Employee object
	    // ─────────────────────────────────────────
	    private Employee mapRow(ResultSet rs) throws SQLException {
	        return new Employee(
	            rs.getInt("empno"),
	            rs.getString("empName"),
	            rs.getDate("doj"),
	            rs.getString("gender"),
	            rs.getDouble("bsalary")
	        );
	    }
	}

