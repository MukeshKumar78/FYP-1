export { };

declare global {


  type User = {
    id: number
    code: string
    firstName: string
    lastName: string
    photo: string
    email: string
    memberships: Membership[]
  }

  type Membership = {
    id: number
    user: User
    role: string
    permissions: string[]
    society: Society
  }

  type Society = {
    id: number
    code: string
    name: string
    fullName: string
    description?: string
    image: string
    createdAt: Date
    base: BaseSociety
    tenure: {
      id: number
      code: string
      description: string
      duration: string
    }
  }

  type BaseSociety = {
    id: number
    code: string
    name: string
    fullName: string
    image: string
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
    id: number
    title: string
    text: string
    attachments: string[]
    event: SocietyEvent
    createdAt: Date
    createdBy: User
  };

  type EventComment = {
    id: number
    code: string
    text: string
    createdBy: User
    createdAt: Date
    eventId: number
  }

  type Permission =
    'EVENT_CREATE' |
    'EVENT_READ' |
    'EVENT_PUBLISH' |
    'EVENT_DELETE' |
    'POST_CREATE' |
    'POST_DELETE' |
    'COMMENT_CREATE' |
    'COMMENT_DELETE' |
    'MEMBER_ADD' |
    'MEMBER_REMOVE' |
    'MEMBER_UPDATE'
}
