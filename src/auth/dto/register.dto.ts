import { IsEmail, IsNotEmpty, IsString } from "class-validator";

export class RegisterDto {
    @IsNotEmpty()
    first_name: string;
    
    @IsNotEmpty()
    last_name: string; 
    
    @IsEmail()
    @IsNotEmpty()
    email: string;
    
    @IsNotEmpty()
    @IsString()
    password: string;
}