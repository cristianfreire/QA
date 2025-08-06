describe('Cadastro de Usuário', () => {
  it('Deve cadastrar usuário com dados válidos', () => {
    cy.visit('http://127.0.0.1:8080/') // Altere para o caminho do seu index.html no servidor local

    cy.get('#nome').type('Cristian QA')
    cy.get('#email').type('cristian@example.com')
    cy.get('#senha').type('123456')
    cy.get('#cargo').select('QA')
    cy.get('#termos').check()
    cy.get('#arquivo').selectFile('cypress/fixtures/teste.txt') // coloque um arquivo de teste nessa pasta

    cy.contains('Cadastrar').click()

    cy.on('window:alert', (msg) => {
      expect(msg).to.equal('Cadastro realizado com sucesso!')
    })
  })
})
