*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${browser}      firefox
${url}          http://localhost:4200/restaurants
${botao_lupa}   css = body > mt-app > div > div > div > mt-restaurants > section.content-header > h1 > a > i
${campo_busca}  css = body > mt-app > div > div > div > mt-restaurants > section.content-header > div > div > form > div > input

*** Keywords ***

Abrir pagina no menu restaurante
    Open Browser  ${url}  ${browser}

clico na lupa
    Click Element  ${botao_lupa}

aparece a barra para digitar a busca
    Element Should Be Visible  ${campo_busca}


pesquiso "${palavra_busca}"
    Input text  ${campo_busca}  ${palavra_busca}

#clico no restaurante desejado


#todos os preços listados devem ser precedidos de "${verificacao}"





Fechar Navegador
   Close Browser