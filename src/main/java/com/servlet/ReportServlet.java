package com.servlet;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
@WebServlet("/ReportServlet")
public class ReportServlet extends HttpServlet {
	

	
	

	    // GET: landing page for reports menu
	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        request.getRequestDispatcher("reports.jsp").forward(request, response);
	    }

	    // POST: user selected a report type, go to form to enter criteria
	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String reportType = request.getParameter("reportType");

	        if (reportType == null || reportType.trim().isEmpty()) {
	            request.setAttribute("error", "Please select a valid report type.");
	            request.getRequestDispatcher("reports.jsp").forward(request, response);
	            return;
	        }

	        request.setAttribute("reportType", reportType);
	        request.getRequestDispatcher("report_form.jsp").forward(request, response);
	    }
	
}
