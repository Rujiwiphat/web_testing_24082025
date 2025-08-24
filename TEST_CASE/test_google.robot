*** Settings ***
Library    Browser

*** Test Cases ***
Open Google And Search
    New Browser    chromium    headless=False
    New Page    https://www.google.com
    Fill Text    input[name="q"]    Robot Framework
    Press Keys    input[name="q"]    ENTER
    Wait For Elements State    text=Robot Framework    visible
    Close Browser
