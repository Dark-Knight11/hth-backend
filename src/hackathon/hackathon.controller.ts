import { Controller, Delete, Param, ParseUUIDPipe, Put, Req, UseGuards } from '@nestjs/common';
import { HackathonService } from './hackathon.service';
import { CreateHackathonDTO, HackathonDTO } from './dto';
import {Post, Body, Get} from '@nestjs/common';
import { GetUser } from 'src/security/decorator';
import { JwtGuard } from 'src/security/guard/jwt.guard';

@Controller('hackathon')
export class HackathonController {
    constructor(private readonly hackathonService: HackathonService) { }
    
    @Post()
    @UseGuards(JwtGuard)
    createHackathon(
        @Body() createHackathonDto: CreateHackathonDTO,
        @GetUser('id') userId: string,
    ) {
        return this.hackathonService.createHackathon(createHackathonDto, userId);
    }

    @Get()
    getHackathon() {
        return this.hackathonService.getAllHackathon();
    }

    @Put(':id') 
    @UseGuards(JwtGuard)
    updateHackathon(
        @Body() hackathonDTO: HackathonDTO,
        @Param('id', ParseUUIDPipe) id: string,
        @GetUser('id') userId: string
    ) {
        return this.hackathonService.updateHackathon(
            id,
            hackathonDTO,
            userId
        );
    }

    @Delete(':id')
    @UseGuards(JwtGuard)
    deleteHackathon(
        @Param('id', ParseUUIDPipe) id: string,
        @GetUser('id') userId: string
    ) {
        return this.hackathonService.deletehackathon(id, userId);
    }


}
