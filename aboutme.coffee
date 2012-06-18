http = require 'http'
url  = require 'url'

me =
  name:     "Vladimir Sibirov"
  email:    "trustmaster at kodigy dot com"
  github:   "https://github.com/trustmaster"
  twitter:  "https://twitter.com/#!/sibiroff"
  linkedin: "http://www.linkedin.com/in/sibirov/en"
  facebook: "http://www.facebook.com/trustmaster"
  thisRepo: "https://github.com/trustmaster/aboutme"

http.createServer (request, response) ->
  if url.parse(request.url).pathname is '/job' and request.method is 'POST'
    request.on 'end', ->
      response.writeHead 200, (
        'Content-Type': 'application/json'
        'Access-Control-Allow-Origin': '*'
      )
      response.write JSON.stringify me
      response.end()
  else
    response.writeHead 404, ('Content-Type': 'text/plain')
    response.write "404 Not found"
    response.end()
.listen 8080