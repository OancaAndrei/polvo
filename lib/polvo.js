// Generated by CoffeeScript 1.10.0
(function() {
  (require('source-map-support')).install({
    handleUncaughtExceptions: false
  });

  module.exports = function(options, io) {
    var argv, cli, compiler, config, debug, error, info, log, logger, server, version, warn;
    if (options != null) {
      global.cli_options = options;
    }
    if (io != null) {
      global.__stdout = io.out;
      global.__stderr = io.err;
      global.__nocolor = io.nocolor;
    }
    cli = require('./cli');
    version = require('./utils/version');
    logger = require('./utils/logger')('polvo');
    argv = cli.argv;
    error = logger.error, warn = logger.warn, info = logger.info, debug = logger.debug, log = logger.log;
    if (argv.version) {
      return log(version);
    } else if (argv.compile || argv.watch || argv.release) {
      config = require('./utils/config');
      if (config != null) {
        compiler = require('./core/compiler');
        if (argv.server && (config != null)) {
          server = require('./core/server');
        }
        if (argv.compile || argv.watch) {
          compiler.build();
          if (argv.server) {
            server();
          }
        } else if (argv.release) {
          compiler.release(function() {
            if (argv.server) {
              return server();
            }
          });
        }
      }
    } else {
      log(cli.help());
    }
    return module.exports;
  };

  module.exports.close = function() {
    var files, server;
    files = require('./core/files');
    server = require('./core/server');
    files.close_watchers();
    return server.close();
  };

  module.exports.read_config = function() {
    return require('./utils/config');
  };

}).call(this);
