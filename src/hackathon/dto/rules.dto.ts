import { IsString } from 'class-validator';

export class RulesDto {
    @IsString()
    title: string;
    @IsString()
    description: string;
}