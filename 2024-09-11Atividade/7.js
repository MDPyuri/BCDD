const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const data = await prisma.user.findMany({
    where: {
      phone: {not: null}
    }
  })
  console.log(data)
};
main();