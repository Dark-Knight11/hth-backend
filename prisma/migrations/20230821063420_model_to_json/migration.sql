/*
  Warnings:

  - You are about to drop the `Rule` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Rule" DROP CONSTRAINT "Rule_hackathon_id_fkey";

-- AlterTable
ALTER TABLE "Hackathon" ADD COLUMN     "rules" JSONB[];

-- DropTable
DROP TABLE "Rule";
