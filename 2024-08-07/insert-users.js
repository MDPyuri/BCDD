// importa o prisma
const { PrismaClient } = require('@prisma/client');

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com o nome dos usuários
async function main() {
    const data = [
        { name: "Anderson" },
        { name: "João" },
        { name: "Maria" },
        { name: "José" },
        { name: "Ana" }
    ];
    //cria os usuários no banco de dados
    await prisma.user.createMany({ data });
    //exibe a mensagem de sucesso
    console.log("Cadastro realizado com sucesso!");
}

//chama a função main
main();
