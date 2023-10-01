-- CreateTable
CREATE TABLE "Hackathon" (
    "id" TEXT NOT NULL,
    "name" TEXT,
    "description" TEXT,
    "start_date" TIMESTAMP(3),
    "end_date" TIMESTAMP(3),
    "application_deadline" TIMESTAMP(3),
    "application_open" TIMESTAMP(3),
    "venue" TEXT,
    "min_team_size" INTEGER,
    "max_team_size" INTEGER,
    "theme" TEXT,
    "imgUrl" TEXT,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Hackathon_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Hackathon" ADD CONSTRAINT "Hackathon_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
