*** Settings ***
Library    Collections
Library    Browser
Library    PuppeteerLibrary
Resource    ${CURDIR}/ws_keyword.resource
Resource    ${CURDIR}/ws_variable.resource
Resource    ${CURDIR}/ws_repo.resource
Resource    ../Keyword/Keyword_loadeffect.robot
Suite Setup    Open web form

*** Test Cases ***
Fill input text
    [Tags]    TC1
    Fill input text    ${input_text}    txt=Hello Robot  

Fill password
    [Tags]    TC2  
    Input password fill    ${input_password}    txt=Mysecret123        

Text area  
    [Tags]    tc3
    TypeforText        ${text_area}    txt=This is text area input.

check state disable 
    [Tags]    tc4
    Wait For Elements State    //input[@placeholder='Disabled input']    state=Disabled      

check readonly 
    [Tags]    tc5
    Wait For Elements State    //input[@name='my-readonly']    state=readonly   

drop down select
    [Tags]    tc6   
    Click    //select[@name='my-select']
    Select Options By    //select[@name='my-select']    text    Three

drop down datalist
    [Tags]    tc7
    dropdown data List    ${drop_datalist}    txt=Chicago
  

upload File
    [Tags]    tc8
    Upload File By Selector    //input[@name='my-file']    path=upload_file.text
    Uncheck checkbox    //input[@id='my-check-1']
    Check Checkbox    //input[@id='my-check-2']
    Check Checkbox    //input[@id='my-radio-2']
    #Click  //button[normalize-space()='Submit']

change color
    [Tags]    tc9
    Fill Text    //input[@name='my-colors']    txt=#ff0000

date
    [Tags]    tc10
    TypeforText     //input[@name='my-date']   txt=30/07/2025

Drag
    [Tags]    tc11
    ${box}           Get Bounding Box    input[type="range"]
    ${width}         Set Variable        ${box['width']}
    Drag And Drop Relative To       //input[@name='my-range']    ${width}    0    steps=100    
    Click  //button[normalize-space()='Submit']

