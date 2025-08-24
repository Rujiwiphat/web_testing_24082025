*** Settings ***
Documentation    คำอธิบายของชุด test นี้ เพื่อเข้าใจการใช้งาน Documentation อย่างมืออาชีพ
# Library    BuiltIn

*** Test Cases ***
Test Documentation
    [Documentation]    
    ...    = คำอธิบาย =
    ...    *วัตถุประสงค์*: ทดสอบการจัดรูปแบบ _documentation_
    ...
    ...    = Inline Styles =
    ...    *ตัวหนา* , _ตัวเอียง_ , _*ข้อความหนา+เอียง*_ , ${\n}โค้ด inline ``โค้ดแบบ inline``
    ...    ${\n}                        
    ...    ลิงก์: https://robotframework.org
    ...                
    ...    = รายการแบบ Bullet =
    ...    - เปิดเว็บไซต์
    ...    - กรอกชื่อผู้ใช้
    ...    - คลิกปุ่มล็อกอิน  
    ...                    
    ...    = ตาราง (Table) =
    ...    | Username | Role     |
    ...    | admin    | Manager  |
    ...    | guest    | Viewer   |          
    ...    
    ...    = block =
    ...    | inside block
    ...    |    some   additional whitespace
    ...    |        some detail inside block
    Log    "Topic: Documents"

*** Test Cases ***
Login Successfully
    [Documentation]    = ทดสอบการเข้าสู่ระบบ =
    ...    *เป้าหมาย:* ทดสอบว่าผู้ใช้สามารถ login ได้
    ...    _ระบบควรแสดงคำว่า_ ``Welcome``
    ...    - เปิด browser
    ...    - กรอก username/password
    ...    - ตรวจสอบข้อความบนหน้าเว็บ
    ...    | Username | Role |
    ...    | admin | Manager |
    ...    | guest | Viewer |
    Log    "Topic: Documents"

