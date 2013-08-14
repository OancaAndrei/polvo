// Generated by CoffeeScript 1.6.3
(function() {
  var config, files, fs, minify, save_css, save_js, wrapper, _;

  _ = require('lodash');

  fs = require('fs');

  files = require('./files');

  config = require('../utils/config');

  minify = require('../utils/minify');

  wrapper = ";(function(){\n  ~mods\n})()";

  exports.build = function() {
    save_js();
    return save_css();
  };

  exports.minify = function() {
    var uncompressed;
    save_js();
    uncompressed = fs.readFileSync(config.output.js);
    fs.writeFileSync(config.output.js, minify.js(uncompressed.toString()));
    return save_css();
  };

  save_js = function() {
    var all, each, merged;
    all = _.filter(files.files, {
      type: 'js'
    });
    merged = ((function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = all.length; _i < _len; _i++) {
        each = all[_i];
        _results.push(each.compiled);
      }
      return _results;
    })()).join('\n');
    fs.writeFileSync(config.output.js, wrapper.replace('~mods', merged));
    return console.log('Compiled', config.output.js);
  };

  save_css = function() {
    var all, each, merged;
    all = _.filter(files.files, {
      type: 'css'
    });
    merged = ((function() {
      var _i, _len, _results;
      _results = [];
      for (_i = 0, _len = all.length; _i < _len; _i++) {
        each = all[_i];
        _results.push(each.compiled);
      }
      return _results;
    })()).join('\n');
    fs.writeFileSync(config.output.css, merged);
    return console.log('Compiled', config.output.css);
  };

}).call(this);

/*
//@ sourceMappingURL=compiler.map
*/