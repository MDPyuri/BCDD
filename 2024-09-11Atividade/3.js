const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  let dataAtual = new Date();
  dataAtual.setMonth(dataAtual.getMonth() - 1);
  const data = await prisma.user.findMany({
    where: {
      createdAt: {gte: dataAtual}
    }
  })
  console.log(data)
};
main();