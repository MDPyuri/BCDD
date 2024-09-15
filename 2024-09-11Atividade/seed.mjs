import { PrismaClient } from "@prisma/client";
import { Faker, pt_BR } from "@faker-js/faker";

const prisma = new PrismaClient();

const seed = async () => {
  await prisma.user.deleteMany();
  const faker = new Faker({ locale: [pt_BR] });
  faker.seed(1);
  const data = Array.from({ length: 1000 }, () => {
    const status = faker.helpers.arrayElement(["active", "inactive"]);
    const userName = faker.internet.userName();
    const bio = faker.helpers.maybe(() => faker.lorem.sentence(), 0.8);
    const phone = faker.phone.number();
    const avatar = faker.helpers.maybe(() => faker.image.avatarGitHub(), 0.98);
    const createdAt = faker.date.past({ years: 1 });
    const city = faker.location.city();
    const region = faker.location.country();
    const birthDate = faker.date.birthdate({
      min: 14,
      max: 20,
      mode: "age"
    });

    return {
      status, 
      userName,
      bio,
      phone, 
      avatar, 
      createdAt,
      city, 
      region,
      birthDate,
    };
  });
  console.log(data)
  await prisma.user.createMany({ data, skipDuplicates: true});
};

seed()
  .catch((e) => {
    throw e;
  })
  .finally(async () => {
    await prisma.$disconnect();
  });