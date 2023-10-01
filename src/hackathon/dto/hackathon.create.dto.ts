import { IsDate, IsNotEmpty, IsNumber } from "class-validator";

export class CreateHackathonDTO {
    @IsNotEmpty()
    name: string;
    @IsNotEmpty()
    start_date: Date;
    @IsNotEmpty()
    end_date: Date;
    @IsNotEmpty()
    imgUrl: string;
    @IsNotEmpty()
    description: string;
    @IsNotEmpty()
    application_deadline: Date;
    @IsNotEmpty()
    application_open: Date;
    @IsNotEmpty()
    @IsNumber()
    max_team_size: number;
    @IsNotEmpty()
    @IsNumber()
    min_team_size: number;
    @IsNotEmpty()
    venue: string;
    @IsNotEmpty()
    theme: string
}