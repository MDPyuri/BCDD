// importa o prisma
const { PrismaClient } = require("@prisma/client");

//instancia o prisma
const prisma = new PrismaClient();

//cria um array de objetos com produtos
async function main() {
  const data = [
    {
      name: 'Smartphone Galaxy S21',
      description: 'Um smartphone avançado com câmera de alta resolução e tela AMOLED.',
      price: 1999.99,
      storage: 128,
      avaliation: 4.8,
      registration_data: new Date(),
    },
    {
      name: 'Notebook Dell XPS 13',
      description: 'Um notebook ultrafino com processador Intel Core i7 e tela de alta definição.',
      price: 1499.99,
      storage: 512,
      avaliation: 4.6,
      registration_data: new Date(),
    },
    {
      name: 'Fones de Ouvido Sony WH-1000XM4',
      description: 'Fones de ouvido com cancelamento de ruído e excelente qualidade de som.',
      price: 349.99,
      storage: 0,
      avaliation: 4.9,
      registration_data: new Date(),
    },
    {
      name: 'Smart TV LG OLED CX',
      description: 'Uma TV com tela OLED de 55 polegadas e suporte a HDR.',
      price: 2499.99,
      storage: 0,
      avaliation: 4.7,
      registration_data: new Date(),
    },
    {
      name: 'Console PlayStation 5',
      description: 'O mais recente console da Sony com gráficos de alta qualidade e jogos exclusivos.',
      price: 499.99,
      storage: 825,
      avaliation: 4.5,
      registration_data: new Date(),
    },
  ];

  //cadastra os produtos no banco de dados
    await prisma.Product.createMany({ data });
  //exibe a mensagem de sucesso
    console.log("Produtos cadastrados com sucesso!");
}

//chama a função main
main();
