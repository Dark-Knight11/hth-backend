import { IsString } from "class-validator"

export class Announcement {
    @IsString()
    title: string;
    @IsString()
    description: string;
    @IsString()
    time: Date;
}