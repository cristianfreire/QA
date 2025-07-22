describe('/livros POST', () => {
  it('deve cadastrar um novo livro', () => {

    const livro = {
      "titulo": "O Senhor dos Anéis",
      "autor": "J.R.R. Tolkien",
      "editora": "HarperCollins",
      "anoPublicacao": 1954,
      "numeroPaginas": 1178
    };

    cy.api({
      url:'http://localhost:5000/api/addlivros',
      method: 'POST',
      body: livro
    }).then(res =>{
      //cy.log(res.status)
      expect(res.status).to.eql(201)

      cy.log(res.body)
      cy.log(JSON.stringify(res.body))

      expect(res.body.titulo).to.eql(livro.titulo)
      expect(res.body.autor).to.eql(livro.autor)
      expect(res.body.editora).to.eql(livro.editora)
      expect(res.body.anoPublicacao).to.eql(livro.anoPublicacao)
      expect(res.body.numeroPaginas).to.eql(livro.numeroPaginas)
      expect(res.body._id).to.not.be.empty
    })
  })
})

