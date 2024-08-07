// importa o prisma
const { PrismaClient } = require('@prisma/client');

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com as músicas
async function main() {
    const data = [
        { title: 'Astronomia', kind: 'Eletrônica', artist: 'Vicetone', album: 'Astronomia', single: false, release: '2014-06-13', duration: '3:19'},
        { title: 'The Nights', kind: 'Eletrônica', artist: 'Avicii', album: 'The Days / Nights', single: false, release: '2014-12-01', duration: '2:56'},
        { title: 'Wake Me Up', kind: 'Eletrônica', artist: 'Avicii', album: 'True', single: false, release: '2013-06-17', duration: '4:09'},
        { title: 'Levels', kind: 'Eletrônica', artist: 'Avicii', album: 'Levels', single: false, releae: '2011-07-28', duration: '3:22'},
        { title: 'Hey Brother', kind: 'Eletrônica', artist: 'Avicii', album: 'True', single: false, release: '2013-09-01', duration: '4:14'},
    ];
    //cadastra as músicas no banco de dados
    await prisma.user.createMany({ data });
    //exibe a mensagem de sucesso
    console.log("Músicas cadastradas com sucesso!");
}

//chama a função main
main();