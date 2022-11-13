import { initializeDatabase } from './db'
import passport from 'passport';
import express, { Express } from 'express'
import bodyParser from 'body-parser'
import cookieParser from 'cookie-parser';

import { googleStrategy, jwtStrategy } from './passport';
import router from './routes';

const app: Express = express()
const port = 8000;

passport.use(googleStrategy);
passport.use(jwtStrategy);

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(cookieParser());
app.use(bodyParser.raw())
app.use(router);

app.listen(port, async () => {
  await initializeDatabase()
  console.log(`Auth service listening at http://localhost:${port}`)
})