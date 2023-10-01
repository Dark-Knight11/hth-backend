import { HackathonDTO } from "./dto"
import { Prisma } from '@prisma/client';
import { PrismaService } from "src/prisma/prisma.service";
import { v4 as uuidv4 } from 'uuid';


export function updateQuery(hackathonDTO: HackathonDTO) {
    var query = {};
    for (const property in hackathonDTO) {
        if (hackathonDTO[property] != null && hackathonDTO[property].constructor !== Object) {
            query = {
                ...query,
                [property]: hackathonDTO[property]
            }
        } else if (hackathonDTO[property] != null && hackathonDTO[property].constructor === Object) {
            query = {
                ...query,
                [property]: {
                    push: {
                        id: uuidv4(),
                        ...hackathonDTO[property]
                    } as Prisma.JsonValue
                }
            }
        }
    }
    return query;
}

export async function checkAdminRights(hid: string, userId: string, prismaService: PrismaService) {
    const hackathonData = await prismaService.hackathon.findUnique({
        where: {
            id: hid,
            user_id: userId
        }
    })
    if (!hackathonData) {
        // send with 400 status code
        return {
            message: "Hackathon not found or you're not the admin."
        };           
    }
}
    