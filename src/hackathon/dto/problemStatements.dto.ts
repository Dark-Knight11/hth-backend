import { IsString } from "class-validator"

export class Problem_Statement {
    @IsString()
    description: string
    @IsString()
    title: string
    @IsString()
    category: string
}