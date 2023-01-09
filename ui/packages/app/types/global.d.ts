export { };

declare global {
  type Society = {
    id: number,
    title: string,
    image: string,
    tenure: {
      title: string
    }
  }

  type SocietyEvent = {
    id: number,
    title: string,
    text: string,
    image: string,
    startDate: Date,
    endDate: Date,
    society: Society
  };

  type SocietyPost = {
    id: number,
    title: string,
    text: string,
    image: string,
    event: SocietyEvent
  };
}
