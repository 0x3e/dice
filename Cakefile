option '-t', '--test [name]', 'run a single test'
fs = require 'fs'
sys = require 'sys'
{spawn, exec} = require 'child_process'

which = require('which').sync

# ANSI Terminal Colors
bold = '\x1b[0;1m'
green = '\x1b[0;32m'
reset = '\x1b[0m'
red = '\x1b[0;31m'
task 'build', 'compile source', -> build -> build_test -> jade -> css -> js -> coverage -> log ":)", green

task 'test', 'run tests', (options) ->
  test=options.test
  build -> build_test -> mocha test, -> log ":)", green

task 'coverage', 'compile coverage report', -> build -> build_test -> coverage -> log ":)", green

task 'lint', 'coffeelint', -> lint -> log ":)", green

log = (message, color, explanation) ->
  console.log color + message + reset + ' ' + (explanation or '')

launch = (cmd, options=[], callback) ->
  cmd = which(cmd) if which
  app = spawn cmd, options, customFds: [0..2]
  app.on 'exit', (status) ->
    if status is 0
      callback()
    else
      process.exit(status)

build = (callback) ->
  options = ['-o','lib','coffee']
  launch 'coffee', options, callback

build_test = (callback) ->
  options = ['-b','-o','test_browser','test_coffee']
  launch 'coffee', options, callback

mocha = (options, callback) ->
  if typeof options is 'function'
    callback = options
    options = []
  else
    test=options
  options = []
  options.push '--compilers'
  options.push 'coffee:coffee-script/register'
  if test
    test = 'test_coffee/'+test+'Test.coffee'
    options.push test
    console.log(test)
  else
    options.push 'test_coffee/'
  
  launch 'mocha', options, callback

coverage = (callback) ->
  exec 'mocha --require blanket -R html-cov test_browser| sed -e "s#$(pwd)/lib/##g" > coverage.html', (err, stdout, stderr) ->
    throw err if err
    console.log "generated coverage.html"
    callback?()

lint = (callback) ->
  launch 'coffeelint', ['coffee'], callback

css = (callback) ->
  exec 'stylus < stylus/c.stylus > style.css', (err, stdout, stderr) ->
    throw err if err
    console.log "generated style.html"
    callback?()

jade = (callback) ->
  exec 'jade < jade/index.jade > index.html', (err, stdout, stderr) ->
    throw err if err
    console.log "generated index.html"
    callback?()
js = (callback) ->
  exec 'cat lib/* > js.js', (err, stdout, stderr) ->
    throw err if err
    console.log "generated js.js"
    callback?()
