_ = require 'lodash'

fs = require 'fs'
path = require 'path'
upath = require 'upath'
util = require 'util'

dirs = require '../utils/dirs'
{error, info} = require('../utils/logger')('utils/plugins')

plugins = []
registered = {}

get_plugin_manifest = ( folder, plugin )->
  manifest = upath.join folder, 'node_modules', plugin, 'package.json'
  return manifest if fs.existsSync manifest

  return null if folder is upath.join folder, '..'
  get_plugin_manifest upath.join(folder, '..'), plugin

scan = (folder)->
  manifest_path = upath.join folder, 'package.json'
  manifest = require manifest_path

  for plugin of manifest.dependencies
    pmanifest_path = get_plugin_manifest folder, plugin

    if pmanifest_path is null
      info "dependency '#{plugin}' not installed, can\'t check if its a plugin"
      continue

    pmanifest = require pmanifest_path

    if pmanifest.polvo and not registered[pmanifest.name]
      registered[pmanifest.name] = true
      plugins.push require plugin

scan upath.join dirs.root

app_json = upath.join dirs.pwd, 'package.json'
if fs.existsSync app_json
  scan dirs.pwd
else
  info 'app doesn\'t have a `package.json` file, loading built-in plugins only'

module.exports = plugins
