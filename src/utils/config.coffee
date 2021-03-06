path = require 'path'
upath = require 'upath'
fs = require 'fs'
util = require 'util'

yaml = require 'js-yaml'

dirs = require './dirs'
{argv} = require '../cli'

{error, warn, info, debug} = require('./logger')('utils/config')

if dirs.pwd?
  if argv['config-file']?
    config_path = upath.join dirs.pwd, argv['config-file']
  else
    config_path = upath.join dirs.pwd, "polvo.yml"

if fs.existsSync config_path
  if fs.statSync( config_path ).isDirectory()
    error 'Config file\'s path is a directory  ~>', config_path
   # process.exit()
  else
    config_contents = fs.readFileSync config_path, 'utf8'
    config = yaml.safeLoad(config_contents, json: true) or {}
else
  error 'Config file not found ~>', config_path
  # process.exit()

parse_config = ->
  # server
  if config.server?

    config.server.port ?= 3000
    if config.server.root
      root = config.server.root = upath.join dirs.pwd, config.server.root
      unless fs.existsSync root
        if argv.server
          return error 'Server\'s root dir does not exist ~>', root
    else if argv.server
      return error 'Server\'s root not set in in config file'

  else if argv.server
    return error 'Server\'s config not set in config file'

  # input
  if config.input? and config.input.length
    for dirpath, index in config.input
      tmp = config.input[index] = upath.join dirs.pwd, dirpath
      unless fs.existsSync tmp
        return error 'Input dir does not exist ~>', dirs.relative tmp
  else
    return error 'You need at least one input dir in config file'

  # output
  if config.output?

    if config.output.js?
      config.output.js = upath.join dirs.pwd, config.output.js

      reg = /\{(\w+)\}/g
      while (res = reg.exec config.output.js)?
        [all,key] = res
        config.output.js = config.output.js.replace all, process.env[key]

      tmp = path.dirname config.output.js
      unless fs.existsSync tmp
        return error 'JS\'s output dir does not exist ~>', dirs.relative tmp

    if config.output.css?
      config.output.css = upath.join dirs.pwd, config.output.css

      reg = /\{(\w+)\}/g
      while (res = reg.exec config.output.css)?
        [all,key] = res
        config.output.css = config.output.css.replace all, process.env[key]

      tmp = path.dirname config.output.css
      unless fs.existsSync tmp
        return error 'CSS\'s output dir does not exist ~>', dirs.relative tmp

  else
    return error 'You need at least one output in config file'

  # alias
  if config.alias?
    for name, location of config.alias
      abs_location = upath.join dirs.pwd, location
      unless fs.existsSync abs_location
        return error "Alias '#{name}' does not exist ~>", location
      else
        config.alias[name] = dirs.relative abs_location
  else
    config.alias = {}

  # minify
  config.minify = {} unless config.minify?
  config.minify.js = true unless config.minify.js?
  config.minify.css = true unless config.minify.css?

  # boot
  unless config.boot?
    return error "Boot module not informed in config file"
  else
    config.boot = upath.join dirs.pwd, config.boot
    config.boot = dirs.relative config.boot


# if config exists
if config?
  parse_config()


module.exports = config
