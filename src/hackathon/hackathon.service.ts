import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateHackathonDTO, HackathonDTO } from './dto';
import { updateQuery } from './hackathon.helper.functions';

@Injectable()
export class HackathonService {
    constructor(private readonly prismaService: PrismaService) { }
    
    async createHackathon(createHackathonDto: CreateHackathonDTO, userId: string) {
        const hackathon = await this.prismaService.hackathon.create({
            data: {
                user_id: userId,
                ...createHackathonDto
            }
        })
        return hackathon;
    }

    async getAllHackathon() {
        const hackathon = await this.prismaService.hackathon.findMany({
            include: {
                admin: {
                    select: {
                        first_name: true,
                        last_name: true,
                        email: true,
                        id: true
                    }
                },
            }
        });
        return hackathon;
    }

    async updateHackathon(hid: string, hackathonDTO: HackathonDTO, userId: string) {
        var query = updateQuery(hackathonDTO);
        await this.checkAdminRights(hid, userId);
        await this.prismaService.hackathon.update({
            where: {
                id: hid,
                user_id: userId
            },
            data: query
        })
        return {
            message: "Hackathon updated successfully."
        };
    }

    async deletehackathon(hid: string, userId: string) {
        // check admin rights and if not admin, send 400 status code
        try {
            await this.checkAdminRights(hid, userId);
        } catch (error) {
            return {
                message: "Hackathon not found or you're not the admin."
            };
        } finally {
            await this.prismaService.hackathon_Judged.deleteMany({
                where: {
                    hackathon_id: hid
                }
            })
            await this.prismaService.hackathon_Participated.deleteMany({
                where: {
                    hackathon_id: hid
                }
            })
            await this.prismaService.hackathon.delete({
                where: {
                    id: hid
                }
            })
            return {
                message: "Hackathon deleted successfully."
            };
        }
    }

    private async checkAdminRights(hid: string, userId: string) {
        const hackathonData = await this.prismaService.hackathon.findUnique({
            where: {
                id: hid,
                user_id: userId
            }
        })
        if (!hackathonData) {
            // send with 400 status code
            return Promise.reject({
                message: "Hackathon not found or you're not the admin."
            });
        }
    }
}
