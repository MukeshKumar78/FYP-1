import Cookies from 'js-cookie';

export function getItem(key: string) {
  return Cookies.get(key)
}

export function setItem(key: string, value: string) {
  return Cookies.set(key, value)
}

export function deleteItem(key: string) {
  return Cookies.remove(key)
}
