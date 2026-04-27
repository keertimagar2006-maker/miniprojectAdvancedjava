<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Criteria</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;display:flex;align-items:center;justify-content:center;color:#fff}
.container{background:rgba(255,255,255,.05);backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.1);border-radius:20px;padding:40px;max-width:500px;width:90%;box-shadow:0 25px 45px rgba(0,0,0,.3)}
h2{text-align:center;margin-bottom:10px;background:linear-gradient(90deg,#ffd740,#ffab00);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.6em}
.report-desc{text-align:center;color:rgba(255,255,255,.6);margin-bottom:25px;font-size:.9em}
.form-group{margin-bottom:18px}
label{display:block;margin-bottom:6px;color:rgba(255,255,255,.7);font-size:.9em;font-weight:500}
input{width:100%;padding:12px 16px;border:1px solid rgba(255,255,255,.15);border-radius:10px;background:rgba(255,255,255,.08);color:#fff;font-size:1em;outline:none;transition:border-color .3s}
input:focus{border-color:#ffd740;box-shadow:0 0 0 3px rgba(255,215,64,.15)}
.btn{display:block;width:100%;padding:14px;border:none;border-radius:10px;font-size:1.05em;font-weight:600;cursor:pointer;margin-top:10px;transition:all .3s ease;background:linear-gradient(90deg,#ffd740,#ffab00);color:#1a1a2e}
.btn:hover{transform:translateY(-2px);box-shadow:0 8px 25px rgba(255,215,64,.35)}
.btn-back{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2);margin-top:12px;text-align:center;text-decoration:none;display:block;padding:12px;border-radius:10px;font-size:.95em;transition:all .3s}
.btn-back:hover{background:rgba(255,255,255,.18)}
.msg-error{background:rgba(255,82,82,.15);border:1px solid rgba(255,82,82,.4);color:#ff8a80;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
</style>
</head>
<body>
<div class="container">
<h2>&#128202; Report Criteria</h2>
<%
String reportType=(String)request.getAttribute("reportType");
if(reportType==null) reportType=request.getParameter("reportType");
String error=(String)request.getAttribute("error");
String labelText="Enter value";
String placeholder="";
String inputType="text";
String reportDesc="";

if("nameLetter".equals(reportType)){
    labelText="Enter Starting Letter";
    placeholder="e.g. A";
    reportDesc="Find employees whose name starts with a specific letter";
}else if("yearsOfService".equals(reportType)){
    labelText="Minimum Years of Service";
    placeholder="e.g. 5";
    inputType="number";
    reportDesc="Find employees with N or more years of service";
}else if("salaryAbove".equals(reportType)){
    labelText="Minimum Salary Amount";
    placeholder="e.g. 50000";
    inputType="number";
    reportDesc="Find employees earning more than the specified salary";
}
if(error!=null){%><div class="msg-error"><%=error%></div><%}%>
<p class="report-desc"><%=reportDesc%></p>
<form action="ReportCriteriaServlet" method="post" onsubmit="return validateCriteria()">
<input type="hidden" name="reportType" value="<%=reportType%>">
<div class="form-group">
<label for="criteriaValue"><%=labelText%></label>
<input type="<%=inputType%>" id="criteriaValue" name="criteriaValue" placeholder="<%=placeholder%>" required>
</div>
<button type="submit" class="btn">Generate Report</button>
</form>
<a href="ReportServlet" class="btn-back">&larr; Back to Reports</a>
</div>
<script>
function validateCriteria(){
var v=document.getElementById('criteriaValue').value.trim();
if(v===''){alert('Please enter a value.');return false;}
return true;
}
</script>
</body>
</html>
