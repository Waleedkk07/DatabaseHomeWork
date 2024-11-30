-- 1
SELECT first_name
FROM restStaff T1
INNER JOIN restBill T2
ON T1.staff_no = T2.waiter_no
WHERE cust_name = "Tanya Singh"

-- 2
SELECT room_date
FROM restRoom_management T1
INNER JOIN restStaff T2
ON T1.headwaiter = T2.staff_no
WHERE room_name = "Green" AND first_name = "Charles"
AND room_date > 160131 AND room_date < 160301;

-- 3
SELECT s.first_name, s.surname
FROM restStaff s
JOIN restStaff z ON s.headwaiter = z.headwaiter
WHERE z.first_name = 'Zoe' AND z.surname = 'Ball'
AND (s.first_name != 'Zoe' OR s.surname != 'Ball');

-- 4
SELECT b.cust_name, b.bill_total, s.first_name
FROM restBill b
JOIN restStaff s ON b.waiter_no = s.staff_no
ORDER BY b.bill_total DESC;

-- 5
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.headwaiter IN (
    SELECT DISTINCT st.headwaiter
    FROM restBill b
    JOIN restStaff st ON b.waiter_no = st.staff_no
    WHERE b.bill_no IN (14, 17)
);

-- 6
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
JOIN restRoom_management rm ON s.headwaiter = rm.headwaiter
WHERE rm.room_name = 'Blue' AND rm.room_date = 160312
UNION
SELECT DISTINCT s.first_name, s.surname
FROM restStaff s
WHERE s.staff_no = (
    SELECT headwaiter
    FROM restRoom_management
    WHERE room_name = 'Blue' AND room_date = 160312
);