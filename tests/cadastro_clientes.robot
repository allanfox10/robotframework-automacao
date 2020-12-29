***Settings***
Documentation       Cadastro de clientes

Resource    ../resources/base.robot

Test Setup       Login Session 
Test Teardown    Finish Session


***Test Cases***
Novo cliente 1
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     Bon Jovi    00000001406     Rua dos bugs,1000       11999999999
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Novo cliente 2
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     Allan James    29756484802     Rua Agostinho Rubin,1000       11999999989
    Então devo ver a notificação:   Cliente cadastrado com sucesso!

Campos Obrigatórios
    [tags]      temp
    Dado que acesso o formulário de cadastro de clientes
    Quando faço a inclusão desse cliente:
    ...     ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}
    Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios


    


