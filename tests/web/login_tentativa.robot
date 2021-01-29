***Settings***
Documentation   Login Tentativa

Resource        ../../resources/base.robot

# Executa uma ou mais Keywords antes da execução de todos os steps de cada caso de teste "Test Setup".
#Test Setup          Start Session 
# Executa uma ou mais Keywords apos a execução de todos os stepts de cada caso de teste "Test Teardown".
#Test Teardown       Finish Session

# Executa uma ou mais Keywords somente uma vez antes de todos os casos de testes "Suite Setup"
Suite Setup     Start Session
# Executa uma ou mais Keywords uma única vez apos finalizar todos os casos de testes "Suite Teardown"
Suite Teardown  Finish Session
# Executa um grupo de cenários especificos "Tentativa de login"
Test Teardown   Finish TestCase   #Captura de tela
Test Template   Tentativa de login  

***Keywords***
Tentativa de login
    [Arguments]     ${input_email}      ${input_senha}      ${output_mensagem}

    Acesso a página Login
    Submeto minhas credenciais  ${input_email}   ${input_senha}
    Devo ver um toaster com a mensagem  ${output_mensagem}

***Test Cases***

Senha incorreta             admin@zepalheta.com.br      abc123      Ocorreu um erro ao fazer login, cheque as credenciais.        
Senha em branco             joao@gmail.com              ${EMPTY}    O campo senha é obrigatório!     
Email em branco             ${EMPTY}                    pwd123      O campo email é obrigatório!
Email e senha em branco     ${EMPTY}                    ${EMPTY}    Os campos email e senha não foram preenchidos
Login incorreto             admin@gmail.com             abc123      Ocorreu um erro ao fazer login, cheque as credenciais

    

  