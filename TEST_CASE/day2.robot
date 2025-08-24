*** Settings ***
Library    collections

*** Variables ***


*** Keywords ***

    

*** Test Cases ***
simple IF
    [Tags]    if1
    ${random_number}    Evaluate    random.randint(0, 10)
    Log    ${random_number}    console=yes
    IF    ${random_number} > 5
        Log    ค่าที่ได้มากกว่า 5    console=yes 
    END
    
    IF    ${random_number} == 8    Log    ได้ค่า 8    console=yes

IF ELSE
    [Tags]    if2
    ${random_number}    Evaluate    random.randint(0, 10)
    IF    ${random_number} >= 5 
        Log    คุณผ่าน    console=yes
    ELSE
        Log    คุณไม่ผ่าน    console=yes
    END
    
IF ELIF ELSE
    [Tags]    if3
    ${random_letters}    Evaluate    random.choice(['A', 'B', 'C', 'D', 'E'])
    Log    ${random_letters}    console=yes
    IF    '${random_letters}' == 'A'    #ต้องมี '' ตัวอักษร ทุกครั้งที่มีการเปรียบเทียบ
        Log    เก่งมากจร้าาา    console=Yes
    ELSE IF    '${random_letters}' == 'B'
        Log    เก่งมากนะ    console=yes
    ELSE
        Log    ไม่ผ่าน    console=yes
    END

Nested IF Example
    [Tags]    if4
    ${attendance} =    Set Variable    85
    ${score} =    Set Variable    45
    IF    ${attendance} >= 80
        IF    ${score} >= 50
            Log    ผ่านทั้งสองเงื่อนไข
        ELSE
            Log    คะแนนไม่ผ่านเกณฑ์
        END
    ELSE
        Log    ขาดเรียน ไม่ผ่านเกณฑ์    
    END

Pass If Score And Attendance OK
    [Tags]    if5
    ${score}=       Set Variable    50
    ${attendance}=  Set Variable    85
    IF    ${score} >= 60 and ${attendance} >= 80
        Log    ✅ ผ่านเกณฑ์ทั้งสอง
    ELSE
        Log    ❌ ไม่ผ่านเกณฑ์
    END

Allow Admin Or Develop
    [Tags]    if6
    ${role}=    Set Variable    Develop
    IF    '${role}' == 'Admin' or '${role}' == 'Develop'
        Log    ✅ เข้าจัดการระบบได้
    ELSE
        Log    ❌ ไม่สามารถเข้าได้
    END
    # ถ้าเป็น admin หรือ moderator อย่างใดอย่างหนึ่งก็ได้
    
Check If No Error
    [Tags]    if7
    ${has_error}=    Set Variable    False
    IF    not ${has_error}
        Log    ✅ ทำงานสำเร็จ ไม่มีข้อผิดพลาด
    ELSE
        Log    ⚠️ พบข้อผิดพลาด
    END
    # not False = True → แสดงว่าทำงานผ่าน

Complex Condition Example
    [Tags]    if8
    ${is_member}=        Set Variable    True
    ${email_verified}=   Set Variable    False
    ${role}=             Set Variable    admin
    IF    (${is_member} and ${email_verified}) or '${role}' == 'admin'
        Log    ✅ เข้าระบบได้
    ELSE
        Log    ❌ ปฏิเสธการเข้าระบบ
    END
    # ถ้าเป็น admin จะเข้าระบบได้เสมอ หรือ ถ้าเป็นสมาชิกและยืนยันอีเมลแล้วก็ได้