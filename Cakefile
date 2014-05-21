option '-t', '--test [name]', 'run a single test'
fs = require 'fs'
{spawn, exec} = require 'child_process'

which = require('which').sync

# ANSI Terminal Colors
bold = '\x1b[0;1m'
green = '\x1b[0;32m'
reset = '\x1b[0m'
red = '\x1b[0;31m'
task 'build', 'compile source', -> build -> log ":)", green
task 'test', 'run tests', (options) -> 
  test=options.test 
  build -> mocha test, -> log ":)", green


log = (message, color, explanation) -> 
  console.log color + message + reset + ' ' + (explanation or '')

launch = (cmd, options=[], callback) ->
  cmd = which(cmd) if which
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) ->
    if status is 0
      callback()
    else
      process.exit(status);

build = (callback) ->
  options = ['-o','lib','coffee']
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
