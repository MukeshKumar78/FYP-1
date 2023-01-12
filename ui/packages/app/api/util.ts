import Constants from 'expo-constants';

const API_URL = Constants.expoConfig?.extra?.apiRoot;

export function getPublicUri(name: string) : string {
  const uri = name.startsWith('http')
  ? name
  : API_URL + '/public/' + name
  return uri;
}

export function toDateString(date: Date) : string {
  return date.toISOString();
}
