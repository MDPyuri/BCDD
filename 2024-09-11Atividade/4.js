const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();

async function main() {
  const users = await prisma.user.findMany();
  const birthString = users.map(user => ({
    ...user,
    birthDate: user.birthDate.toISOString() // Converte a data para string no formato ISO
  }));

  const filteredUsers = birthString.filter(user =>
    user.birthDate.includes("-01-")
  );

  console.log(filteredUsers);
}

main();
