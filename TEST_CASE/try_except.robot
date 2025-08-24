*** Settings ***
Library      String
Library      Collections
#Library      BuiltIn
*** Test Cases ***
# 1. Basic TRY/EXCEPT
Basic Try
    TRY
        Fail    เกิดข้อผิดพลาด
    EXCEPT
        Log    จับข้อผิดพลาดทั่วไปแล้ว
    END

# 2. Multiple EXCEPT Branches
Multiple Except Branches
    TRY
        Fail    ระบบล่ม
    EXCEPT    ระบบล่ม
        Log    จัดการระบบล่ม
    EXCEPT    ไม่พบข้อมูล
        Log    แจ้งผู้ใช้: ข้อมูลหาย
    END

# 3. ELSE Branch
Try With Else
    TRY
        Log    ดำเนินการสำเร็จ
    EXCEPT
        Log    มีข้อผิดพลาดเกิดขึ้น
    ELSE
        Log    ทุกอย่างผ่านปกติ
    END

# 4. FINALLY Branch
Try With Finally
    TRY
        Log     เริ่มการดำเนินการ
        Fail    จำลอง error
    EXCEPT
        Log    จัดการ error แล้ว
    ELSE
        Log    ทุกอย่างผ่านปกติ
    FINALLY
        Log    ปิดการเชื่อมต่อหรือทำความสะอาด
    END