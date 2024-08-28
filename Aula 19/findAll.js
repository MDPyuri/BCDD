const { PrismaClient } = require("@prisma/client");
const prisma = new PrismaClient();
import { subMonths, format } from 'date-fns';

//utilizando date-fns para manipulação de datas
// Obter a data atual
const dataAtual = new Date();

// Subtrair um mês da data atual
const ultimoMes = subMonths(dataAtual, 1);

// Formatar a data para um formato legível (opcional)
const dataFormatada = format(ultimoMes, 'yyyy-MM-dd');
async function main() {
  const lasts = await prisma.user.findMany(
    {
      where: {
        createdAt: {
          gte: dataFormatada,
      },
    }
});
  console.log(lasts);
}

main()
