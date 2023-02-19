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
