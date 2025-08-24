*** Settings ***
Library    collections

*** Variables ***


*** Keywords ***
Say Hello
    [Arguments]    ${value}=Robot Framework!
    Log    Hello, ${value}    console=yes

greeting
    [Arguments]    ${value}
    Log    Hello, ${value}!    console=yes

Show User
    [Arguments]    ${name}    ${email}
    Log    - Name : ${name}    console=yes
    Log    - Email : ${email}    console=yes  

sum number
    [Arguments]    ${num1}    ${num2}
    Log    >> num1 = ${num1}    console=yes
    Log    >> num2 = ${num2}    console=yes
    ${result}    Evaluate    ${num1} + ${num2}
    Log     ผลบวก = ${result}    console=yes


*** Test Cases ***
Hello
    Say Hello   

greeting
    greeting    GABA 

Show user
    Show User    name=Vorathon    email=vorathon_r@hotmail.com

sum number
    sum number    num1=15        num2=10


