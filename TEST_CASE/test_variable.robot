*** Settings ***
# Library    BuiltIn
Library    collections
Variables    ${CURDIR}/../Configs/var_file.yaml

*** Variables ***
${username}    vorathon1234
${password}    gpotenza1111
${A}    7
${B}    8
@{product}    Keyboard    Mouese    Moniter    Notebook
&{user}    name=Vorathon    email=vorathon_r@hotmail.com
&{PRODUCT_price}     name=Monitor     price=499



*** Keywords ***


*** Test Cases ***
1. แสดงค่า USERNAME และ PASSWORD
    Log    ${username}${\n}${password}    console=yes

2. หาผลรวม A และ B
    ${sum}    Evaluate    ${A}+${B} 
    Log    sum_result = ${sum}   console=yes

3. แสดงค่า Monitor และจำนวนทั้งหมดใน PRODUCTS
    Log    ${PRODUCT}[2]    console=yes
    ${COUNT}    Get Length    ${PRODUCT}
    Log    จำนวนทั้งหมดใน PRODUCTS = ${COUNT}    console=yes

4. แสดงค่า Dictionary USER
    Log    Name = ${USER['name']}    console=yes
    Log    Email = ${USER['email']}    console=yes

5. แสดงค่า Dictionary PRODUCT
    Log    Product Name = ${PRODUCT_price['name']}
    Log    Price = ${PRODUCT_price['price']}

6. แสดงข้อมูลจาก var_file.yaml
    Log    Name = ${dict_var['profile']['name']}
    Log    Skills = ${dict_var['skill']}
    Log    Skill 2 = ${dict_var['skill'][1]} 



    