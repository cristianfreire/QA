const mogoose = require('mongoose')

// Define o schema do livro
const LivroSchema = new mogoose.Schema({
    titulo: { type: String, required: true},
    autor: { type: String, required: true},
    editora: { type: String, required: true},
    anoPublicacao: { type: Number, required: true},
    numeroPaginas: { type: Number, required: true},
});

// Criando o modelo do livro
const Livro = mogoose.model('Livro', LivroSchema);

module.exports = Livro;