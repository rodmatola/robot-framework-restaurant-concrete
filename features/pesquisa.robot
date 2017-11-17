*** Settings ***

Resource  ../resources/resources.robot
Resource  ../resources/BDDpt-br.robot

Suite Setup  Abrir pagina no menu restaurante
#Suite Teardown  Fechar Navegador

*** Test Cases ***

Cenario: Verificar existência do campo de busca
    Quando  clico na lupa
    Então  aparece a barra para digitar a busca

Cenario: Verificar se preços contém "R$"
    Quando  pesquiso "hamburger"
    E  clico no restaurante desejado
    Então  todos os preços listados devem ser precedidos de "R$"


