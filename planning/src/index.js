'use strict'

require('ace-css/css/ace.css')
require('font-awesome/css/font-awesome.css')

require('./index.html')

var elm = require('./Main.elm')
var mountNode = document.getElementById('main')

var app = elm.Main.embed(mountNode)
