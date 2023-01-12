export { };

declare global {


  type User = {
    id: number
    firstName: string
    lastName: string
    photo: string
    email: string
    memberships: Membership[]
  }

  type Membership = {
    role: string
    society: Society
  }

  type Society = {
    id: number
    name: string
    fullName: string
    description?: string
    image: string
    createdAt: Date
    tenure: {
      id: number
      code: string
      description: string
      duration: string
    }
  }

  type SocietyEvent = {
    id: number
    code: string
    title: string
    text: string
    attachments: string[]
    startDate: Date
    endDate: Date
    createdAt: Date
    publishedAt?: Date
    published: boolean
    society: Society
  };

  type SocietyPost = {
    id: number,
    title: string,
    text: string,
    attachments: string[]
    event: SocietyEvent
  };
}
