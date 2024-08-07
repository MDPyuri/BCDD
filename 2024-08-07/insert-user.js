// insert-user.js
// importa o prisma
const { PrismaClient } = require('@prisma/client');

//instancia o prisma
const prisma = new PrismaClient();

//cria um objeto com o nome do usuário
async function main() {
    const data = { name: "Hello, Prisma!" };
    //cria o usuário no banco de dados
    await prisma.user.create({ data });
    //exibe a mensagem de sucesso
    console.log("Cadastro realizado com sucesso!");
}

//chama a função main
main();
