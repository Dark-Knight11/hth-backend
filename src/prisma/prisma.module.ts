import { Global, Module } from '@nestjs/common';
import { PrismaService } from './prisma.service';

@Global()
@Module({
  providers: [PrismaService],
  exports: [PrismaService] // if you want to export your service of this module to some other modules, you can do it here
})
export class PrismaModule {}
