*** Settings ***
Library    SeleniumLibrary
Library    ScreenCapLibrary

*** Variables ***
#Dados do teste
${NomeDaMusica}    Ariana Grande
    

#Variaveis de configuracao
${url}    https://www.youtube.com/    
${brownser}    chrome    
    

#Elementos
${input_pesquisa}      xpath= //input[@id="search"]
${buttons_pesquisa}    xpath= //*[@id="search-icon-legacy"]
${primeiro}            xpath= //*[@id="video-title"]/yt-formatted-string


*** Keywords ***

Given que eu esteja no site do youtube
    
    Open Browser    ${url}        ${brownser}    
    Maximize Browser Window
    Start Gif Recording

When digito o nome da musica
    Input Text    ${input_pesquisa}       ${nomedamusica}

And clico no botao buscar
    Click Element    ${buttons_pesquisa}

And clico na primeira opcao da lista
    Wait Until Element Is Visible  ${primeiro}      10
    Click Element    ${primeiro}

Then o video e executado
    Close Browser
    Stop Gif Recording

*** Test Cases ***
Cenario 1: Executar video no site do youtube
    Given que eu esteja no site do youtube
    When digito o nome da musica
    And clico no botao buscar
    And clico na primeira opcao da lista
    Then o video e executado