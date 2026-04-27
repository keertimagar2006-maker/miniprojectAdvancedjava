<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Employee</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;display:flex;align-items:center;justify-content:center;color:#fff}
.container{background:rgba(255,255,255,.05);backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.1);border-radius:20px;padding:40px;max-width:550px;width:90%;box-shadow:0 25px 45px rgba(0,0,0,.3)}
h2{text-align:center;margin-bottom:25px;background:linear-gradient(90deg,#ff5252,#ff8a80);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.8em}
.form-group{margin-bottom:18px}
label{display:block;margin-bottom:6px;color:rgba(255,255,255,.7);font-size:.9em;font-weight:500}
input{width:100%;padding:12px 16px;border:1px solid rgba(255,255,255,.15);border-radius:10px;background:rgba(255,255,255,.08);color:#fff;font-size:1em;outline:none;transition:border-color .3s}
input:focus{border-color:#ff5252;box-shadow:0 0 0 3px rgba(255,82,82,.15)}
.btn{display:block;width:100%;padding:14px;border:none;border-radius:10px;font-size:1.05em;font-weight:600;cursor:pointer;margin-top:10px;transition:all .3s ease}
.btn-search{background:linear-gradient(90deg,#448aff,#2979ff);color:#fff}
.btn-search:hover{transform:translateY(-2px);box-shadow:0 8px 25px rgba(68,138,255,.35)}
.btn-danger{background:linear-gradient(90deg,#ff5252,#d32f2f);color:#fff}
.btn-danger:hover{transform:translateY(-2px);box-shadow:0 8px 25px rgba(255,82,82,.35)}
.btn-back{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2);margin-top:12px;text-align:center;text-decoration:none;display:block;padding:12px;border-radius:10px;font-size:.95em;transition:all .3s}
.btn-back:hover{background:rgba(255,255,255,.18)}
.msg-success{background:rgba(0,230,118,.15);border:1px solid rgba(0,230,118,.4);color:#69f0ae;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
.msg-error{background:rgba(255,82,82,.15);border:1px solid rgba(255,82,82,.4);color:#ff8a80;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
hr.divider{border:none;border-top:1px solid rgba(255,255,255,.1);margin:25px 0}
.emp-details{background:rgba(255,255,255,.06);border:1px solid rgba(255,255,255,.12);border-radius:12px;padding:20px;margin:20px 0}
.emp-details p{margin-bottom:8px;color:rgba(255,255,255,.8)}
.emp-details span{color:#fff;font-weight:600}
</style>
</head>
<body>
<div class="container">
<h2>&#128465; Delete Employee</h2>
<%
String success=(String)request.getAttribute("success");
String error=(String)request.getAttribute("error");
Employee emp=(Employee)request.getAttribute("employee");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
if(success!=null){%><div class="msg-success"><%=success%></div><%}
if(error!=null){%><div class="msg-error"><%=error%></div><%}%>
<form action="DeleteEmployeeServlet" method="get">
<div class="form-group"><label>Enter Employee Number to Delete</label>
<input type="number" name="empno" placeholder="Enter Empno" required></div>
<button type="submit" class="btn btn-search">Find Employee</button>
</form>
<%if(emp!=null){%>
<hr class="divider">
<div class="emp-details">
<p>Empno: <span><%=emp.getEmpno()%></span></p>
<p>Name: <span><%=emp.getEmpName()%></span></p>
<p>Date of Joining: <span><%=sdf.format(emp.getDoj())%></span></p>
<p>Gender: <span><%=emp.getGender()%></span></p>
<p>Salary: <span><%=emp.getBsalary()%></span></p>
</div>
<form action="DeleteEmployeeServlet" method="post" onsubmit="return confirm('Are you sure you want to delete employee <%=emp.getEmpName()%> (Empno: <%=emp.getEmpno()%>)? This action cannot be undone.');">
<input type="hidden" name="empno" value="<%=emp.getEmpno()%>">
<button type="submit" class="btn btn-danger">Confirm Delete</button>
</form>
<%}%>
<a href="index.jsp" class="btn-back">&larr; Back to Home</a>
</div>
</body>
</html>
