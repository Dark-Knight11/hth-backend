import { Module, Global } from '@nestjs/common';
import { JwtStrategy } from "./jwt.strategy";

@Global()
    @Module({
    providers: [JwtStrategy],
    exports: [JwtStrategy],
})
export class SecurityModule {}