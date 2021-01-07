***Settings***

Library     SeleniumLibrary


***Keywords***
## Login ## 
Acesso a página Login
    Go to      ${base_url} 

Submeto minhas credenciais 
    [Arguments]     ${email}    ${password}

    Login With      ${email}    ${password}
 
Devo ver a área logada
    Wait Until Page Contains    Aluguéis    5


Devo ver um toaster com a mensagem
    [Arguments]     ${expect_message}

    Wait Until Element Contains     ${TOASTER_ERROR}        ${expect_message}

## Save Customer ## 
Dado que acesso o formulário de cadastro de clientes

    Go to Customers
    Wait Until Element Is Visible       ${CUSTOMERS_FORM}            5
    Click Element                       ${CUSTOMERS_FORM} 

E que eu tenho o seguinte cliente:

    [Arguments]     ${name}     ${cpf}      ${address}      ${phone_number}

    Remove Customer By Cpf      ${cpf}

    Set Test Variable   ${name}             #Variaveis disponiveis no escopo do projeto
    Set Test Variable   ${cpf}
    Set Test Variable   ${address} 
    Set Test Variable   ${phone_number} 

Quando faço a inclusão desse cliente

    Register New Customer  ${name}  ${cpf}  ${address}  ${phone_number}
    
Então devo ver a notificação: 
    [Arguments]                     ${expect_notice}

    Wait Until Element Contains     ${TOASTER_SUCCES}       ${expect_notice}    5         

Então devo ver mensagens informando que os campos do cadastro de clientes são obrigatórios

    Wait Until Element Contains     ${LABEL_NAME}        Nome é obrigatório      5
    Wait Until Element Contains     ${LABEL_CPF}         CPF é obrigatório       5      
    Wait Until Element Contains     ${LABEL_ADDRESS}     Endereço é obrigatório  5               
    Wait Until Element Contains     ${LABEL_PHONE}       Telefone é obrigatório  5      

#   Wait Until Page Contains     Nome é obrigatório      5          
#   Wait Until Page Contains     CPF é obrigatório       5           
#   Wait Until Page Contains     Endereço é obrigatório  5      
#   Wait Until Page Contains     Telefone é obrigatório  5

Então devo ver o texto:
    [Arguments]     ${expect_text}

    Wait Until Page Contains    ${expect_text}      5

E esse cliente deve ser exibido na lista
    ${cpf_formatado}=               Format cpf              ${cpf}
    Go back
    Wait Until Element Is Visible   ${CUSTOMER_LIST}        5   
    Table Should Contain            ${CUSTOMER_LIST}        ${cpf_formatado}      

## Remove Customers ## 

Dado que eu tenho um cliente indesejado:
    [Arguments]                 ${name}      ${cpf}      ${address}     ${phone_number}
    
    Remove Customer By cpf      ${cpf}
    Insert Customer             ${name}      ${cpf}      ${address}     ${phone_number}

    Set Test Variable           ${cpf} 

E acesso a lista de clientes
    Go to Customers

Quando eu removo esse cliente
    
    # Format Cpf é a Keywords que representa o método no arquivo db.py "Metodo do db.py"
    ${cpf_formatado} =      Format cpf          ${cpf}
    Set Test Variable       ${cpf_formatado}     
    
    Go to Customer Details                      ${cpf_formatado} 
    Click Remove Customer

E esse cliente não deve aparever na lista
    Wait Until Page Does Not Contain            ${cpf_formatado}

    