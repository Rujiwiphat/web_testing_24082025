*** Settings ***
Library    Collections
Library    Browser
Resource    ${CURDIR}/ws_repo.resource
Resource    ${CURDIR}/ws_variable.resource

*** Keywords ***
Open web form
    New Browser    ${browser}    headless=${False}    slowMo=1s
    New Context    viewport={"width": 1200, "height": 800}    ignoreHTTPSErrors=True    #ignoreHTTPSErrors เพิ่มการยืนยันสำหรับเปิดเว็บ
    New Page    url=${url}

Fill input text
    [Arguments]    ${xpath}    ${txt}
    Fill Text    ${xpath}    ${txt}

Input password fill
    [Arguments]    ${xpath}    ${txt}    ${delay}=0.15s    ${clear}=TRUE
    Type Text    ${xpath}    ${txt}    ${delay}    ${clear}    

TypeforText 
    [Arguments]    ${xpath}    ${txt}    ${delay}=0.15s    ${clear}=TRUE
    Type Text    ${xpath}    ${txt}    ${delay}    ${clear}   

check disable input
    Check Checkbox    //input[@placeholder='Disabled input']
    
dropdown data List
    [Arguments]    ${xpath}    ${txt}    ${delay}=0.15s    ${clear}=TRUE 
    Type Text    ${xpath}    ${txt}    ${delay}    ${clear}   