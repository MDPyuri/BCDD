const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const data = await prisma.user.findMany({
    where: {
      city: "Isabelly do sul"
    }
  })
  console.log(data)
};
main();