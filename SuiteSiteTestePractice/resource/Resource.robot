*** Settings ***
Library            Selenium
Library    SeleniumLibrary
*** Variables ***
${BROWSER}    chrome
${URL}        http://automationpractice.com

*** Keywords ***
#### Setup e Terdown
Abrir Navegador
ex    Open Browser        about:blank    ${BROWSER} 
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
Conferir se o produto "${PRODUTO}" foi listado no site
    Wait Until Element Is Visible    css=#center_column > h1
    Title Should Be                  Search - My Store
    Page Should Contain Image        xpath=//*[@id="center_column"]//*[@src='http://automationpractice.com/img/p/7/7-home_default.jpg']
    Page Should Contain Link         xpath=//*[@id="center_column"]//a[@class="product-name"][contains(text(),'Blouse')]

Conferir mensagem de erro "${MENSAGEM_ALERTA}"
    Wait Until Element Is Visible    //*[@id="center_column*]/p[@class='alert alert-warning']
    Element Text Should Be           //*[@id="center_column*]/p[@class='alert alert-warning']     ${MENSAGEM_ALERTA}