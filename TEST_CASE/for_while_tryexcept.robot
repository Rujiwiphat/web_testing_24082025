*** Settings ***
Library    collections

*** Variables ***


*** Keywords ***


*** Test Cases ***
แสดงชื่อจากลิสต์ทีละชื่อ
    @{students}    Create List    มานี    ปิติ    ชูใจ
    FOR    ${name}    IN    @{students}
        Log    ฉันชื่อ ${name}    console=yes
    END

แสดงเลข 1 ถึง 10
    FOR    ${i}    IN RANGE    10    
        Log    ${i+1}    console=yes 
    END

แสดงเลข 1 ถึง 10 หยุดที่ 5
    FOR    ${i}    IN RANGE    1    11
        Log    ${i}    console=yes    
        IF    ${i} == 5
            Log    Number is ${i}    console=yes
            BREAK
        END
    END

จงใช้ WHILE แสดงเลข 1 ถึง 5
    ${i}    Set Variable   1
    # While ใช้สำหรับทำซ้ำคำสั่งตราบเท่าที่เงื่อนไขยังเป็นจริง 
    WHILE    ${i} <= 5           
        Log    ${i}    console=yes
        ${i}    Evaluate    ${i} + 1
    END


    
