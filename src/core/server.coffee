path = require 'path'
upath = require 'upath'
fs = require 'fs'

http = require 'http'
finalhandler = require 'finalhandler'
servestatic = require 'serve-static'

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

  # simple static server with 'serve-static'
  serve = servestatic root

  server = http.createServer (req, res) ->
    done = finalhandler req, res
    serve req, res, done

  server.listen port

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
