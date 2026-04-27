<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Employees</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;padding:40px 20px;color:#fff}
.container{max-width:950px;margin:0 auto}
h2{text-align:center;margin-bottom:25px;background:linear-gradient(90deg,#e040fb,#ea80fc);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.8em}
.search-box{background:rgba(255,255,255,.05);border:1px solid rgba(255,255,255,.1);border-radius:14px;padding:20px;margin-bottom:25px;display:flex;gap:12px;align-items:flex-end}
.search-box .form-group{flex:1}
.search-box label{display:block;margin-bottom:6px;color:rgba(255,255,255,.7);font-size:.85em}
.search-box input{width:100%;padding:10px 14px;border:1px solid rgba(255,255,255,.15);border-radius:8px;background:rgba(255,255,255,.08);color:#fff;font-size:1em;outline:none}
.search-box input:focus{border-color:#e040fb}
.search-box button{padding:10px 24px;border:none;border-radius:8px;background:linear-gradient(90deg,#e040fb,#d500f9);color:#fff;font-weight:600;cursor:pointer;transition:all .3s;white-space:nowrap}
.search-box button:hover{transform:translateY(-2px);box-shadow:0 8px 20px rgba(224,64,251,.3)}
.search-box a{padding:10px 20px;border:1px solid rgba(255,255,255,.2);border-radius:8px;color:#fff;text-decoration:none;font-size:.9em;transition:all .3s;white-space:nowrap}
.search-box a:hover{background:rgba(255,255,255,.1)}
.info{text-align:center;color:rgba(255,255,255,.5);margin-bottom:15px;font-size:.9em}
table{width:100%;border-collapse:collapse;background:rgba(255,255,255,.04);border-radius:14px;overflow:hidden;border:1px solid rgba(255,255,255,.08)}
thead{background:linear-gradient(90deg,#7c4dff,#651fff)}
th{padding:14px 16px;text-align:left;font-weight:600;font-size:.9em;text-transform:uppercase;letter-spacing:.5px}
td{padding:12px 16px;border-top:1px solid rgba(255,255,255,.06);font-size:.95em}
tr:hover td{background:rgba(255,255,255,.06)}
.msg-error{background:rgba(255,82,82,.15);border:1px solid rgba(255,82,82,.4);color:#ff8a80;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
.no-data{text-align:center;color:rgba(255,255,255,.4);padding:40px;font-size:1.1em}
.btn-back{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2);margin-top:25px;text-align:center;text-decoration:none;display:block;padding:12px;border-radius:10px;font-size:.95em;transition:all .3s;max-width:200px;margin-left:auto;margin-right:auto}
.btn-back:hover{background:rgba(255,255,255,.18)}
</style>
</head>
<body>
<div class="container">
<h2>&#128196; Employee Records</h2>
<%
String error=(String)request.getAttribute("error");
String searchInfo=(String)request.getAttribute("searchInfo");
List<Employee> employees=(List<Employee>)request.getAttribute("employees");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
if(error!=null){%><div class="msg-error"><%=error%></div><%}%>
<div class="search-box">
<form action="DisplayEmployeeServlet" method="get" style="display:flex;gap:12px;width:100%;align-items:flex-end">
<div class="form-group"><label>Search by Employee Number</label>
<input type="number" name="empno" placeholder="Enter Empno"></div>
<button type="submit">Search</button>
</form>
<a href="DisplayEmployeeServlet">Show All</a>
</div>
<%if(searchInfo!=null){%><p class="info"><%=searchInfo%></p><%}%>
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
<%}else if(error==null){%><div class="no-data">No employee records found.</div><%}%>
<a href="index.jsp" class="btn-back">&larr; Back to Home</a>
</div>
</body>
</html>
