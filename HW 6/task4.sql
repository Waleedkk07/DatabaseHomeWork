-- 1
SELECT DISTINCT b.cust_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
WHERE b.bill_total > 450.00
AND s.headwaiter = (
    SELECT staff_no
    FROM restStaff
    WHERE first_name = 'Charles'
);

-- 2
SELECT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT rm.headwaiter
    FROM restRoom_management rm
    JOIN restRest_table rt ON rm.room_name = rt.room_name
    JOIN restBill b ON b.table_no = rt.table_no
    WHERE b.cust_name = 'Nerida Smith' 
    AND b.bill_date = 160111
    AND b.table_no = rt.table_no
    AND rm.room_date = 160111
    -- If there are multiple possible headwaiters, ensure only one match is found
    GROUP BY rm.headwaiter
    HAVING COUNT(*) = 1
);

-- 3
SELECT b.cust_name
FROM restBill b
WHERE b.bill_total = (
    SELECT MIN(bill_total)
    FROM restBill
);

-- 4
SELECT s.first_name, s.surname
FROM restStaff s
LEFT JOIN restBill b ON s.staff_no = b.waiter_no
WHERE b.waiter_no IS NULL;

-- 5
SELECT b.cust_name, s.first_name, s.surname, rm.room_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
JOIN restRest_table rt ON b.table_no = rt.table_no
JOIN restRoom_management rm ON rt.room_name = rm.room_name
WHERE b.bill_total = (SELECT MAX(bill_total) FROM restBill)
ORDER BY b.bill_total DESC
LIMIT 1;