*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${browser}      chrome
${url}          http://localhost:4200/restaurants
${botao_lupa}   css = body > mt-app > div > div > div > mt-restaurants > section.content-header > h1 > a > i
${campo_busca}  css = body > mt-app > div > div > div > mt-restaurants > section.content-header > div > div > form > div > input
${restaurante}  css = body > mt-app > div > div > div > mt-restaurants > section.content > div > div > mt-restaurant > a > div
${box_price}    class = menu-item-info-box-price

*** Keywords ***

#Contexto
Abrir pagina no menu restaurante
    Open Browser  ${url}  ${browser}

#Cenario: Verificar existência do campo de busca
clico na lupa
    Click Element  ${botao_lupa}

aparece a barra para digitar a busca
    Element Should Be Visible  ${campo_busca}


#Cenario: Verificar se preços contém "R$"
pesquiso "${palavra_busca}"
    Input text  ${campo_busca}  ${palavra_busca}
    Sleep  1

clico no restaurante desejado
    Click Element  ${restaurante}

todos os preços listados devem ser precedidos de "${verificacao}"
    ${cont}  Get Element Count  ${box_price}

    #${lista}

    #${texto}  Get Text  ${box_price}
    #Should contain  ${texto}  R$






#todos os preços listados devem ser precedidos de "${verificacao}"





Fechar Navegador
   Close Browser