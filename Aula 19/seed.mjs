import { PrismaClient } from "@prisma/client";
import { Faker, pt_BR } from "@faker-js/faker";

const prisma = new PrismaClient();

const seed = async () => {
  // deletar todos os registros antes de começar...
  await prisma.user.deleteMany();

  //utilizar noes brasileiros
  const faker = new Faker({ locale: [pt_BR] });

  //tornar o resultado previsível
  faker.seed(1);

  //criação de objetos "data" que será passado para o prisma cadastrar
  const data = Array.from({ length: 100 }, () => {
    const birthDate = faker.date.birthdate({
      minAge: 14,
      maxAge: 20,
      mode: "age",
    });
    const status = faker.helpers.arrayElement(["active", "inactive"]);
    const userName = faker.internet.userName();
    const bio = faker.helpers.maybe(() => faker.lorem.sentence(), 0.8);
    const phone = faker.phone.number();
    const avatar = faker.helpers.maybe(() => faker.image.avatarGitHub(), 0.98);
    const createdAt = faker.date.past({ years: 1 });
    const city = faker.location.city();
    const region = faker.location.country();

    return {
      birthDate,
      status,
      userName,
      bio,
      phone,
      avatar,
      createdAt,
      city,
      region,
    };
  });

	await prisma.user.createMany({ data, skipDuplicates: true });
};

seed()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
