const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const data = await prisma.user.findUnique({
    where: {
      userName: "Morgana.Franco9"
    }
  })
  console.log(data)
};
main();