// Generated by CoffeeScript 1.10.0
(function() {
  var argv, debug, error, fs, info, log, path, pwd, ref, upath, warn;

  path = require('path');

  upath = require('upath');

  fs = require('fs');

  ref = require('./logger')('utils/dirs'), error = ref.error, warn = ref.warn, info = ref.info, debug = ref.debug, log = ref.log;

  argv = require('../cli').argv;

  exports.root = upath.join(__dirname, '..', '..');

  if (argv.base != null) {
    if (!fs.existsSync((pwd = path.resolve(argv.base)))) {
      error('Dir informed with [--base] option doesn\'t exist ~>', argv.base);
      pwd = null;
    }
  } else {
    pwd = path.resolve('.');
  }

  exports.pwd = pwd;

  exports.relative = function(filepath) {
    return upath.normalize(path.relative(exports.pwd, filepath));
  };

}).call(this);
