#BUSINESS INTELLEGANCE TASKS FROM SECTION 20 and beyond...
# TASK 1 + Tableau reference lectures
/*SELECT 
    year(dm.from_date) as year_date, e.gender, count(e.emp_no) as number_of_workers
FROM
    t_employees e
        JOIN
    t_dept_emp dm ON e.emp_no = dm.emp_no
#where dm.from_date > 1960
GROUP BY year(dm.from_date), e.gender
having year_date >= 1990
ORDER BY dm.from_date;*/
# TASK 2 + tableau reference lectures
/*SELECT 
    d.dept_name AS department,
    ee.gender,
    k.emp_no AS worker_ID,
    k.from_date AS start_date,
    k.to_date AS 'current_date',
    e.calender_year,
    CASE
        WHEN
            YEAR(k.from_date) >= e.calender_year
                AND YEAR(k.from_date) <= e.calender_year
        THEN
            1
        ELSE 0
    END AS _active
FROM
    (SELECT 
        YEAR(hire_date) AS calender_year
    FROM
        t_employees
    GROUP BY calender_year) e
        CROSS JOIN
    t_dept_manager k
        JOIN
    t_departments d ON d.dept_no = k.dept_no
        JOIN
    t_employees ee ON k.emp_no = ee.emp_no
ORDER BY calender_year, k.emp_no;*/


SELECT 
    year(s.from_date) as year_date, e.gender, round(avg(s.salary),2) as salary, d.dept_name
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
		join
	t_dept_emp dm on e.emp_no = dm.emp_no
		join
	t_departments d on dm.dept_no = d.dept_no
GROUP BY d.dept_no, e.gender, year(dm.from_date) 
having year_date <= 2002
ORDER BY d.dept_no;