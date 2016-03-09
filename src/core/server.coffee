path = require 'path'
upath = require 'upath'
fs = require 'fs'

connect = require 'connect'
http = require 'http'
io = require 'socket.io'

dirs = require '../utils/dirs'
config = require '../utils/config'
sourcemaps = require '../utils/sourcemaps'

{argv} = require '../cli'
{error, warn, info, debug, log} = require('../utils/logger')('core/server')

app = null
server = null
refresher = null

module.exports = ->
  {root, port} = config.server

  index = upath.join root, 'index.html'

  # simple static server with 'connect'
  app = connect()
    .use( (req, res)->
      if ~(req.url.indexOf '.')
        res.statusCode = 404
        res.end 'File not found: ' + req.url
      else
        res.end fs.readFileSync index, 'utf-8'
    )
  server = http.createServer(app).listen port

  address = 'http://localhost:' + port
  log "♫  #{address}"

  unless argv.r
    refresher = new io 53211, 'log level': 1

  module.exports

module.exports.close = ->
  server?.close()
  refresher?.httpServer.close();

module.exports.reload = ( type )->
  return unless refresher?
  css_output = path.basename config.output.css
  refresher.sockets.emit 'refresh', {type, css_output}
