*** Settings ***
Library    Browser
Library    collections

*** Variables ***
# for simple
${browser}    chromium
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login   
${timeout.elements}    1s
# xpath
${input_username}    //input[@name='username']    
${input_password}    //input[@name='password']    
${click_login}    //button[normalize-space()='Login']    
${inspect_logo}    //img[@alt='company-branding']    
${inspect_text_login}    //h5[normalize-space()='Login']    
${inspect_info_user}    //p[normalize-space()='Username : Admin']    
${inspect_info_password}    //p[normalize-space()='Password : admin123']   
${inspect_button_login}     //button[normalize-space()='Login']     
#${inspect_button_forgetpass}     //p[@class='oxd-text oxd-text--p orangehrm-login-forgot-header']    
${click PIM menu}    //span[normalize-space()='PIM']    
${add_button}    //button[normalize-space()='Add']
${add_Fname_box}    //input[@placeholder='First Name' or @placeholder='first name']
${add_Lname_box}    //input[@placeholder='Last Name'or @placeholder='last name']
${get_id}    (//input[@class='oxd-input oxd-input--active'])[2]
${saveadd_button}    //button[normalize-space()='Save']
${save_confirm_button}    //div[@class='orangehrm-horizontal-padding orangehrm-vertical-padding']//button[@type='submit'][normalize-space()='Save']
${Employee_list}    //a[normalize-space()='Employee List']
${search_id}    (//input[@class='oxd-input oxd-input--active'])[2]
${search_button}    //button[normalize-space()='Search']
${click_user}    //p[@class='oxd-userdropdown-name']
${click_logout}    //a[normalize-space()='Logout']


*** Keywords ***
Open web
    New Browser    ${browser}    headless=False    timeout=30s    slowMo=0.75s
    New Context    viewport={"width": 1280, "height": 800}    
    New Page    ${url}
Inspect Elements
    Wait For Elements State    selector=${inspect_logo}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${inspect_text_login}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${inspect_info_user}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${inspect_info_password}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${input_username}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${input_password}    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=${inspect_button_login}    state=visible    timeout=${timeout.elements}
    #Wait For Elements State    selector=${inspect_button_forgetpass}    state=visible    timeout=${timeout.elements}
    Take Screenshot    fullPage=True    filename= verify page login
Input username
    Fill Text    selector=${input_username}    txt=Admin
Input password
    Type Text    selector=${input_password}    txt=admin123    delay=0.15s    clear=False
click login
    click    selector=${click_login}   
click PIM menu
    Click    selector=${click PIM menu}
click add button
    click    selector=${add_button}
    Sleep    2s
add-save-search new employee
    Type Text    selector=${add_Fname_box}    txt=Robot    delay=0.05s
    Type Text    selector=${add_Lname_box}    txt=Framework    delay=0.05s
    Wait For Elements State    ${get_id}    visible    timeout=10s
    ${emp_id}=   Get Property    ${get_id}    value
    Set Test Variable    ${EMP_ID}    ${emp_id}
    Should Not Be Empty    ${emp_id}
    Click    selector=${saveadd_button}
    Sleep    10s
    click    selector=${save_confirm_button}
    Sleep    5s
    Click    selector=${Employee_list}
    Wait For Elements State    ${search_id}    visible    timeout=10s
    Fill Text    selector=${search_id}    txt=${emp_id}
    Click    selector=${search_button}
    Wait For Elements State    selector=//div[contains(text(),${emp_id})]    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=//div[contains(text(),'Robot')]    state=visible    timeout=${timeout.elements}
    Wait For Elements State    selector=//div[contains(text(),'Framework')]    state=visible    timeout=${timeout.elements}
    Take Screenshot    filename=table    fullPage=True
click Logout
    click    selector=${click_user}
    click    selector=${click_logout}
    
*** Test Cases ***
Open web and login
    [Documentation]    *#Owner : Vorathon#*
    ...    ${\n}
    ...    **Test Step Description**
    ...    ${\n}
    ...    1. เปิดเว็บ https://opensource-demo.orangehrmlive.com/web/index.php/auth/login${\n}
    ...    2. ตรวจสอบหน้า Login (Elements ต่างๆที่อยู่ในหน้าจอ)${\n}
    ...        - ตรวจสอบ logo บริษัท orangehrm${\n}
    ...        - ตรวจสอบ login ${\n}
    ...        - ตรวจสอบ info แสดง user ${\n}
    ...        - ตรวจสอบ info แสดง passwoed ${\n}
    ...        - ตรวจสอบ Textbox: Username${\n}
    ...        - ตรวจสอบ Textbox: Password${\n}
    ...        - ตรวจสอบ Button: Login${\n}
    ...        - ตรวจสอบ Button: Forgot your password? ${\n}
    ...    3. Login ด้วย Username = Admin และ Password = admin123${\n}
    ...    4. ไปที่เมนู PIM → Add Employee${\n}
    ...    5. ใส่ First Name = Robot, Last Name = Framework${\n}
    ...    6. Save แล้วตรวจสอบว่ามี Employee ID ถูกสร้าง และเก็บค่า Employee ID ไว้${\n}
    ...    7. กลับไปที่ Employee List${\n}
    ...    8. ค้นหา Employee ID จากที่เก็บมาในสเตป 6${\n}
    ...    9. ตรวจสอบว่ามีพนักงานคนนี้อยู่จริง (id , First Name , Last Name)${\n}
    ...    10. Logout${\n}
    ...    11. ตรวจสอบหน้า Login (Elements ต่างๆที่อยู่ในหน้าจอ)${\n}
    ...    ${\n}
    [Tags]    TC1 ตรวจสอบหน้า Login และ เข้าสู่ระบบสำเร็จ
    Open web
    Inspect Elements
    Input username
    Input password
    click login
    Take Screenshot    fullPage=True    filename=login success
    Sleep    2s    
    click PIM menu
    Sleep    2s
    click add button
    add-save-search new employee
    click Logout
    Inspect Elements
    Take Screenshot    fullPage=True    filename=end process


