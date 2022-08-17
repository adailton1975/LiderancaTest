*** Settings ***
Documentation    Teste para Liderança Capitalização
Library    SeleniumLibrary

*** Test Cases ***
Clicar Botao IRC
    Dado que acessei a página ${TARGET}
    Quando clico no icone ${IRC}
    Então sou direcionado para a página ${TARGET2}
    E verifico que o botão ${INICIAR} está desabilitado

*** Variables ***
${TARGET}        https://www.selenium.dev/
${TARGET2}        https://kiwiirc.com/nextclient/irc.libera.chat/#selenium    
${IRC}          xpath=/html/body/div/footer/div/div/div[2]/ul/li[4]/a/i   
${INICIAR}       

*** Keywords ***
Dado que acessei a página ${TARGET}
    Open Browser       ${TARGET}    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Maximize Browser Window

Quando clico no icone ${IRC}
    Scroll Element Into View            ${IRC} 
    Wait Until Element Is Visible        ${IRC} 
    Click Element                        ${IRC} 

Então sou direcionado para a página ${TARGET2}
    Switch Window    NEW
    Wait Until Location Contains        ${TARGET2}



E verifico que o botão ${INICIAR} está desabilitado    
    Wait Until Element Is Visible     css=button.u-button.u-button-primary.u-submit.kiwi-welcome-simple-start
    Element Should Be Disabled        css=button.u-button.u-button-primary.u-submit.kiwi-welcome-simple-start
    [Teardown]    Close Browser