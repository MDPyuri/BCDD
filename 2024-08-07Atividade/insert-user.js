// importa o prisma
const { PrismaClient } = require("@prisma/client");

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com usuários
async function main() {
    const data = [
        {
            name: "Alice Silva",
            username: "alice_silva",
            role: "USER",
            email: "alice@example.com",
            password: "senha123",
            birth: new Date("1990-01-01"),
        },
        {
            name: "Bruno Costa",
            username: "bruno_costa",
            role: "USER",
            email: "bruno@example.com",
            password: "senha123",
            birth: new Date("1992-02-02"),
        },
        {
            name: "Carla Souza",
            username: "carla_souza",
            role: "USER",
            email: "carla@example.com",
            password: "senha123",
            birth: new Date("1994-03-03"),
        },
        {
            name: "Daniel Lima",
            username: "daniel_lima",
            role: "USER",
            email: "daniel@example.com",
            password: "senha123",
            birth: new Date("1996-04-04"),
        },
        {
            name: "Elena Rocha",
            username: "elena_rocha",
            role: "USER",
            email: "elena@example.com",
            password: "senha123",
            birth: new Date("1998-05-05"),
        },
    ];

  //cadastra os usuários no banco de dados
    await prisma.User.createMany({ data });
  //exibe a mensagem de sucesso
    console.log("Usuários cadastrados com sucesso!");
}

//chama a função main
main();
