***Settings***

Resource    ../../../resources/services.robot

Library     OperatingSystem

***Test Cases***
Novo Cadastro - API

    ${payload}          Get Json            customers/flea.json   
   
    Delete Customer     ${payload['cpf']}
    ${resp}=            Post Customer  ${payload}

    Status Should Be    200     ${resp}

Nome é obrigatório - API

    ${payload}=          Get Json           customers/no_name.json
    ${resp}=             Post Customer      ${payload}          

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "name" is required 

CPF é obrigatório - API

    ${payload}=          Get Json           customers/no_cpf.json
    ${resp}=             Post Customer      ${payload}  

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "cpf" is required

Endereço é obrigatório - API

    ${payload}=          Get Json           customers/no_end.json
    ${resp}=             Post Customer      ${payload}  
    
    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "address" is required

Telefone é obrigatório - API

    ${payload}=          Get Json           customers/no_phone.json
    ${resp}=             Post Customer      ${payload}  

    Status Should Be    400     ${resp}
    Should Be Equal     ${resp.json()['message']}       "phone_number" is required

   


              