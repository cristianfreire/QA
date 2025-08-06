describe('/livros POST', () => {

  before(() => {
    cy.dropCollection('livros', { database: 'test', failSilently: 'true' }).then(result => {
      cy.log(result); // Will return 'Collection dropped' or the error object if collection doesn’t exist. Will not fail the test
    });
  })

  it.only('deve cadastrar um novo livro', () => {

    const livro = {
      "titulo": "O Senhor dos Anéis",
      "autor": "J.R.R. Tolkien",
      "editora": "HarperCollins",
      "anoPublicacao": 1954,
      "numeroPaginas": 1178
    };

    cy.api({
      url: 'http://localhost:5000/api/addlivros',
      method: 'POST',
      body: livro
    }).then(res => {
      //cy.log(res.status)
      expect(res.status).to.eql(201)

      // cy.log(res.body)
      // cy.log(JSON.stringify(res.body))

      expect(res.body.titulo).to.eql(livro.titulo)
      expect(res.body.autor).to.eql(livro.autor)
      expect(res.body.editora).to.eql(livro.editora)
      expect(res.body.anoPublicacao).to.eql(livro.anoPublicacao)
      expect(res.body.numeroPaginas).to.eql(livro.numeroPaginas)
      expect(res.body._id).to.not.be.empty
    })
  })

  it('não deve ter um livro com o título duplicado', () => {

    const livro = {
      "titulo": "O Senhor dos Anéis",
      "autor": "J.R.R. Tolkien",
      "editora": "HarperCollins",
      "anoPublicacao": 1954,
      "numeroPaginas": 1178
    };

    cy.api({
      url: 'http://localhost:5000/api/addlivros',
      method: 'POST',
      body: livro,
      failOnStatusCode: false
    }).then(res => {
      cy.log(res.status)
      expect(res.status).to.eql(409)

      expect(res.body.erro).to.eql("O título do livro já foi cadastrado!")


    })
  })
})


// colocar em commands
Cypress.Commands.add('postLivro', (livro) => {
  cy.api({
    url: 'http://localhost:5000/api/addlivros',
    method: 'POST',
    body: livro,
    failOnStatusCode: false
  }).then(res => {
    return res
  })
})