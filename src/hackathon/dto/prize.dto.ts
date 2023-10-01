import { IsNumber, IsString } from "class-validator"

export class PrizeDto {
    @IsString()
    name: string;
    @IsNumber()
    amount: number;
}