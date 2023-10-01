/*
  Warnings:

  - You are about to drop the `Hackathon_Organized` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Hackathon_Organized" DROP CONSTRAINT "Hackathon_Organized_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "Hackathon_Organized" DROP CONSTRAINT "Hackathon_Organized_user_id_fkey";

-- DropTable
DROP TABLE "Hackathon_Organized";
