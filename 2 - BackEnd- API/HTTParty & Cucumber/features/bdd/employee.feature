# language: pt

Funcionalidade: Pesquisar Funcionarios
    Para averiguar informações
    O usuário do sistema
    Deseja poder consultar informações dos funcionarios

    @cenario_um
    Cenario: Buscar informações de funcionario
        Dado que o usuario consulte informações de funcionario
        Quando ele realizar a pesquisa
        Entao uma lista de funcionarios deve ser retornada

    @cenario_dois
    Cenario: Cadastrar funcionario
        Dado que o usuario cadastre um novo funcionario
        Quando ele enviar as informações do funcionario
        Entao esse funcionario sera cadastrado

    @cenario_tres
    Cenario: Alterar informações cadastrais
        Dado que o usuario altere uma informação de funcionario
        Quando ele enviar as novas informações 
        Entao as informações devem ser alteradas

    @cenario_quatro
    Cenario: Deletar cadastro de funcionario
        Dado que o usuario queria deletar um funcionario
        Quando ele enviar a identificação unica 
        Entao esse funcionario sera deletado do sistema