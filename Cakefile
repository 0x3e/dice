fs            = require 'fs'
path          = require 'path'
{spawn, exec} = require 'child_process'

launch = (cmd, options=[], callback) ->
  app = spawn cmd, options
  app.stdout.pipe(process.stdout)
  app.stderr.pipe(process.stderr)
  app.on 'exit', (status) -> callback?() if status is 0

unless process.env.NODE_DISABLE_COLORS
  bold  = '\x1B[0;1m'
  red   = '\x1B[0;31m'
  green = '\x1B[0;32m'
  reset = '\x1B[0m'


log = (message, color, explanation) ->
  console.log (color or '') + message + reset + ' ' + (explanation or '')

build = ->
  options = ['-o', 'lib', '.']
  launch 'coffee', options

lint = ->
  options = ['.']
  launch 'coffeelint', options

task 'build', 'compile source', -> build -> log ":)", green
task 'lint', 'lint source', -> lint -> log ":)", green
