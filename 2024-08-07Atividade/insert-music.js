// importa o prisma
const { PrismaClient } = require("@prisma/client");

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com músicas MPB
async function main() {
    const data = [
        {
            title: "Garota de Ipanema",
            kind: "MPB",
            artist: "Tom Jobim",
            album: "Getz/Gilberto",
            single: false,
            release: new Date('1964-03-10'),
            duration: "5:25",
        },
        {
            title: "Águas de Março",
            kind: "MPB",
            artist: "Tom Jobim",
            album: "Elis & Tom",
            single: false,
            release: "1974-01-01",
            duration: "3:32",
        },
        {
            title: "Chega de Saudade",
            kind: "MPB",
            artist: "João Gilberto",
            album: "Chega de Saudade",
            single: false,
            release: "1959-01-01",
            duration: "2:00",
        },
        {
            title: "Wave",
            kind: "MPB",
            artist: "Tom Jobim",
            album: "Wave",
            single: false,
            release: "1967-01-01",
            duration: "2:56",
        },
        {
            title: "O Barquinho",
            kind: "MPB",
            artist: "Roberto Menescal",
            album: "O Barquinho",
            single: false,
            release: "1961-01-01",
            duration: "2:49",
        },
    ];

    //cadastra as músicas no banco de dados
    await prisma.music.createMany({ data });
    //exibe a mensagem de sucesso
    console.log("Músicas cadastradas com sucesso!");
}

//chama a função main
main();
