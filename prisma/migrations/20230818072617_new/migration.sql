/*
  Warnings:

  - You are about to drop the column `userId` on the `Hackathon` table. All the data in the column will be lost.
  - Added the required column `user_id` to the `Hackathon` table without a default value. This is not possible if the table is not empty.
  - Made the column `name` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `description` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `start_date` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `end_date` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `application_deadline` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `application_open` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `venue` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `min_team_size` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `max_team_size` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `theme` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.
  - Made the column `imgUrl` on table `Hackathon` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Hackathon" DROP CONSTRAINT "Hackathon_userId_fkey";

-- AlterTable
ALTER TABLE "Hackathon" DROP COLUMN "userId",
ADD COLUMN     "user_id" TEXT NOT NULL,
ALTER COLUMN "name" SET NOT NULL,
ALTER COLUMN "description" SET NOT NULL,
ALTER COLUMN "start_date" SET NOT NULL,
ALTER COLUMN "end_date" SET NOT NULL,
ALTER COLUMN "application_deadline" SET NOT NULL,
ALTER COLUMN "application_open" SET NOT NULL,
ALTER COLUMN "venue" SET NOT NULL,
ALTER COLUMN "min_team_size" SET NOT NULL,
ALTER COLUMN "min_team_size" SET DEFAULT 1,
ALTER COLUMN "max_team_size" SET NOT NULL,
ALTER COLUMN "theme" SET NOT NULL,
ALTER COLUMN "imgUrl" SET NOT NULL;

-- AlterTable
ALTER TABLE "User" ADD COLUMN     "token" TEXT;

-- CreateTable
CREATE TABLE "Hackathon_Organized" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Hackathon_Organized_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hackathon_Participated" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Hackathon_Participated_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Hackathon_Judged" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Hackathon_Judged_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Team" (
    "id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "User_Team_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "WinnerInHackathon" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,

    CONSTRAINT "WinnerInHackathon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ParticipantInHackathon" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,

    CONSTRAINT "ParticipantInHackathon_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Rule" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "title" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Rule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "ProblemStatement" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "description" TEXT NOT NULL DEFAULT '',
    "title" TEXT NOT NULL DEFAULT '',
    "category" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "ProblemStatement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Partner" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "website" TEXT NOT NULL DEFAULT '',
    "logo" TEXT DEFAULT '',

    CONSTRAINT "Partner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Prize" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "name" TEXT NOT NULL DEFAULT '',
    "amount" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Prize_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Faq" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "question" TEXT NOT NULL DEFAULT '',
    "answer" TEXT NOT NULL DEFAULT '',

    CONSTRAINT "Faq_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Announcement" (
    "id" TEXT NOT NULL,
    "hackathon_id" TEXT NOT NULL,
    "title" TEXT NOT NULL DEFAULT '',
    "description" TEXT NOT NULL DEFAULT '',
    "time" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Announcement_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Team" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Team_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Team_Members" (
    "id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,
    "user_id" TEXT NOT NULL,

    CONSTRAINT "Team_Members_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Submission" (
    "id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "links" TEXT[] DEFAULT ARRAY[]::TEXT[],

    CONSTRAINT "Submission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Review" (
    "id" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,
    "judge_id" TEXT NOT NULL,
    "review" TEXT NOT NULL,
    "score" INTEGER NOT NULL,

    CONSTRAINT "Review_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Submission_team_id_key" ON "Submission"("team_id");

-- AddForeignKey
ALTER TABLE "Hackathon_Organized" ADD CONSTRAINT "Hackathon_Organized_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon_Organized" ADD CONSTRAINT "Hackathon_Organized_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon_Participated" ADD CONSTRAINT "Hackathon_Participated_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon_Participated" ADD CONSTRAINT "Hackathon_Participated_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon_Judged" ADD CONSTRAINT "Hackathon_Judged_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon_Judged" ADD CONSTRAINT "Hackathon_Judged_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Team" ADD CONSTRAINT "User_Team_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Team" ADD CONSTRAINT "User_Team_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Hackathon" ADD CONSTRAINT "Hackathon_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WinnerInHackathon" ADD CONSTRAINT "WinnerInHackathon_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "WinnerInHackathon" ADD CONSTRAINT "WinnerInHackathon_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParticipantInHackathon" ADD CONSTRAINT "ParticipantInHackathon_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ParticipantInHackathon" ADD CONSTRAINT "ParticipantInHackathon_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Rule" ADD CONSTRAINT "Rule_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "ProblemStatement" ADD CONSTRAINT "ProblemStatement_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Partner" ADD CONSTRAINT "Partner_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Prize" ADD CONSTRAINT "Prize_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Faq" ADD CONSTRAINT "Faq_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Announcement" ADD CONSTRAINT "Announcement_hackathon_id_fkey" FOREIGN KEY ("hackathon_id") REFERENCES "Hackathon"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Team_Members" ADD CONSTRAINT "Team_Members_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Team_Members" ADD CONSTRAINT "Team_Members_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Submission" ADD CONSTRAINT "Submission_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Team"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Review" ADD CONSTRAINT "Review_judge_id_fkey" FOREIGN KEY ("judge_id") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
