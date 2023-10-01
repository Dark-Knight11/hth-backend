import { IsString } from "class-validator";

export class PartnersDto {
    @IsString()
    name: string;
    @IsString()
    website: string;
    @IsString()
    logo: string;
}