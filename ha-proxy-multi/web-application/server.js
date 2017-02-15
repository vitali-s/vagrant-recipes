const http = require('http')
const os = require('os')  
const port = 80

const requestHandler = (request, response) => {  
  console.log(request.url)
  response.end(`Hello from web node ${JSON.stringify(os.networkInterfaces())} \n`)
}

const server = http.createServer(requestHandler)

server.listen(port, (err) => {  
  if (err) {
    return console.log('something bad happened', err)
  }

  console.log(`server is listening on ${port}`)
})
