/*
  Warnings:

  - You are about to drop the `Announcement` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Faq` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Partner` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Prize` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `ProblemStatement` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Review` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "Announcement" DROP CONSTRAINT "Announcement_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "Faq" DROP CONSTRAINT "Faq_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "Partner" DROP CONSTRAINT "Partner_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "Prize" DROP CONSTRAINT "Prize_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "ProblemStatement" DROP CONSTRAINT "ProblemStatement_hackathon_id_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_judge_id_fkey";

-- DropForeignKey
ALTER TABLE "Review" DROP CONSTRAINT "Review_team_id_fkey";

-- AlterTable
ALTER TABLE "Hackathon" ADD COLUMN     "announcements" JSONB[] DEFAULT ARRAY[]::JSONB[],
ADD COLUMN     "faqs" JSONB[] DEFAULT ARRAY[]::JSONB[],
ADD COLUMN     "partners" JSONB[] DEFAULT ARRAY[]::JSONB[],
ADD COLUMN     "prizes" JSONB[] DEFAULT ARRAY[]::JSONB[],
ADD COLUMN     "problem_statements" JSONB[] DEFAULT ARRAY[]::JSONB[];

-- AlterTable
ALTER TABLE "Team" ADD COLUMN     "reviews" JSONB[] DEFAULT ARRAY[]::JSONB[];

-- DropTable
DROP TABLE "Announcement";

-- DropTable
DROP TABLE "Faq";

-- DropTable
DROP TABLE "Partner";

-- DropTable
DROP TABLE "Prize";

-- DropTable
DROP TABLE "ProblemStatement";

-- DropTable
DROP TABLE "Review";
