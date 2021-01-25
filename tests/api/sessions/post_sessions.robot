***Settings***

Resource    ../../../resources/services.robot

*** Test Cases ***
Login com sucesso - API
    
    ${resp}=            Post Session        admin@zepalheta.com.br      pwd123              
    Status Should Be     201     ${resp}   
    
Senha incorreta - API
    
    ${resp}=            Post Session        admin@zepalheta.com.br      abc123              
    Status Should Be     401     ${resp}    

Usuário não existe - API
    
    ${resp}=            Post Session        404@yahoo.com.br            pwd123              
    Status Should Be     401     ${resp}

Campo e-mail vazio - API
   
    ${resp}=            Post Session            ${EMPTY}                    abs123
    Status Should Be    400     ${resp}

Campo senha vazio - API
    
    ${resp}=            Post Session            admin@zepalheta.com.br      ${EMPTY}
    Status Should Be    400     ${resp}      



   

  