***Settings***
Documentation       Cadastro de clientes

Resource    ../../resources/base.robot

Suite Setup       Login Session 
Suite Teardown    Finish Session
Test Teardown     Finish TestCase   #Captura de tela

#Test Setup       Login Session 
#Test Teardown    Finish Session


***Test Cases***
Novo cliente
    [Tags]          cliente
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     Bon Jovi    00000001406     Rua dos bugs,1000       11999999999
    Quando faço a inclusão desse cliente
    Então devo ver a notificação:   Cliente cadastrado com sucesso!
    E esse cliente deve ser exibido na lista

Campos Obrigatórios
    [Tags]          obrigatorio
    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
     ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Quando faço a inclusão desse cliente   
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

Nome é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    ${EMPTY}        48034903094     Rua dos Bugs, 1000      11999999999     Nome é obrigatório


Cpf é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Allan James     ${EMPTY}        Rua dos Bugs, 100       11999999999     CPF é obrigatório 

Endereço é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
     Allan James    48034903084     ${EMPTY}                11999999999     Endereço é obrigatório

Telefone é Obrigatório
    [Tags]          required
    [Template]      Validação de Campos
    Allan James     48034903084     Rua dos Bugs, 100       ${EMPTY}        Telefone é obrigatório

Telefone incorreto
     [Tags]         required
    [Template]      Validação de Campos
    João da Silva   00000001406     Rua dos Bugs,1100       1199999999      Telefone inválido

***Keywords***
Validação de Campos
    [Arguments]     ${nome}     ${cpf}      ${endereco}     ${telefone}     ${saida}

    Dado que acesso o formulário de cadastro de clientes
    E que eu tenho o seguinte cliente:
    ...     ${nome}     ${cpf}      ${endereco}     ${telefone}
    Quando faço a inclusão desse cliente
    Então devo ver o texto:     ${saida}     

   


