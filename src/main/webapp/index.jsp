<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
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
            padding: 50px 40px;
            max-width: 700px;
            width: 90%;
            text-align: center;
            box-shadow: 0 25px 45px rgba(0,0,0,0.3);
        }
        h1 {
            font-size: 2.2em;
            margin-bottom: 10px;
            background: linear-gradient(90deg, #f7971e, #ffd200);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
        }
        .subtitle {
            color: rgba(255,255,255,0.6);
            margin-bottom: 40px;
            font-size: 1em;
        }
        .nav-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }
        .nav-card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 14px;
            padding: 30px 20px;
            text-decoration: none;
            color: #fff;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }
        .nav-card:hover {
            transform: translateY(-5px);
            background: rgba(255,255,255,0.15);
            box-shadow: 0 15px 30px rgba(0,0,0,0.3);
            border-color: rgba(255,255,255,0.3);
        }
        .nav-card .icon {
            font-size: 2.5em;
            margin-bottom: 12px;
            display: block;
        }
        .nav-card .title {
            font-size: 1.15em;
            font-weight: 600;
            margin-bottom: 6px;
        }
        .nav-card .desc {
            font-size: 0.82em;
            color: rgba(255,255,255,0.5);
        }
        .nav-card.add { border-left: 4px solid #00e676; }
        .nav-card.update { border-left: 4px solid #448aff; }
        .nav-card.delete { border-left: 4px solid #ff5252; }
        .nav-card.display { border-left: 4px solid #e040fb; }
        .nav-card.reports {
            grid-column: span 2;
            border-left: 4px solid #ffd740;
        }
        footer {
            margin-top: 35px;
            color: rgba(255,255,255,0.3);
            font-size: 0.8em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>&#128188; Employee Management</h1>
        <p class="subtitle">Java MVC &middot; JSP + Servlet + JDBC + MySQL</p>

        <div class="nav-grid">
            <a href="empadd.jsp" class="nav-card add">
                <span class="icon">&#10133;</span>
                <div class="title">Add Employee</div>
                <div class="desc">Register a new employee record</div>
            </a>
            <a href="empupdate.jsp" class="nav-card update">
                <span class="icon">&#9998;</span>
                <div class="title">Update Employee</div>
                <div class="desc">Modify existing employee details</div>
            </a>
            <a href="empdelete.jsp" class="nav-card delete">
                <span class="icon">&#128465;</span>
                <div class="title">Delete Employee</div>
                <div class="desc">Remove an employee record</div>
            </a>
            <a href="DisplayEmployeeServlet" class="nav-card display">
                <span class="icon">&#128196;</span>
                <div class="title">Display Employees</div>
                <div class="desc">View all or search by Empno</div>
            </a>
            <a href="ReportServlet" class="nav-card reports">
                <span class="icon">&#128202;</span>
                <div class="title">Reports</div>
                <div class="desc">Generate reports &mdash; by name, service years, or salary</div>
            </a>
        </div>

        <footer>&copy; 2026 EmployeeWebApp &mdash; Dynamic Web Project</footer>
    </div>
</body>
</html>
