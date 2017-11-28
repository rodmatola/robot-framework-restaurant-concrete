*** Settings ***

Resource  ../resources/resources.robot
Resource  ../resources/BDDpt-br.robot

Suite Setup  Abrir pagina no menu restaurante
Suite Teardown  Fechar Navegador

*** Test Cases ***

Cenario: Verificar existência do campo de busca
    [Tags]  campo de busca
    clique na lupa
    RESULTADO: a barra para digitar a busca deve aparecer

Cenario: Verificar se preços contém "R$"
    [Tags]  R$
    pesquise por "hamburger"
    clique no restaurante desejado
    RESULTADO: todos os preços listados devem ser precedidos de "R$"

Cenario: Verificar se os dados do restaurante estao sendo exibidos
    [Tags]  dados
    RESULTADO: Os campos "Categoria", "Quem somos" e "Horários" devem estar presentes
    E todos os campos devem conter uma descriçao nao vazia

Cenario: Verificar nome dos pratos em caixa alta
    [Tags]  caixa alta
    RESULTADO: Todos os nomes dos pratos devem estar em letra maiuscula

Cenario: Verificar descriçao dos pratos
    [Tags]  descricao
    RESULTADO: Todo prato deve conter uma breve descrição

Cenario: Verificar existencia do botão "Adicionar"
    [Tags]  botao adicionar
    RESULTADO: Todos os itens devem possuir o botão "Adicionar"


#- Itens devem ser exibidos em forma de lista
#- Imagem alinhada a esquerda

