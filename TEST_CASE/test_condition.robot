*** Settings ***

Library    collections

*** Variables ***


*** Keywords ***
check grade simple
    [Arguments]    ${score}=75
    IF    ${score} >= 80
        Log    คะแนนของคุณคือ ${score} คุณได้เกรด A    console=yes
    ELSE
        Log    คะแนนของคุณคือ ${score} คุณได้เกรด B    console=yes   
    END

Calculate Grade Level
    # [Arguments]    ${score}
    # Log    คะแนน ${score}    console=yes
    # IF    ${score} >= 80
    #     Log    คุณได้เกรด A    console=yes
    # ELSE IF    ${score} <80 and ${score} >=70
    #     Log    คุณได้เกรด B    console=yes
    # ELSE IF    ${score} <70 and ${score} >=60
    #     Log    คุณได้เกรด C    console=yes
    # ELSE IF    ${score} <60 and ${score} >=50
    #     Log    คุณได้เกรด D    console=yes
    # ELSE IF    ${score} < 50
    #     Log    คุณได้เกรด F  ไม่ผ่าน    console=yes
    # END
    [Arguments]    ${score}
    Log    คะแนน ${score}    console=yes
    IF    ${score} >= 80
        Log    คุณได้เกรด A    console=yes
    ELSE IF    ${score} >= 70
        Log    คุณได้เกรด B    console=yes
    ELSE IF    ${score} >= 60
        Log    คุณได้เกรด C    console=yes
    ELSE IF    ${score} >= 50
        Log    คุณได้เกรด D    console=yes
    ELSE
        Log    คุณได้เกรด F ไม่ผ่าน    console=yes    level=INFO
    END

Check Scholarship Eligibility
    [Arguments]    ${GPA}    ${income}
    IF    ${GPA} >= 3.5
        Log    GPA : ${GPA} คุณผ่านเกณฑ์    console=yes
        IF    ${income} >= 20000
            Log    ได้รับทุน 3,000 บาท    console=yes
        ELSE IF    ${income} < 20000
            Log    ได้รับทุน 5,000 บาท    console=yes
        END
    ELSE 
        Log    ไม่ได้รับทุน    console=yes  
    END
    
*** Test Cases ***
check grade simple
    [Tags]    test1
    check grade simple    

Calculate Grade Level
    [Tags]    test2
    Calculate Grade Level    score=45

Check Scholarship Eligibility
    [Tags]    test3
    Check Scholarship Eligibility    3.8    15000



