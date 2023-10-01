import { Module } from '@nestjs/common';
import { AuthModule } from './auth/auth.module';
import { PrismaModule } from './prisma/prisma.module';
import { ConfigModule } from '@nestjs/config';
import { HackathonModule } from './hackathon/hackathon.module';
import { TeamModule } from './team/team.module';
import { SecurityModule } from './security/security.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    AuthModule, 
    PrismaModule, HackathonModule, TeamModule, SecurityModule
  ]
})
export class AppModule {}
