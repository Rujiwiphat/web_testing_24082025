*** Settings ***
Library    Collections
Library    Browser
Resource    ${CURDIR}/../Keyword/demo_qa_keyword.resource
Resource    ${CURDIR}/../Repositories/demo_qa_repo.resource
Suite Setup    Open web browser

*** Test Cases ***
TC1 text Box
    [Tags]    tc1
    Go To    https://demoqa.com/text-box    wait_until=load
    Input text    xpath=${txt_full_name}    txt=Vorathon
    Input text with option    xpath=${txt_email}   txt=Vorathon_r@hotmail.com    delay=0.1s
    Input text with option    xpath=${txt_address}    txt= ตึกพหลโยธิน    delay=0.1s
    Input text with option    xpath=${txt_Permanent_address}    txt= อารีย์    delay=0.1s
    Take Screenshot    fullpage=True
    Take Screenshot    selector=${txt_address}

TC2 check box
    [Tags]    tc2
    Go To    https://demoqa.com/checkbox    wait_until=load
    click    //button[@title='Toggle']
    Check Checkbox    //span[text()='Desktop']
    check checkbox with name Documents
    check checkbox with name Downloads
    Take Screenshot    fullpage=True

TC3 radio
    [Tags]    tc3
    Go To    https://demoqa.com/radio-button    wait_until=load
    Check Checkbox      //label[@for="yesRadio"]
    Take Screenshot    fullpage=True

TC4 button
    [Tags]    tc4
    Go to    https://demoqa.com/buttons    wait_until=load
    Click With Options    id=doubleClickBtn    clickCount=2    
    Click    id=rightClickBtn    right    
    Click  //button[text()='Click Me']
    Take Screenshot    fullpage=True

TC5 link
    [Tags]    tc5
    Go to    https://demoqa.com/links    wait_until=load
    Click  id=simpleLink    #เวลานำ id มาใช้งานให้ลบ '' ออกก่อน
    Sleep    2s
    ${tabs}    Get Page Ids    #ต้องประกาศตัวแปรสำหรับเก็บค่าจำนวน tab ที่จะเปิด
    Switch Page    ${tabs}[1]    #อ้างอิง index สำหรับจะเปลี่ยน tab
    Sleep    2s
    Take Screenshot    fullpage=True


TC6 upload
    [Tags]    tc6
    Go To    https://demoqa.com/upload-download    wait_until=load
    Upload File By Selector    id=uploadFile   path=result_day3/uploadtest.log
    Take Screenshot    fullpage=True

TC7 datepicker
    [Tags]    tc7
    Go To    https://demoqa.com/date-picker    wait_until=load
    Click    id=datePickerMonthYearInput
    Select Options By    //select[@class="react-datepicker__month-select"]    Value    6
    Select Options By    //select[@class="react-datepicker__year-select"]     text    1993
    Click    //div[contains(@aria-label, 'July') and text()="30"]
    #Get Text    id=datePickerMonthYearInput    ==   07/30/1993
    ${value}    Get Text    id=datePickerMonthYearInput
    Should Be Equal    ${value}    07/30/1993    msg=ผิดจ้าาไปเช็คใหม่
    Take Screenshot        

TC8_Slider
    [Tags]    tc8
    # Slider
    Go To     https://demoqa.com/slider    wait_until=load    
    ${box}           Get Bounding Box    input[type="range"]
    ${width}         Set Variable        ${box['width']}

    # ลาก slider กลับไปซ้ายสุดก่อน (reset) 
    Drag And Drop Relative To       input[type="range"]    -${width}    0    steps=100
    Take Screenshot

    # ลากไปยังกึ่งกลาง
    Drag And Drop Relative To    css=input[type="range"]    ${width}    0    steps=100
    Take Screenshot