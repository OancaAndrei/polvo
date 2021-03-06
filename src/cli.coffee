optimist = require 'optimist'
colors = require 'colors'

version = require './utils/version'

usage = """
  Polvo #{('v' + version).grey}
  #{'Polyvalent cephalopod mollusc'.grey}

  #{'Usage:'}
    polvo [#{'options'.green}] [#{'params'.green}]
"""

examples = """
  Examples:
    polvo -c
    polvo -cs
    polvo -w
    polvo -ws
    polvo -wsf custom-config-file.yml
"""

if cli_options?
  options = []
  for key, val of (cli_options or {})
    options.push if key.length is 1 then "-#{key}" else "--#{key}"
    options.push "#{val}"
else
  options = process.argv.slice 0

optimistic = optimist( options ).usage( usage )
  .alias('w', 'watch')
  .boolean( 'w' )
  .describe('w', "Start watching/compiling in dev mode")
  
  .alias('c', 'compile')
  .boolean( 'c' )
  .describe('c', "Compile project in development mode")

  .alias('r', 'release')
  .boolean( 'r' )
  .describe('r', "Compile project in release mode")

  .alias('s', 'server')
  .boolean( 's' )
  .describe('s', "Serves project statically, options in config file")

  .alias( 'f', 'config-file' )
  .string( 'f' )
  .describe('f', "Path to a different config file")

  .alias('b', 'base')
  .describe('b', 'Path to app\'s root folder (when its not the current)')
  .string( 'b' )

  .alias('x', 'split')
  .describe('x', 'Compile files individually - useful for tests coverage')
  .boolean( 'x' )

  .alias('v', 'version')
  .boolean('v')
  .describe('v', 'Show Polvo\'s version')

  .alias('h', 'help')
  .boolean('h')
  .describe('h', 'Shows this help screen')


exports.argv = optimistic.argv

exports.help = ->
  "#{optimistic.help()}\n#{examples}"