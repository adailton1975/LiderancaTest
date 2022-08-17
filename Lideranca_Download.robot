*** Settings ***
Documentation    Teste para Liderança Capitalização
Library    SeleniumLibrary

*** Test Cases ***
Clicar Link Downloads
    Dado que acessei a página ${TARGET}
    Quando clico no link ${DOWNLOADS}
    Então sou direcionado para a página ${DOWNLOADPAGE}

*** Variables ***
${TARGET}        https://www.selenium.dev/   
${DOWNLOADS}        xpath=//*[@id="main_navbar"]/ul/li[3]/a/span
${DOWNLOADPAGE}    https://www.selenium.dev/downloads/

*** Keywords ***
Dado que acessei a página ${TARGET}
    Open Browser       ${TARGET}    chrome    options=add_experimental_option('excludeSwitches', ['enable-logging'])
    Maximize Browser Window

Quando clico no link ${DOWNLOADS}
    Click Element                        ${DOWNLOADS}  

Então sou direcionado para a página ${DOWNLOADPAGE}
    Wait Until Location Contains       ${DOWNLOADPAGE} 
    [Teardown]    Close Browser