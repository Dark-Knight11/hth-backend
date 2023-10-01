import { Announcement } from './announcement.dto';
import { FAQ } from './faq.dto';
import { PartnersDto } from './partners.dto';
import { PrizeDto } from './prize.dto';
import { Problem_Statement } from './problemStatements.dto';
import { RulesDto } from './rules.dto';
import { IsNumber, IsOptional, IsString, Validate, ValidateNested } from 'class-validator';
import { Type } from 'class-transformer';

export class HackathonDTO {
    @IsString()
    @IsOptional()
    name?: string;

    @IsString()
    @IsOptional()
    description?: string;

    @IsString()
    @IsOptional()
    start_date?: Date;

    @IsString()
    @IsOptional()
    end_date?: Date;

    @IsString()    
    @IsOptional()
    application_deadline?: Date;

    @IsString()
    @IsOptional()
    application_open?: Date;

    @IsString()
    @IsOptional()
    venue?: string;

    @IsNumber()
    @IsOptional()
    max_team_size?: number;

    @IsNumber()
    @IsOptional()
    min_team_size?: number;

    @IsString()
    @IsOptional()
    theme?: string;

    @IsString()
    @IsOptional()
    imgUrl?: string;

    @ValidateNested()
    @IsOptional()
    @Type(() => RulesDto)
    rules?: RulesDto;

    @ValidateNested()
    @IsOptional()
    @Type(() => Problem_Statement)
    problemStatements?: Problem_Statement;

    @ValidateNested()
    @IsOptional()
    @Type(() => PartnersDto)
    partners?: PartnersDto;

    @ValidateNested()
    @IsOptional()
    @Type(() => PrizeDto)
    prizes?: PrizeDto;

    @ValidateNested()
    @IsOptional()
    @Type(() => FAQ)
    faqs?: FAQ;

    @ValidateNested()
    @IsOptional()
    @Type(() => Announcement)
    announcements?: Announcement;
}