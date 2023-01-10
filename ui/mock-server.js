const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('mock-server.json')
const middlewares = jsonServer.defaults()

server.use(middlewares)

server.post('/token', (req, res) => {
  return res.jsonp({ token: "FAKE_MOCK_SERVER_TOKEN" })
})
server.use(jsonServer.bodyParser)
server.use('/api/core/societies/:id/events', (req, res, next) => {
  if (req.method === 'POST') {
    req.body.society = {
      "id": 1,
      "name": "DECS",
      "fullName": "Dramatics and Extra Curricular Society",
      "image": "https://picsum.photos/1220/720",
      "createdAt": "2023-01-01T18:25:43.511Z",
      "tenure": {
        "id": 1,
        "code": "2022-2023",
        "description": "2022-2023",
        "duration": "2022-2023"
      }
    }
  }
  // Continue to JSON Server router
  next()
})

server.use("/api/core", router);
server.listen(8080, () => {
  console.log('JSON Server is running')
})
