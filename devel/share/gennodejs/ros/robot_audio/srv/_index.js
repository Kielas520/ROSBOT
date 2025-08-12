
"use strict";

let up_sync = require('./up_sync.js')
let Awake = require('./Awake.js')
let Collect = require('./Collect.js')
let robot_iat = require('./robot_iat.js')
let Control = require('./Control.js')
let robot_semanteme = require('./robot_semanteme.js')
let robot_tts = require('./robot_tts.js')
let Nav = require('./Nav.js')

module.exports = {
  up_sync: up_sync,
  Awake: Awake,
  Collect: Collect,
  robot_iat: robot_iat,
  Control: Control,
  robot_semanteme: robot_semanteme,
  robot_tts: robot_tts,
  Nav: Nav,
};
