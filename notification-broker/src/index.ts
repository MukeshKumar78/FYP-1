import broker from "./broker"
import app from './server'


const port = process.env.PORT || 80;

broker.start()

app.listen(port, () => {
  console.log("Listening on:", port)
})

