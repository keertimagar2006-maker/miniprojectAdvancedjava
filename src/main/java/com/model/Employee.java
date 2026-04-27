package com.model;



import java.util.Date;

public class Employee {

    private int empno;
    private String empName;
    private Date doj;
    private String gender;
    private double bsalary;

    public Employee() {}

    public Employee(int empno, String empName, Date doj, String gender, double bsalary) {
        this.empno   = empno;
        this.empName = empName;
        this.doj     = doj;
        this.gender  = gender;
        this.bsalary = bsalary;
    }

    public int    getEmpno()   { return empno;   }
    public String getEmpName() { return empName; }
    public Date   getDoj()     { return doj;     }
    public String getGender()  { return gender;  }
    public double getBsalary() { return bsalary; }

    public void setEmpno(int empno)       { this.empno   = empno;   }
    public void setEmpName(String n)      { this.empName = n;       }
    public void setDoj(Date doj)          { this.doj     = doj;     }
    public void setGender(String gender)  { this.gender  = gender;  }
    public void setBsalary(double salary) { this.bsalary = salary;  }
}