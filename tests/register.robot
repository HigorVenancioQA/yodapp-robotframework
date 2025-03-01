*** Settings ***

Resource    ../resources/base.resource

*** Test Cases ***
Deve cadastrar com sucesso

    Start session

    Get started
    Navegate to    Formulários
    Go to item     Cadastro    Crie sua conta.

    Input Text     id=com.qaxperience.yodapp:id/etUsername    Higor
    Input Text     id=com.qaxperience.yodapp:id/etEmail       higor@gmail.com
    Input Text     id=com.qaxperience.yodapp:id/etPassword    jedi123

    Select Level   Jedi

    Click Element               id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Tudo certo, boas vindas ao Yodapp!
    
    Close session

Realizar cadastro sem informar o Nome

    Start session

    Get started
    Navegate to    Formulários
    Go to item     Cadastro    Crie sua conta.

    Input Text     id=com.qaxperience.yodapp:id/etEmail       higor@gmail.com
    Input Text     id=com.qaxperience.yodapp:id/etPassword    jedi123

    Select Level    Outros

    Click Element               id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Seu nome você deve informar!
    
    Close session

Realizar cadastro sem informar o Email

    Start session

    Get started
    Navegate to    Formulários
    Go to item     Cadastro    Crie sua conta.

    Input Text     id=com.qaxperience.yodapp:id/etUsername    Higor
    Input Text     id=com.qaxperience.yodapp:id/etPassword    jedi123

    Select Level    Sith

    Click Element               id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Email válido você deve informar!
    
    Close session

Realizar cadastro sem informar a Senha

    Start session

    Get started
    Navegate to    Formulários
    Go to item     Cadastro    Crie sua conta.

    Input Text     id=com.qaxperience.yodapp:id/etUsername    Higor
    Input Text     id=com.qaxperience.yodapp:id/etEmail       higor@gmail.com

    Select Level    Padawan

    Click Element               id=com.qaxperience.yodapp:id/btnSubmit
    Wait Until Page Contains    Uma senha você deve informar!
    
    Close session


*** Keywords ***
Select Level
    [Arguments]    ${level}


    Click Element                    id=com.qaxperience.yodapp:id/spinnerJob   
    Wait Until Element Is Visible    class=android.widget.ListView
    Click Text    ${level}

