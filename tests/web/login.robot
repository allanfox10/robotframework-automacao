***Settings***
Documentation   Login

Resource    ../../resources/base.robot

# Executa uma ou mais Keywords antes da execução de todos os steps de cada caso de teste.
Suite Setup          Start Session 
# Executa uma ou mais Keywords apos a execução de todos os stepts de cada caso de teste.
Suite Teardown       Finish Session
Test Teardown        Finish TestCase   #Captura de tela

***Test Cases***
Login do Administrador
    Acesso a página Login
    Submeto minhas credenciais  admin@zepalheta.com.br   pwd123
    Devo ver a área logada

