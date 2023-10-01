import { Module } from '@nestjs/common';
import { AuthService } from './auth.service';
import { AuthController } from './auth.controller';
import { JwtModule } from '@nestjs/jwt';

@Module({
  imports: [JwtModule.register({})], // if any external modules are required by this module, they should be imported here
  providers: [AuthService], // all dependenices required by controller are provided here
  controllers: [AuthController] // controller handles the request and response from client side
})
export class AuthModule {}
