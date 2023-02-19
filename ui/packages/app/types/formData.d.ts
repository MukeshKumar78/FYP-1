export {};

declare global {
  interface FormDataValue {
    uri: string;
    name: string;
    type: string;
  }

  interface FormData {
    append(name: string, value: string | Blob | FormDataValue, fileName?: string): void;
  }
}
