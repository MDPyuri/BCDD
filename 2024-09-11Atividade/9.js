const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const data = await prisma.user.findMany({
    where: {
      bio: {contains: "Architecto"}
    }
  })
  console.log(data)
};
main();