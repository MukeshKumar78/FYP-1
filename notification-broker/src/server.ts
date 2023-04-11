import express from 'express';
import cors from 'cors';
import bodyParser from 'body-parser'
import client from './redis';

const app = express()
app.use(cors())
app.use(bodyParser.json())

app.put('/push-token', (req, res) => {
  const { user, token } = req.body;

  if (user && token) {
    client.hSet("users", req.body.user, req.body.token)
    res.sendStatus(200);
  }

  res.sendStatus(400);
})

export default app;
