import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

async function main() {
  /** If the user doesn't exist, Prisma Client will return null */
const findUser = await prisma.user.findUnique({
  where: { userName: "Lorenzo77" },
});

console.log(findUser);
}
  
main()