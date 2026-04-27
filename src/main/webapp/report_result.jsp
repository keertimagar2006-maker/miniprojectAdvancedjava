<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Results</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;padding:40px 20px;color:#fff}
.container{max-width:950px;margin:0 auto}
h2{text-align:center;margin-bottom:8px;background:linear-gradient(90deg,#ffd740,#ffab00);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.8em}
.report-title{text-align:center;color:rgba(255,255,255,.6);margin-bottom:8px;font-size:1em}
.result-count{text-align:center;color:rgba(255,255,255,.4);margin-bottom:25px;font-size:.85em}
table{width:100%;border-collapse:collapse;background:rgba(255,255,255,.04);border-radius:14px;overflow:hidden;border:1px solid rgba(255,255,255,.08)}
thead{background:linear-gradient(90deg,#f9a825,#ff8f00)}
th{padding:14px 16px;text-align:left;font-weight:600;font-size:.9em;text-transform:uppercase;letter-spacing:.5px;color:#1a1a2e}
td{padding:12px 16px;border-top:1px solid rgba(255,255,255,.06);font-size:.95em}
tr:hover td{background:rgba(255,255,255,.06)}
.no-data{text-align:center;color:rgba(255,255,255,.4);padding:40px;font-size:1.1em;background:rgba(255,255,255,.04);border-radius:14px;border:1px solid rgba(255,255,255,.08)}
.actions{display:flex;gap:12px;justify-content:center;margin-top:25px}
.actions a{padding:12px 24px;border-radius:10px;text-decoration:none;font-size:.95em;transition:all .3s}
.btn-reports{background:linear-gradient(90deg,#ffd740,#ffab00);color:#1a1a2e;font-weight:600}
.btn-reports:hover{transform:translateY(-2px);box-shadow:0 8px 25px rgba(255,215,64,.35)}
.btn-home{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2)}
.btn-home:hover{background:rgba(255,255,255,.18)}
</style>
</head>
<body>
<div class="container">
<h2>&#128202; Report Results</h2>
<%
String reportTitle=(String)request.getAttribute("reportTitle");
Integer resultCount=(Integer)request.getAttribute("resultCount");
List<Employee> employees=(List<Employee>)request.getAttribute("employees");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
%>
<p class="report-title"><%=reportTitle != null ? reportTitle : ""%></p>
<p class="result-count"><%=resultCount != null ? resultCount : 0%> record(s) found</p>

<%if(employees!=null && !employees.isEmpty()){%>
<table>
<thead><tr><th>Empno</th><th>Name</th><th>Date of Joining</th><th>Gender</th><th>Salary</th></tr></thead>
<tbody>
<%for(int i=0;i<employees.size();i++){Employee e=employees.get(i);%>
<tr>
<td><%=e.getEmpno()%></td>
<td><%=e.getEmpName()%></td>
<td><%=sdf.format(e.getDoj())%></td>
<td><%=e.getGender()%></td>
<td><%=String.format("%.2f",e.getBsalary())%></td>
</tr>
<%}%>
</tbody>
</table>
<%}else{%>
<div class="no-data">No records match the specified criteria.</div>
<%}%>

<div class="actions">
<a href="ReportServlet" class="btn-reports">&#128202; More Reports</a>
<a href="index.jsp" class="btn-home">&larr; Back to Home</a>
</div>
</div>
</body>
</html>
