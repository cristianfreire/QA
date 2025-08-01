# language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informações dos funcionarios

    Cenario: Buscar informações de funcionario
        Dado que o usuario consulte informações de funcionario
        Quando ele realizar a pesquisa
        Entao uma lista de funcionarios deve ser retornada

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informações do funcionario
        Entao esse funcionario sera cadastrado