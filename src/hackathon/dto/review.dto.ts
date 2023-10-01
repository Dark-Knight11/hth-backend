import { IsNumber, IsString } from "class-validator";


export class Review {
    @IsString()
    judge_id: string;
    @IsString()
    review: string;
    @IsNumber()
    score: number;
}