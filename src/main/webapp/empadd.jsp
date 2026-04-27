<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Employee</title>
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #fff;
        }
        .container {
            background: rgba(255,255,255,0.05);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 20px;
            padding: 40px;
            max-width: 550px;
            width: 90%;
            box-shadow: 0 25px 45px rgba(0,0,0,0.3);
        }
        h2 {
            text-align: center;
            margin-bottom: 25px;
            background: linear-gradient(90deg, #00e676, #69f0ae);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-size: 1.8em;
        }
        .form-group { margin-bottom: 18px; }
        label {
            display: block;
            margin-bottom: 6px;
            color: rgba(255,255,255,0.7);
            font-size: 0.9em;
            font-weight: 500;
        }
        input, select {
            width: 100%;
            padding: 12px 16px;
            border: 1px solid rgba(255,255,255,0.15);
            border-radius: 10px;
            background: rgba(255,255,255,0.08);
            color: #fff;
            font-size: 1em;
            outline: none;
            transition: border-color 0.3s;
        }
        input:focus, select:focus {
            border-color: #00e676;
            box-shadow: 0 0 0 3px rgba(0,230,118,0.15);
        }
        select option { background: #302b63; color: #fff; }
        .btn {
            display: block;
            width: 100%;
            padding: 14px;
            border: none;
            border-radius: 10px;
            font-size: 1.05em;
            font-weight: 600;
            cursor: pointer;
            margin-top: 10px;
            transition: all 0.3s ease;
        }
        .btn-primary {
            background: linear-gradient(90deg, #00e676, #00c853);
            color: #0f0c29;
        }
        .btn-primary:hover { transform: translateY(-2px); box-shadow: 0 8px 25px rgba(0,230,118,0.35); }
        .btn-back {
            background: rgba(255,255,255,0.1);
            color: #fff;
            border: 1px solid rgba(255,255,255,0.2);
            margin-top: 12px;
            text-align: center;
            text-decoration: none;
            display: block;
            padding: 12px;
            border-radius: 10px;
            font-size: 0.95em;
            transition: all 0.3s;
        }
        .btn-back:hover { background: rgba(255,255,255,0.18); }
        .msg-success {
            background: rgba(0,230,118,0.15);
            border: 1px solid rgba(0,230,118,0.4);
            color: #69f0ae;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
        }
        .msg-error {
            background: rgba(255,82,82,0.15);
            border: 1px solid rgba(255,82,82,0.4);
            color: #ff8a80;
            padding: 12px 16px;
            border-radius: 10px;
            margin-bottom: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>&#10133; Add Employee</h2>

        <%
            String success = (String) request.getAttribute("success");
            String error = (String) request.getAttribute("error");
            if (success != null) {
        %>
            <div class="msg-success"><%= success %></div>
        <% } if (error != null) { %>
            <div class="msg-error"><%= error %></div>
        <% } %>

        <form action="AddEmployeeServlet" method="post" onsubmit="return validateForm()">
            <div class="form-group">
                <label for="empno">Employee Number</label>
                <input type="number" id="empno" name="empno" placeholder="e.g. 101" required>
            </div>
            <div class="form-group">
                <label for="empName">Employee Name</label>
                <input type="text" id="empName" name="empName" placeholder="e.g. John Smith" required>
            </div>
            <div class="form-group">
                <label for="doj">Date of Joining</label>
                <input type="date" id="doj" name="doj" required>
            </div>
            <div class="form-group">
                <label for="gender">Gender</label>
                <select id="gender" name="gender" required>
                    <option value="">-- Select Gender --</option>
                    <option value="Male">Male</option>
                    <option value="Female">Female</option>
                    <option value="Other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="bsalary">Basic Salary</label>
                <input type="text" id="bsalary" name="bsalary" placeholder="e.g. 45000.00" required>
            </div>
            <button type="submit" class="btn btn-primary">Add Employee</button>
        </form>
        <a href="index.jsp" class="btn-back">&larr; Back to Home</a>
    </div>

    <script>
        function validateForm() {
            var empno = document.getElementById('empno').value.trim();
            var empName = document.getElementById('empName').value.trim();
            var doj = document.getElementById('doj').value.trim();
            var gender = document.getElementById('gender').value;
            var bsalary = document.getElementById('bsalary').value.trim();

            if (empno === '' || empName === '' || doj === '' || gender === '' || bsalary === '') {
                alert('All fields are required!');
                return false;
            }
            if (isNaN(empno) || parseInt(empno) <= 0) {
                alert('Employee Number must be a positive integer.');
                return false;
            }
            if (isNaN(bsalary) || parseFloat(bsalary) < 0) {
                alert('Salary must be a valid non-negative number.');
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
