import { apiUrl } from "./config";

export function getPublicUri(name: string) : string {
  const uri = name.startsWith('http')
  ? name
  : apiUrl + '/public/' + name
  return uri;
}

export function toDateString(date: Date) : string {
  return date.toISOString();
}

export function toShortDateString(date: Date): string {
  return (new Date(date)).toUTCString().slice(5, 16)
}

export function toTimeAndDateString(date: Date): string {
  date = new Date(date);

  const timeString = date.toTimeString();
  const dateString = date.toDateString() ;

  const hhmm = timeString.slice(0,5)
  const mmmdd = dateString.slice(4, 10)

  return `${hhmm}, ${mmmdd}`
}
