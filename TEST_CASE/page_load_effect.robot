*** Settings ***
Library    Browser
Library    String
Resource    ${CURDIR}/../Variable/page_load_effect_variable.robot
Resource    ${CURDIR}/../Keyword/Keyword_loadeffect.robot

*** Test Cases ***
TC1
    [Tags]    tc1
    Open web browser
    Click    //a[text()='Spill']
    Click    //a[text()='Show Page Loader']
    Click    //a[text()='Go back']

    Click    //a[text()='Wave']
    Click    //a[text()='Show Page Loader']
    # Wait For Elements State    selector=//a[text()='Go back']    state=visible    
    # ...    timeout=15s    message=ฉันไม่เห็นปุ่ม Go back
    Click    //a[text()='Go back']

TC2
    [Tags]    tc2
    Open web browser
    Click Wave effect
    # Click Effect    effect=Wave
    # Click Effect    effect=Circle

TC3
    [Tags]    tc3
    @{colors}    Create List    Red    Green    Bule
    FOR    ${value}    IN    @{colors}
        IF    '${value}' == 'Green'
            BREAK 
        END
        Log    Colors: ${value}    console=yes
    END

TC4
    [Tags]    tc4
    @{colors}    Create List    Red    Green    Bule    Black
    FOR    ${i}    ${value}    IN ENUMERATE    @{colors}    #IN ENUMERATE  เป็นการแสดงค่า index พร้อมกับค่า value
        Log    Colors:${i+1}: ${value}    console=yes
    END

TC5
    [Tags]    tc5
    FOR    ${i}    IN RANGE    1    11    1        
        Log    รอบที่ ${i}    console=yes
    END

TC6
    [Tags]    tc6
    @{letter}    Create List    A    B    C    D
    @{num}    Create List    1    2    3    4
    FOR    ${l}    ${n}    IN ZIP    ${letter}    ${num}    #การวนลูปหลายตัวแปรไปพร้อมกันในแต่ละรอบ
        Log    ${l} - ${n}    console=yes
    END

TC7
    [Tags]    tc7
    Open web browser
    For loop click effect

TC8
    [Tags]    tc8
    Open web browser
    For In click effect    Wave    Circle

WHILE: Exit loop with BREAK
    [Documentation]    Owner: Kachain.a
    [Tags]    ตัวอย่างการใช้งาน 
    WHILE    True
        Log    Log Before BREAK Loop.      console=yes
        BREAK
        Log    This will not be logged.    console=yes
    END
    
*** Comments ***   
robot -d result_loadeffect -v browser:firefox  page_load_effect.robot
robot -d result_loadeffect -i 'tc1' -v browser:firefox  page_load_effect.robot
robot -d result_loadeffect -i 'tc1' page_load_effect.robot