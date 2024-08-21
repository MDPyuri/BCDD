import { PrismaClient } from "@prisma/client";
import { Faker, pt_BR } from "@faker-js/faker";

const prisma = new PrismaClient();

const seed = async () => {
  // deletar todos os registros antes de começar...
  await prisma.faker.deleteMany();

  //utilizar noes brasileiros
  const faker = new Faker({ locale: [pt_BR] });

  //tornar o resultado previsível
  faker.seed(1);

  //criação de objetos "data" que será passado para o prisma cadastrar
  const data = Array.from({ length: 100 }, () => {
    const fullName = faker.person.fullName();
    const birthDate = faker.date.birthdate({
      minAge: 14,
      maxAge: 20,
      mode: "age",
    });
    const email = faker.internet.email({ firstName: fullName });
    const password = faker.internet.password({ length: 8 });
    const state = faker.location.state();
    const userName = faker.internet.userName({ firstName: fullName });
    const bio = faker.helpers.maybe(() => faker.lorem.sentence(), 0.8);
    const phone = faker.phone.number();
    const avatar = faker.helpers.maybe(() => faker.image.avatarGitHub(), 0.98);
    const status = faker.helpers.maybe(() => faker.helpers.arrayElement(["active", "inactive"]),0.8);
    const createdAt = faker.date.past({ years: 1 });

    return {
      fullName,
      birthDate,
      email,
      password,
      state,
      userName,
      bio,
      phone,
      avatar,
      status,
      createdAt,
    };
  });

	await prisma.faker.createMany({ data, skipDuplicates: true });
};

seed()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });
