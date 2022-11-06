import { initializeDatabase } from './db'

import express, { Express, Request, Response } from 'express'
import bodyParser from 'body-parser'

const app: Express = express()

app.use(bodyParser.urlencoded({ extended: true }))
app.use(bodyParser.json())
app.use(bodyParser.raw())


// REMOVE THIS
app.get('/', (req: Request, res: Response) => {
  return res.sendStatus(200);
});

const port = 8000;

app.listen(port, async () => {
  await initializeDatabase()
  console.log(`Auth service listening at http://localhost:${port}`)
})