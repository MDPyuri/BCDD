// importa o prisma
const { PrismaClient } = require('@prisma/client');

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com o nome dos usuários
async function main() {
    //seleciona todos os usuários
    const users = await prisma.user.findMany();
    //exibe os usuários
    console.log(users);
}

//chama a função main
main();

//findMany = SELECT * FROM users;