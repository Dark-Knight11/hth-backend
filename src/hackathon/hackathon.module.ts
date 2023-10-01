import { Module } from '@nestjs/common';
import { HackathonService } from './hackathon.service';
import { HackathonController } from './hackathon.controller';

@Module({
  providers: [HackathonService],
  controllers: [HackathonController]
})
export class HackathonModule {}
