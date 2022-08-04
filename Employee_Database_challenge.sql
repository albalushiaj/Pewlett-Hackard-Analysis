--Deliverable 1
SELECT e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as e
left join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') --and to_date = '9999-01-01'
ORDER BY e.emp_no;
select * from retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON(e.emp_no) e.emp_no, e.first_name, e.last_name, ti.title, ti.from_date, ti.to_date
INTO unique_titles
FROM employees as e
left join titles as ti
on e.emp_no = ti.emp_no
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31') and to_date = '9999-01-01'
ORDER BY e.emp_no;
select * from unique_titles;

Select count(*), title 
from unique_titles
group by title
order by count DESC;

--requirement 2
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	ti.title
INTO mentorship_eligibility
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	AND (de.to_date = '9999-01-01')
ORDER BY emp_no;