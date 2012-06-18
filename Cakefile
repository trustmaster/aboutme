{exec} = require 'child_process'
fs     = require 'fs'
util   = require 'util'

srcFile = 'aboutme.coffee'

task 'build', 'Build .coffee files into .js files', ->
  exec "coffee --compile #{srcFile}", (err, stdout, stderr) ->
    throw err if err
    console.log stdout + stderr

task 'watch', 'Watch for changes and rebuild the file', ->
  fs.watchFile srcFile, (curr, prev) ->
    if +curr.mtime isnt +prev.mtime
        util.log "#{srcFile} has been changed"
        invoke 'build'