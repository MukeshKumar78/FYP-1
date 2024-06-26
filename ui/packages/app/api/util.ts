import { TagDescription } from "@reduxjs/toolkit/dist/query";
import { apiUrl } from "./config";

export interface Page<T> {
  data: T[]
  args: PageData
}

export interface PageData {
  page: number
  size?: number
}

export function getPublicUri(name?: string): string {
  // TODO: return default image
  if (!name) return '';

  const uri = name.startsWith('http')
    ? name
    : apiUrl + '/public/' + name
  return uri;
}

export function toDateString(date: Date): string {
  return date.toISOString();
}

export function toShortDateString(date: Date): string {
  return (new Date(date)).toUTCString().slice(5, 16)
}

export function toTimeAndDateString(date: Date): string {
  const d = new Date(date);


  return [
    d.getDate(),
    d.getMonth() + 1,
    d.getFullYear().toString().substr(-2)]
    .join('/') + ' '
    + [d.getHours(),
    d.getMinutes()]
      .join(':');
}

export function paginationProps<T, U extends PageData = PageData>() {
  return {
    serializeQueryArgs: ({ endpointName }: { endpointName: string }) => {
      return endpointName
    },
    transformResponse(data: T[], _: any, args: Required<U>) {
      return { data, args };
    },
    merge(currentCacheData: Page<T>, responseData: Page<T>): void | Page<T> {
      if (responseData.args.page > 0) {
        currentCacheData.data.push(...responseData.data);
        return currentCacheData;
      }
      return responseData;
    },
    // // Refetch when the page arg changes
    forceRefetch({ currentArg, previousArg }: {
      currentArg?: U,
      previousArg?: U
    }) {
      let doRefetch = true

      if (currentArg && previousArg)
        doRefetch = !(Object.entries(currentArg).toString() === Object.entries(previousArg).toString())

      return doRefetch
    },
  }
}
