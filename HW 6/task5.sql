-- 1
SELECT 
    s.first_name,
    s.surname,
    b.bill_date,
    COUNT(*) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(*) >= 2;

-- 2
SELECT 
    rt.room_name,
    COUNT(*) AS number_of_tables
FROM restRest_table rt
WHERE rt.no_of_seats > 6
GROUP BY rt.room_name;

-- 3
SELECT 
    rm.room_name,
    SUM(b.bill_total) AS total_bills
FROM restRoom_management rm
JOIN restRest_table rt ON rm.room_name = rt.room_name
JOIN restBill b ON rt.table_no = b.table_no
GROUP BY rm.room_name;

-- 4
SELECT 
    s.first_name,
    s.surname,
    SUM(b.bill_total) AS total_bills
FROM restStaff s
JOIN restStaff ws ON s.staff_no = ws.headwaiter  
JOIN restBill b ON ws.staff_no = b.waiter_no    
GROUP BY s.staff_no
ORDER BY total_bills DESC;

-- 5
SELECT 
    b.cust_name,
    AVG(b.bill_total) AS average_spent
FROM restBill b
GROUP BY b.cust_name
HAVING AVG(b.bill_total) > 400;

-- 6
SELECT 
    s.first_name,
    s.surname,
    b.bill_date,
    COUNT(*) AS number_of_bills
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
GROUP BY s.staff_no, b.bill_date
HAVING COUNT(*) >= 3;