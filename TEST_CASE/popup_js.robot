*** Settings ***
Library    Browser

*** Test Cases ***
อ่านข้อความใน Alert
    New Browser    chromium    headless=${False}    slowMo=1s
    New Context
    New Page    https://the-internet.herokuapp.com/javascript_alerts

    Handle Future Dialogs    action=accept
    Click    xpath=//button[text()='Click for JS Alert']
    
    Take Screenshot    mask=//button[text()='Click for JS Alert']

    Close Browser