/*
  Warnings:

  - The `rules` column on the `Hackathon` table would be dropped and recreated. This will lead to data loss if there is data in the column.

*/
-- AlterTable
ALTER TABLE "Hackathon" DROP COLUMN "rules",
ADD COLUMN     "rules" JSONB[] DEFAULT ARRAY[]::JSONB[];