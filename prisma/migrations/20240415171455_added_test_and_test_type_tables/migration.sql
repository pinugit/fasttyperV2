/*
  Warnings:

  - You are about to drop the column `username` on the `User` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[email]` on the table `User` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `email` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.
  - Added the required column `passwordHash` to the `User` table without a default value. This is not possible if the table is not empty.

*/
SET @@tidb_allow_remove_auto_inc = 1;
-- AlterTable
ALTER TABLE `User` DROP COLUMN `username`,
    ADD COLUMN `email` VARCHAR(191) NOT NULL,
    ADD COLUMN `name` VARCHAR(191) NOT NULL,
    ADD COLUMN `passwordHash` VARCHAR(191) NOT NULL,
    MODIFY `id` VARCHAR(191) NOT NULL;

-- CreateTable
CREATE TABLE `TestType` (
    `testId` VARCHAR(191) NOT NULL,
    `testType` VARCHAR(191) NOT NULL,
    `testLanguage` VARCHAR(191) NOT NULL,
    `discription` VARCHAR(191) NOT NULL,
    `wordsBoundBy` VARCHAR(191) NULL,
    `timeBoundBy` VARCHAR(191) NULL,

    UNIQUE INDEX `TestType_testId_key`(`testId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserTest` (
    `userTestId` VARCHAR(191) NOT NULL,
    `userId` VARCHAR(191) NOT NULL,
    `testTypeId` VARCHAR(191) NOT NULL,
    `wpm` INTEGER NOT NULL,
    `rawWpm` INTEGER NOT NULL,
    `accuracy` INTEGER NOT NULL,
    `consistancy` INTEGER NOT NULL,
    `testDurationInSec` INTEGER NOT NULL,

    UNIQUE INDEX `UserTest_userTestId_key`(`userTestId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `User_email_key` ON `User`(`email`);

-- AddForeignKey
ALTER TABLE `UserTest` ADD CONSTRAINT `UserTest_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserTest` ADD CONSTRAINT `UserTest_testTypeId_fkey` FOREIGN KEY (`testTypeId`) REFERENCES `TestType`(`testId`) ON DELETE RESTRICT ON UPDATE CASCADE;
