<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.Employee" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Employee</title>
<style>
*{margin:0;padding:0;box-sizing:border-box}
body{font-family:'Segoe UI',Tahoma,sans-serif;background:linear-gradient(135deg,#0f0c29,#302b63,#24243e);min-height:100vh;display:flex;align-items:center;justify-content:center;color:#fff}
.container{background:rgba(255,255,255,.05);backdrop-filter:blur(10px);border:1px solid rgba(255,255,255,.1);border-radius:20px;padding:40px;max-width:550px;width:90%;box-shadow:0 25px 45px rgba(0,0,0,.3)}
h2{text-align:center;margin-bottom:25px;background:linear-gradient(90deg,#448aff,#82b1ff);-webkit-background-clip:text;-webkit-text-fill-color:transparent;font-size:1.8em}
.form-group{margin-bottom:18px}
label{display:block;margin-bottom:6px;color:rgba(255,255,255,.7);font-size:.9em;font-weight:500}
input,select{width:100%;padding:12px 16px;border:1px solid rgba(255,255,255,.15);border-radius:10px;background:rgba(255,255,255,.08);color:#fff;font-size:1em;outline:none;transition:border-color .3s}
input:focus,select:focus{border-color:#448aff;box-shadow:0 0 0 3px rgba(68,138,255,.15)}
input[readonly]{opacity:.6;cursor:not-allowed}
select option{background:#302b63;color:#fff}
.btn{display:block;width:100%;padding:14px;border:none;border-radius:10px;font-size:1.05em;font-weight:600;cursor:pointer;margin-top:10px;transition:all .3s ease;background:linear-gradient(90deg,#448aff,#2979ff);color:#fff}
.btn:hover{transform:translateY(-2px);box-shadow:0 8px 25px rgba(68,138,255,.35)}
.btn-back{background:rgba(255,255,255,.1);color:#fff;border:1px solid rgba(255,255,255,.2);margin-top:12px;text-align:center;text-decoration:none;display:block;padding:12px;border-radius:10px;font-size:.95em;transition:all .3s}
.btn-back:hover{background:rgba(255,255,255,.18)}
.msg-success{background:rgba(0,230,118,.15);border:1px solid rgba(0,230,118,.4);color:#69f0ae;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
.msg-error{background:rgba(255,82,82,.15);border:1px solid rgba(255,82,82,.4);color:#ff8a80;padding:12px 16px;border-radius:10px;margin-bottom:20px;text-align:center}
hr.divider{border:none;border-top:1px solid rgba(255,255,255,.1);margin:25px 0}
</style>
</head>
<body>
<div class="container">
<h2>&#9998; Update Employee</h2>
<%
String success=(String)request.getAttribute("success");
String error=(String)request.getAttribute("error");
Employee emp=(Employee)request.getAttribute("employee");
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
if(success!=null){%><div class="msg-success"><%=success%></div><%}
if(error!=null){%><div class="msg-error"><%=error%></div><%}%>
<form action="UpdateEmployeeServlet" method="get">
<div class="form-group"><label>Search Employee by Number</label>
<input type="number" name="empno" placeholder="Enter Empno to fetch" required></div>
<button type="submit" class="btn">Fetch Employee</button>
</form>
<%if(emp!=null){%>
<hr class="divider">
<form action="UpdateEmployeeServlet" method="post" onsubmit="return validateForm()">
<div class="form-group"><label>Employee Number</label>
<input type="number" id="empno" name="empno" value="<%=emp.getEmpno()%>" readonly></div>
<div class="form-group"><label>Employee Name</label>
<input type="text" id="empName" name="empName" value="<%=emp.getEmpName()%>" required></div>
<div class="form-group"><label>Date of Joining</label>
<input type="date" id="doj" name="doj" value="<%=sdf.format(emp.getDoj())%>" required></div>
<div class="form-group"><label>Gender</label>
<select id="gender" name="gender" required>
<option value="Male" <%="Male".equals(emp.getGender())?"selected":""%>>Male</option>
<option value="Female" <%="Female".equals(emp.getGender())?"selected":""%>>Female</option>
<option value="Other" <%="Other".equals(emp.getGender())?"selected":""%>>Other</option>
</select></div>
<div class="form-group"><label>Basic Salary</label>
<input type="text" id="bsalary" name="bsalary" value="<%=emp.getBsalary()%>" required></div>
<button type="submit" class="btn">Update Employee</button>
</form>
<%}%>
<a href="index.jsp" class="btn-back">&larr; Back to Home</a>
</div>
<script>
function validateForm(){
var n=document.getElementById('empName').value.trim();
var d=document.getElementById('doj').value.trim();
var g=document.getElementById('gender').value;
var s=document.getElementById('bsalary').value.trim();
if(n===''||d===''||g===''||s===''){alert('All fields are required!');return false;}
if(isNaN(s)||parseFloat(s)<0){alert('Salary must be a valid non-negative number.');return false;}
return true;
}
</script>
</body>
</html>
