*** Settings ***
Library            Selenium
Library    SeleniumLibrary
*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com

*** Keywords ***
#### Setup e Terdown
Abrir Navegador
    Open Browser        about:blank    ${BROWSER} 
Fechar NAvaegador 
    Close Browser

#### Passo a Passo
Acessar a página home do site
    Go to   http://automationpractice.com
    Title Should Be    My Store

Digitar o nome do produto "${PRODUTO}" no campo de pesquisa
    Input Text    id=search_query_top    ${PRODUTO}

Clicar no botão Pesquisar
    Click Element    name=submit_search