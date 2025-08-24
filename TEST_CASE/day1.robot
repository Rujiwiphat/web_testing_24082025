*** Settings ***
#Library    BuiltIn    #Library ที่มาพร้อม Robot Framework อยู่แล้ว (default) เช่น คำสั่ง Log, Set Variable, Should
Library    Collections    #Library สำหรับจัดการ List / Dictionary โดยเฉพาะ
Variables     ${CURDIR}/../Configs/data.yaml

*** Variables ***
${firstname}    Vorathon    #Scalar Variable ${}
@{animal}     Ant     Dog    Cat    #เวลาประกาศตัวแปร list ให้ใช้ @{} แต่ตอร test เรียกใช้ที่ละค่าให้ใช้ ${}
&{profile}    firstname=Vorthon    Lastname=Rujiwiphat    Nickname=GAB    #Dictionary Variable &{} 
${user}         {"name": "Alice", "age": 30, "roles": ["admin", "editor"]}
${browser}    chrome

*** Keywords ***
Log message
    Log    ${firstname}    console=yes

Log message with Argument
    [Arguments]    ${name}=GABA
    Log    Hi ${name}    console=yes

Log Sum With Argument
    [Arguments]    ${a}    ${op}    ${b}=20
    ${sum}    Evaluate    ${a} ${op} ${b}
    Log    ${a} ${op} ${b} ผลลัพธ์ >> ${sum}    console=yes
    RETURN    ${sum}

Log Message ${text} Embeb
    [Arguments]    ${value}
    Log    === ข้อความ: ${text} ===    console=yes
    Log    === Argument: ${value} ===    console=yes

Log Message List Varivables
    [Arguments]    @{name}
    Log    List value : ${name}    console=yes 

Log Message random
    ${random_number}    Evaluate    random.randint(0, 10)
    ${random_letter}    Evaluate    random.choice(['A', 'B', 'C', 'D', 'E'])
    Log    Number 0 - 10 : ${random_number}    console=yes
    Log    letters A - E : ${random_letter}    console=yes


*** Test Cases ***
TC1
    [Tags]    tc1
    [Documentation]    *Owner: Vorathon*${\n}
    ...    _เทรสเคสที่ 1 แสดงข้อมูล_
    ...    - 1. เปิดเว็บ
    ...    - 2. เช็คผล
    Log     First Name : ${SPACE*3}${firstname}    console=True
    Log     First Name : ${SPACE*6}${firstname}    console=True    #console ต้องใช้แสดงผลผ่าน Log จะแสดงผลที่หน้า Terminal  
    ${Nickname}    Set Variable    GAB    
    Log    ${CURDIR}   console=True
    Log    ${TEST_NAME}    console=yes
    Log    Run browser: ${browser}    console=yes  

TC2
    [Tags]    tc2
    Log    Animal : ${animal}[2]   console=True
    @{colors}    Create List    red    yellow    green    
    Log    ${colors}[2]    console=yes
    Append To List    ${colors}    bule    #เป็นการเพิ้มสมาชิกใน list
    Log    ${colors}    console=yes 

TC3
    [Tags]    tc3    pass    #การใช้ Tag เป็นเพิ่มชื่อของ test case เพื่อช่วยเรื่องการแบ่งกลุ่ม
    Log    Profile >> ${profile}[Nickname]    console=True
    Log    Profile >> ${profile.firstname}    console=True
    Log    Profile >> ${profile['Lastname']}    console=True
    ${user}    Create Dictionary    name=MJ    age=32
    Log    ${user}    console=yes
    Log    ${user.name}    console=yes

TC4
    [Tags]    tc4    pass 
    ${json_user}=       Evaluate    json.loads('${user}')    json    #ทำการแปลงค่าจากตัวแปรเป็นการใช้แบบ json
    Log    ${json_user['name']}    console=yes
    Log    ${json_user['age']}    console=yes
    Log    ${json_user['roles']}    console=yes
    Log    ${json_user['roles'][1]}    console=yes    #console=yes กับ True เหมือนกัน

TC5
    [Tags]    tc5
    Log    ${value1}    console=yes
    Log    ${list_value}    console=yes
    Log    ${dict_vaulue}    console=yes

TC6 Log Message
    [Tags]    tc6
    Log message
    Log message with Argument
    Log Sum With Argument    a=15    op=-    b=10
    Log Sum With Argument    a=15    op=+    b=10
    Log message Hello world embeb    value=GABA
    Log Message List Varivables    value1    value2    value3
    ${resp}    Log Sum With Argument    a=15    op=*    b=2
    Log    >> log value ${resp}    console=yes
    Log Sum With Argument    a=15    op=<    b=10
    Log Message random



*** Comments ***
robot -d  log_day1 -t 'tc1' -v browser:firefox day1.robot
robot -d  log_day1 -e slow day1.robot
robot -d  log_day1 day1.robot


