*** Settings ***

Library  SeleniumLibrary

*** Variables ***

${browser}      chrome
${url}          http://localhost:4200/restaurants
${botao_lupa}   css = body > mt-app > div > div > div > mt-restaurants > section.content-header > h1 > a > i
${campo_busca}  css = body > mt-app > div > div > div > mt-restaurants > section.content-header > div > div > form > div > input
${restaurante}  css = body > mt-app > div > div > div > mt-restaurants > section.content > div > div > mt-restaurant > a > div
${box_price}    css = span.menu-item-info-box-price
${info do restaurante}  css=.box-body

*** Keywords ***

Contexto
Abrir pagina no menu restaurante
    Open Browser  ${url}  ${browser}

Cenario: Verificar existência do campo de busca
clique na lupa
    Click Element  ${botao_lupa}

a barra para digitar a busca deve aparecer
    Element Should Be Visible  ${campo_busca}


Cenario: Verificar se preços contém "R$"
pesquise por "${palavra_busca}"
    Input text  ${campo_busca}  ${palavra_busca}
    Sleep  1

clique no restaurante desejado
    Click Element  ${restaurante}

todos os preços listados devem ser precedidos de "${verificacao}"
    : for  ${i}  in range  1  4
    \   ${texto} =  Get text  css=mt-menu-item:nth-child(${i}) > div > div > span.menu-item-info-box-price
    \   Should contain  ${texto}  R$

Cenario: Verificar se os dados do restaurante estao sendo exibidos
Os campos "${Categoria}", "${Quem somos}" e "${Horarios}" devem estar presentes
    Element should contain  ${info do restaurante}  ${Categoria}
    Element should contain  ${info do restaurante}  ${Quem somos}
    Element should contain  ${info do restaurante}  ${Horarios}

todos os campos devem conter uma descriçao nao vazia
    : FOR  ${INDEX}  IN RANGE  2  7  2
    \   ${texto} =   Get text  css=dl :nth-child(${INDEX})
    \   Should not be equal  ${texto}  ${EMPTY}

Cenario: Verificar nome dos pratos em caixa alta
Todos os nomes dos pratos devem estar em letra maiuscula
    @{nomes} =  Create List  CLASSIC BURGER  BATATAS FRITAS  REFRIGERANTE
    : FOR  ${i}  in range  1  4
    \   ${texto} =  Get Text  css=mt-menu-item:nth-child(${i}) > div > div > span.menu-item-info-box-text
    \   Should Be Equal  ${texto}  @{nomes}[${i-1}]

Cenario: Verificar descriçao dos pratos
Todo prato deve conter uma breve descrição
    : for  ${i}   in range  1  4
    \   ${texto} =  Get Text  css=mt-menu-item:nth-child(${i}) > div > div > span.menu-item-info-box-detail
    \   Should not be equal  ${texto}  ${EMPTY}

Cenario: Verificar existencia do botão "Adicionar"
Todos os itens devem possuir o botão "${botao}"
    : for  ${i}   in range  1  4
    \   ${texto} =  Get Text  css=mt-menu-item:nth-child(${i}) > div > div > a
    \   Should be equal  ${texto}  ${botao}



Fechar Navegador
   Close Browser