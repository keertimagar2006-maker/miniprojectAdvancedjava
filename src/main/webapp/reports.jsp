<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reports</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;display:flex;align-items:center;justify-content:center;color:#fff}
.container{background:rgba(255,255,255,.05);backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.1);border-radius:20px;padding:40px;max-width:600px;width:90%;box-shadow:0 25px 45px rgba(0,0,0,.3)}
h2{text-align:center;margin-bottom:10px;background:linear-gradient(90deg,#ffd740,#ffab00);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.8em}
.subtitle{text-align:center;color:rgba(255,255,255,.5);margin-bottom:30px;font-size:.9em}
.msg-error{background:rgba(255,82,82,.15);border:1px solid rgba(255,82,82,.4);color:#ff8a80;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
.report-option{background:rgba(255,255,255,.06);border:1px solid rgba(255,255,255,.1);border-radius:14px;padding:20px;margin-bottom:16px;cursor:pointer;transition:all .3s}
.report-option:hover{background:rgba(255,255,255,.12);border-color:rgba(255,255,255,.25);transform:translateX(5px)}
.report-option .icon{font-size:1.5em;margin-right:12px}
.report-option .title{font-weight:600;font-size:1.05em;margin-bottom:4px}
.report-option .desc{font-size:.82em;color:rgba(255,255,255,.5)}
form{margin:0}
button.report-btn{width:100%;text-align:left;background:none;border:none;color:#fff;cursor:pointer;display:flex;align-items:flex-start;gap:12px;padding:0}
.btn-back{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2);margin-top:20px;text-align:center;text-decoration:none;display:block;padding:12px;border-radius:10px;font-size:.95em;transition:all .3s}
.btn-back:hover{background:rgba(255,255,255,.18)}
</style>
</head>
<body>
<div class="container">
<h2>&#128202; Reports</h2>
<p class="subtitle">Select a report to generate</p>
<%
String error=(String)request.getAttribute("error");
if(error!=null){%><div class="msg-error"><%=error%></div><%}%>

<div class="report-option">
<form action="ReportServlet" method="post">
<input type="hidden" name="reportType" value="nameLetter">
<button type="submit" class="report-btn">
<span class="icon">&#128289;</span>
<div><div class="title">Employees by Name Initial</div>
<div class="desc">Find employees whose name starts with a specific letter</div></div>
</button></form>
</div>

<div class="report-option">
<form action="ReportServlet" method="post">
<input type="hidden" name="reportType" value="yearsOfService">
<button type="submit" class="report-btn">
<span class="icon">&#128197;</span>
<div><div class="title">Employees by Years of Service</div>
<div class="desc">Find employees with N or more years of service</div></div>
</button></form>
</div>

<div class="report-option">
<form action="ReportServlet" method="post">
<input type="hidden" name="reportType" value="salaryAbove">
<button type="submit" class="report-btn">
<span class="icon">&#128176;</span>
<div><div class="title">Employees by Salary</div>
<div class="desc">Find employees earning more than a specified amount</div></div>
</button></form>
</div>

<a href="index.jsp" class="btn-back">&larr; Back to Home</a>
</div>
</body>
</html>
