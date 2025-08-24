*** Settings ***
Library    Browser

*** Variables ***
${URL}    https://demoqa.com/elements

*** Keywords ***
Open Web Browser
    New Browser    chromium    headless=False    timeout=30s
    New Context    viewport={'width': 1280, 'height': 768}
    New Page       ${URL}

*** Test Cases ***
TC1
    Open Web Browser
    Take Screenshot    fullPage=${True}
    Log    message=เปิดเว็บสำเร็จ ทำงานต่อได้!!    console=${True}

*** Comments ***
robot -d result test_install.robot