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

  type Team = {
    id: number,
    code: string,
    name: string,
    society: string,
    memberships: TeamMember[]
  }

  type TeamMember = {
    id: number,
    team: Team,
    user: User
  }

  type TeamMessage = {
    id: number,
    content: string,
    sender: User,
    team: Team,
    createdAt: Date
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
    tenure: Tenure
    muted: boolean
    totalEvents: number
    totalMembers: number
  }

  type BaseSociety = {
    id: number
    code: string
    name: string
    fullName: string
    image: string
  }

  type Tenure = {
    id: number
    code: string
    description: string
    duration: string
    societies: Society[]
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
    updatedAt: Date
    publishedAt?: Date
    published: boolean
    society: Society
    reacted: boolean
    totalReacts: number
    totalComments: number
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
    'EVENT_UPDATE' |
    'EVENT_DELETE' |
    'POST_CREATE' |
    'POST_DELETE' |
    'COMMENT_CREATE' |
    'COMMENT_DELETE' |
    'MEMBER_ADD' |
    'MEMBER_REMOVE' |
    'MEMBER_UPDATE' |
    'TEAM_CREATE' |
    'TEAM_UPDATE' |
    'TEAM_DELETE' |
    'TEAM_MEMBER_ADD' |
    'TEAM_MEMBER_REMOVE' |
    'TEAM_MEMBER_UPDATE'
}
