/* MVP */

/* Q1 */

SELECT *
FROM employees 
WHERE department = 'Human Resources';

/* Q2 */

SELECT  
      first_name, 
      last_name,
      country,
      department 
FROM employees 
WHERE department = 'Legal';

/* Q3 */

SELECT 
      COUNT(employees) AS sum_employees_based_in_portugal 
FROM employees 
WHERE country = 'Portugal';

/* Q4 */

SELECT 
      COUNT(employees) AS sum_employees_based_in_portugal_or_spain
FROM employees 
WHERE country = 'Portugal' OR country = 'Spain';

/* Q5 */

SELECT 
      COUNT(pay_detail_id) AS sum_pay_details_lacking
FROM employees, pay_details 
WHERE local_account_no IS NULL;

/* Q6 */

SELECT 
      COUNT(pay_detail_id) AS sum_pay_details_lacking_both
FROM employees, pay_details 
WHERE local_account_no IS NULL AND iban IS NULL;

/* Q7 */

SELECT 
	first_name,
	last_name
FROM employees 
ORDER BY last_name NULLS LAST;

/* Q8 */

SELECT 
	first_name,
	last_name,
	country 
FROM employees 
ORDER BY country NULLS LAST,
		 last_name NULLS LAST;
		 
/* Q9 */

SELECT *
FROM employees
ORDER BY
	salary DESC NULLS LAST
LIMIT 10;

/* Q10 */

SELECT
	first_name,
	last_name,
	salary 
FROM employees
WHERE country = 'Hungary'
ORDER BY
	salary
LIMIT 1;

/* Q11 */

SELECT 
	COUNT(id) AS sum
FROM employees 
WHERE first_name LIKE 'F%';

/* Q12 */

SELECT *
FROM employees 
WHERE email LIKE '%@yahoo%';

/* Q13 */

SELECT 
	COUNT(*) 
FROM employees 
WHERE country NOT IN ('france', 'germany') AND pension_enrol = TRUE

/* Q14 */

SELECT
	AVG(salary) AS average_salary
FROM employees 
WHERE country NOT IN ('france', 'germany') AND 
	  pension_enrol = TRUE AND 
	  department = 'Engineering' AND
	  fte_hours = 1;

/* Q15 */
	 
SELECT
	first_name,
	last_name,
	fte_hours,
	salary,
	SUM(salary * fte_hours) AS effective_yearly_salary
FROM employees
WHERE country NOT IN ('france', 'germany') AND 
	  pension_enrol = TRUE AND 
	  department = 'Engineering' AND
	  fte_hours = 1
GROUP BY
	first_name,
	last_name,
	fte_hours,
	salary
-- ALTER TABLE employees
-- RENAME COLUMN fte_hours TO full_time_equivalent_hours;
