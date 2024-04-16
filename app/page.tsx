import prisma from "./utils/prismaClient";

export default async function Home() {
  // await prisma.user.deleteMany();
  return <h1>homepage</h1>;
}
