import { Injectable, ForbiddenException } from '@nestjs/common';
import { RegisterDto, LoginDto } from './dto';
import * as argon from 'argon2';
import { PrismaService } from '../prisma/prisma.service';
import { Prisma } from '@prisma/client';
import { JwtService } from '@nestjs/jwt';
import { ConfigService } from '@nestjs/config';

@Injectable()
export class AuthService {
    constructor(
      private readonly prisma: PrismaService,  
      private readonly jwt: JwtService,
      private readonly config: ConfigService,
    ) {}
    async register(registerDto: RegisterDto) {
        const hash = await argon.hash(registerDto.password);
        try {
          const user = await this.prisma.user.create({
            data: {
              email: registerDto.email,
              password: hash,
              first_name: registerDto.first_name,
              last_name: registerDto.last_name,
            },
          });
          delete user.password;
            return user;
        } catch (error) {
          if (error instanceof Prisma.PrismaClientKnownRequestError) {
            if (error.code === 'P2002') {
              throw new ForbiddenException(
                'Credentials taken',
              );
            }
          }
          throw error;
        }
    }

    async login(loginDto: LoginDto) {
      const user = await this.prisma.user.findUnique({
          where: { email: loginDto.email },
        });
        if (!user) {
          throw new ForbiddenException('Credentials incorrect');
        }
          
        // compare password
        const pwMatches = await argon.verify(
          user.password,
          loginDto.password,
        );
        // if password incorrect throw exception
        if (!pwMatches) {
          throw new ForbiddenException('Credentials incorrect');
        }
      return this.signToken(user.id, user.email);
    }   

    async forgotPassword(email: string) {
        return {msg: 'Forgot Password'};
    }

    async resetPassword(newPassword: string) {
        return {msg: 'Reset Password'};
    }
  
    private async signToken(
      userId: string,
      email: string,
    ) {
      const payload = {
        id: userId,
        email: email,
      };
      const secret = this.config.get('JWT_SECRET');

      const token = await this.jwt.signAsync(payload, {
          expiresIn: '30d',
          secret: secret,
        },
      );

      return {
        access_token: token,
      };
    }
}
