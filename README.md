![Polvo - Polyvalent cephalopod mollusc](https://raw.github.com/polvo/polvo/master/assets/polvo.png)

[![Stories in Ready](https://badge.waffle.io/polvo/polvo.png)](http://waffle.io/polvo/polvo)

[![Build Status](https://travis-ci.org/OancaAndrei/polvo.svg?branch=master)](https://travis-ci.org/OancaAndrei/polvo) [![Coverage Status](https://coveralls.io/repos/polvo/polvo/badge.png)](https://coveralls.io/r/polvo/polvo)

[![Dependency Status](https://gemnasium.com/OancaAndrei/polvo.svg)](https://gemnasium.com/OancaAndrei/polvo) [![NPM version](https://badge.fury.io/js/polvo.png)](http://badge.fury.io/js/polvo)

# What the ★★★★?

Polvo is a built system and an application assembler for the browser.

*Yet another one*.

<!--
# TL;DR

Tired of reading extensive README's files?

> Video Screenshot with link to the screencast
-->

# Seriously?

Yes, built with *simplicity* in mind and based on a *straightforward*
[plugins](#plugins-supported-languages) architecture, Polvo is also agnostic to
languages, libraries, frameworks and weather, like the majority of his
~~competitors~~ friends.

# Philosophy (in short)

 1. Your `scripts` and `templates` become all one `javascript`, and your `styles`
 become one `css`
 
 1. Both `scripts` and `templates` are wrapped as CJS modules and thus can be
 `require`-d regularly as you'd do in NodeJS.
 
 1. You end up with 2 files, `app.js` and `app.css`
 
Include both in your `html` and you're done!

# Installation

````shell
npm install -g polvo
````

# Features

 * **Auto-build** on every change
 * **LiveReload** on every change
 * **Syntax-check** on every change
 * **SourceMaps** support <sup>[[1](#sourcemap)]</sup>
 * **Conditional-compilation** for flexibility (`if`, `elif`, `else`, `fi`)
 * **Partials** supported for `templates` and `styles`
 * **Simple Embeded Webserver** <sup>[[2](#embeded-webserver)]</sup> powered by
 [Connect](https://github.com/senchalabs/connect)
 * **Compression** capabilities powered by
 [UglifyJS](https://github.com/mishoo/UglifyJS) and
 [CleanCSS](https://github.com/GoalSmashers/clean-css)
 * **Multi-purpose resolution algorithm** for both files and partials
 * **Simplistic Plugins** architecture available for interoperability

<a name="sourcemap"></a>
<sup>[[1](#sourcemap)]</sup> *For languages that provide it*<br/>
<a name="embeded-webserver"></a>
<sup>[[2](#embeded-webserver)]</sup> *Simple convenience (also for
[SPA](http://en.wikipedia.org/wiki/Single-page_application), redirecting
inexistent urls to `index.html`)*<br/>

# Contents

 - [Dependency Resolution](#dependency-resolution)
 - [Packaging Systems](#packaging-systems)
 - [Plugins](#plugins-supported-languages)
 - [CLI](#cli)
 - [Config file](#config)
   - [server](#server)
   - [input](#input)
   - [output](#output)
   - [alias](#alias)
   - [minify](#minify)
   - [boot](#boot)
 - [Conditional Compilation](#conditional-compilation) 
 - [License](#license)

<!--
 - [Examples](#examples)
-->

<!-- * Vendors management-->
<!-- * Broken and circular-loop dependencies validation-->
<!-- * Growl support for notifications-->
<!-- * Scaffolding routines-->

# Dependency Resolution

Polvo uses the same resolution algorithm presented in NodeJS, so you can code
your libraries doing global or local `require`-s as you wish, like if you were
building a NodeJS app. In the end, everything will be ready for in-browser use.

> ★ Of couse, you won't be able to use NodeJS core modules once inside the
Browser, such as `fs`, `process`, `cluster` and so on. The same applies to any
other module you may find - if it uses any API not available for in-browser use,
you won't be able to use it.

# Packaging Systems

In order to not lock you up with one single packaging system, Polvo is intended
to support some of them. It's not fully functional yet but the plans are there.

> ★ As each packaging system approaches the subject in its own
opinionated way, it may be impossible to aggregate them all in an universal way.
However its under serious study and implementation right now to check all
possibilities.

At the moment you can use:

 * [NPM](https://github.com/isaacs/npm) Full support, hooray!
 * [Component](https://github.com/component/component) Partial support
 <sup>[[1](#component-partial)]</sup>
 * [Bower](https://github.com/bower/bower) Partial support, with some caveats 
 <sup>[[2](#bower-caveats)]</sup>
 * ~~[Ender](https://github.com/ender-js/Ender)~~ Yet to be done
 <sup>[[3](#ender-tbd)]</sup>

<a name="component-partial"></a>
<sup>[[1](#component-partial)]</sup> Supporting only `js` and `css` for now,
*full implementation is a WIP*<br/>
<a name="bower-caveats"></a>
<sup>[[2](#bower-cavets)]</sup> TODO: Describe caveats<br/>
<a name="ender-tbd"></a>
<sup>[[3](#bower-cavets)]</sup> Pondering the real benefits and possibilities
of implementing *Ender*

# Plugins (supported languages)

Again, Polvo is agnostic to languages -- however it needs individual plugins
for each language in order to properly assemble it. Some of them is built
in out of the box for you joy, and others should be done / installed separately.

Polvo will search and initialize aditional plugins present in the `dependencies`
field of your `package.json` file.

## Built in plugins

Each plugin is an independent repository.

Click the links to see individual `README` for each one.

### ★ Scripts
 1. [Javascript](https://github.com/polvo/polvo-js) (`.js`) [![Build Status](https://travis-ci.org/polvo/polvo-js.png?branch=master)](http://travis-ci.org/polvo/polvo-js) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-js/badge.png)](https://coveralls.io/r/polvo/polvo-js)
 1. [CoffeeScript](https://github.com/polvo/polvo-cs) (`.coffee`) [![Build Status](https://travis-ci.org/polvo/polvo-cs.png?branch=master)](http://travis-ci.org/polvo/polvo-cs) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-cs/badge.png)](https://coveralls.io/r/polvo/polvo-cs)
    * ✓ Literate Coffeescript (`.litcoffee`, `.coffee.md`)
    * ✓ Source Maps

### ★ Styles
 1. [CSS](https://github.com/polvo/polvo-css) (`.css`) [![Build Status](https://travis-ci.org/polvo/polvo-css.png?branch=master)](http://travis-ci.org/polvo/polvo-css) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-css/badge.png)](https://coveralls.io/r/polvo/polvo-css)
     * ✓ `partials` supported
 1. [Stylus](https://github.com/polvo/polvo-stylus) (`.styl`) [![Build Status](https://travis-ci.org/polvo/polvo-stylus.png?branch=master)](http://travis-ci.org/polvo/polvo-stylus) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-stylus/badge.png)](https://coveralls.io/r/polvo/polvo-stylus)
     * ✓ `nib` available
     * ✓ `partials` supported

### ★ Templates
 1. [HTML](https://github.com/polvo/polvo-html) (`.htm`, `.html`) [![Build Status](https://travis-ci.org/polvo/polvo-html.png?branch=master)](http://travis-ci.org/polvo/polvo-html) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-html/badge.png)](https://coveralls.io/r/polvo/polvo-html)
    * ✓ `partials` supported
 1. [Jade](https://github.com/polvo/polvo-jade) (`.jade`) [![Build Status](https://travis-ci.org/polvo/polvo-jade.png?branch=master)](http://travis-ci.org/polvo/polvo-jade) [![Coverage Status](https://coveralls.io/repos/polvo/polvo-jade/badge.png)](https://coveralls.io/r/polvo/polvo-jade)
    * ✓ `partials` supported

# CLI

Command line interface help screen.

````
Usage:
  polvo [options] [params]

Options:
  -w, --watch        Start watching/compiling in dev mode                
  -c, --compile      Compile project in development mode                 
  -r, --release      Compile project in release mode                     
  -s, --server       Serves project statically, options in config file   
  -f, --config-file  Path to a different config file                     
  -b, --base         Path to app's root folder (when its not the current)
  -x, --split        Compile files individually - useful for tests coverage
  -v, --version      Show Polvo's version                                
  -h, --help         Shows this help screen                              

Examples:
  polvo -c
  polvo -cs
  polvo -w
  polvo -ws
  polvo -wsf custom-config-file.yml
````

# Config

Polvo's config file is simply a file named `polvo.yml` in your project.

You'll may need to setup *six* simple options to adjust Polvo to your needs:

 1. [server](#server)
 1. [input](#input)
 1. [output](#output)
 1. [alias](#alias)
 1. [minify](#minify)
 1. [boot](#boot)

A Polvo's complete config file look such as:

## polvo.yml

````yaml
server:
  port: 3000
  root: ./public

input:
  - src

output:
  js: ./public/app.js
  css: ./public/app.css

alias:
  app: ./src/app

minify:
  js: false
  css: false

boot: ./src/app/app
````

### Server

Basic infos to serve your application, just inform desired port and your
`public` folder.

When using the option `-s` a basic webserver will be launched to serve the app.

### Input

Project's input `src` folders, can be one or many.

### Output

Project's output `files`, at least one should be specified.

> ★ If you're using [conditional compilation](#conditional-compilation), make
sure you're aware that you can reuse the conditional [variables]((#final-notes)
to compose the output path for your files.

### Alias

It's a handy option that lets you map some `names` to specific `dirs`. These
names will make folders act like gobal modules in your `node_modules` folder
with all dirs listed in `package.json` directories field, so you can `require`
them as such.

For example, imagine a structure like this:

````
myapp
├── polvo.yml
├── src
│   └── app
│       ├── app.coffee
│       ├── controllers
│       │   └── controller.coffee
│       ├── models
│       │   └── model.coffee
│       └── views
│           └── views.coffee
└── vendors
    └── myframework
        └── src
            └── lib
                ├── controller.coffee
                ├── model.coffee
                └── view.coffee
````

The app's `controller.coffee` can `require` the framework's `controller.coffee`
as easy as:

````coffeescript
Controller = require '../../../vendors/myframework/src/lib/controller'
````

However, sometimes these relative paths can get nasty. In these cases, aliases
can help the way. Imagine this one:

````yml
alias:
  myframework: ./vendors/myframework/src
````

With this, `myframework` folder will act as if it was a NPM module present in
your `node_modules` folder, and `require` calls can be made in global-style
regardless of which file is requiring it:

````coffeescript
Controller = require 'myframework/lib/controller'
````

Note that:

 1. The `myframework` keywork is the virtual alias in the config file 
 1. It points to the folder `vendors/myframework/src`
 1. So requiring `myframewok/**/*` will be the same as requiring
 `vendors/myframework/src/**/*`
 1. Be cautious while using aliases. For instance if you have have an alias with
  the same name of a module you have in your  `node_modules` folder,  you'll end
  up with serious problems - hopefully you'll notice this immediately.

### Minify

In some cases you may want to disable minification in `release` mode, even
though in both `development` and `release` mode you'll always have a single
`.js` and `.css` file.

So what's the catch?

In `development` mode other things will be injected among your scripts in the
`app.js` file. For example, the LiveReload embedded functionality.

In `release` mode it's removed, nothing special is injected. So you may want to
have a production ready `release` file (that doesn't includes magic), but at the
same time keep it uncompressed. In case you do, that's the way to go.

### Boot

By default, Polvo will wrap all your `scripts` and `templates` in CJS module and
register them all at startup. However, none will be `require`-d and therefore
none will be initialized.

You need to specify your app's entry point within the `boot` property. With this
Polvo will do a simple `require` to this file at startup, after everything is
registered.

Following the config presented above, it'd be:

````javascript
require( 'src/app/app' );
````

<!--
# Examples
  
  * [Demo app](...)
  * [Live preview](...)
-->

# Conditional compilation

Looking forward for greater flexibility when compiling something for multiple
targets, there's 4 directives available to control conditional compilation:

 - `polvo:if`
 - `polvo:elif`
 - `polvo:else`
 - `polvo:fi`

You can use these in any kind of file you have, be it a `template`, a `style` or
a `script`.

These conditionals are processed **before** files are compiled with each its
respective pre-processor and also before their output is scanned for
dependencies.

So just insert these directives in form of a **comment** for the language your
are using and they will be processed accordingly.

You can use both equality and inequality operators:

````coffeescript
# polvo:if ENV = browser
equality = 'is browser'
# polvo:fi

# polvo:if ENV != browser
inequality = 'is not browser'
# polvo:fi
````

## Example 1 (Browser x NodeJS)

````coffeescript
# polvo:if ENV=node
request = require 'node-request-library'
# polvo:elif ENV=browser
request = require 'browser-request-library'
# polvo:fi

request.do_stuff [...]
````

With this code, you can compile the project in a few different ways, saying
which build do you want, i.e.:

### Targeting NodeJS

```shell
$ ENV=node polvo -c
````

### Targeting Browser

```shell
$ ENV=browser polvo -c
````

### The same example in plain Javascript:

````javascript
// polvo:if ENV=node
var request = require('node-request-library');
// polvo:elif ENV=browser
var request = require('browser-request-library');
// polvo:fi

request.do_stuff( /* ... */ );
````

## Example 2 (Desktop x Mobile)

Many people choses between JQuery or Zepto depending on what target, lets check
how it'd be done easily for having hybrid builds.

````coffeescript
# polvo:if ENV=desktop
$ = require 'jquery'
# polvo:elif ENV=mobile
$ = require 'zepto'
# polvo:fi

$('element').do_something [...]
````

### Targeting Desktop

```shell
$ ENV=desktop polvo -c
````

### Targeting Mobile

```shell
$ ENV=mobile polvo -c
````

## Example 3 (Advanced)

You can have multiple conditions as well, many `elifs` and also a final `else`
directive, depending on your needs:

````coffeescript
# polvo:if ENV=desktop
$ = require 'jquery'
# polvo:elif ENV=mobile
$ = require 'zepto'
# polvo:elif ENV=node
$ = require 'cheerio'
# polvo:else
$ = require 'god-help'
# polvo:fi

$('element').do_something [...]
````
## Variables naming

In the examples above we used the var `ENV` to get around the conditionals.
However you can use any var you want:

````coffeescript

# polvo:if ANIMAL=carnivore
food = require 'meat'
# polvo:elif ANIMAL=herbivore
food = require 'vegetables'
# polvo:fi

[...code here...]
````

And compile your project using the variables you just declared inside your code:
```shell
$ ANIMAL=carnivore polvo -c
$ ANIMAL=herbivore polvo -c
````

## Final notes

Some final considerations:

### Supported languages

Remember that every language is supported, you just need to add the explained
directives in your source file in a form of a comment, so they doesn't affect
your code.

All of them will be processed.

### Output files

You can use a single `polvo.yml` with multiple targets, by setting your output
file according the vars you're using for conditional compilation.

### Example

````yaml
input:
  - ./src

output:
  js: ./lib/app-{ENV}.js
````

When compiled with `ENV=browser polvo -c`, the `output` js file will be saved as
`./lib/app-browser.js`.

Or `./lib/app-node.js` when compiled with `ENV=node polvo -c`, and so on.

The same applies for styles.

# License

The MIT License (MIT)

Copyright (c) 2013 Anderson Arboleya

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/polvo/polvo/trend.png)](https://bitdeli.com/free "Bitdeli Badge")
