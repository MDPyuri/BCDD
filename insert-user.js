const { PrismaClient } = require('@prisma/client')

const prisma = new PrismaClient();

async function main() {
    await prisma.user.create({
        data: {
            name: "Hello, Prisma!",
            email: "hello@gmail.com"
        }
    });
}

main();