export {}

declare global {
  namespace NodeJS {
    interface ProcessEnv {
      DB_URI: string;
      JWT_SECRET: string;
      PROVIDER_CLIENT_ID: string;
      PROVIDER_CLIENT_SECRET: string;
    }
  }
}