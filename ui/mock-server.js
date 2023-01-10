const jsonServer = require('json-server')
const server = jsonServer.create()
const router = jsonServer.router('mock-server.json')
const middlewares = jsonServer.defaults()

server.use(middlewares)

server.post('/token', (req, res) => {
  return res.jsonp({token: "FAKE_MOCK_SERVER_TOKEN"})
})

server.use("/api/core", router);
server.listen(8080, () => {
  console.log('JSON Server is running')
})
