// Auto-generated. Do not edit!

// (in-package robot_audio.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class robot_ttsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.text = null;
      this.play = null;
    }
    else {
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
      if (initObj.hasOwnProperty('play')) {
        this.play = initObj.play
      }
      else {
        this.play = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_ttsRequest
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    // Serialize message field [play]
    bufferOffset = _serializer.bool(obj.play, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_ttsRequest
    let len;
    let data = new robot_ttsRequest(null);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [play]
    data.play = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.text);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/robot_ttsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '121e542c3e7ca17ad7d209752fdda273';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string text
    bool play
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_ttsRequest(null);
    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    if (msg.play !== undefined) {
      resolved.play = msg.play;
    }
    else {
      resolved.play = false
    }

    return resolved;
    }
};

class robot_ttsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.audiopath = null;
    }
    else {
      if (initObj.hasOwnProperty('audiopath')) {
        this.audiopath = initObj.audiopath
      }
      else {
        this.audiopath = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_ttsResponse
    // Serialize message field [audiopath]
    bufferOffset = _serializer.string(obj.audiopath, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_ttsResponse
    let len;
    let data = new robot_ttsResponse(null);
    // Deserialize message field [audiopath]
    data.audiopath = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.audiopath);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/robot_ttsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5e404094a9595b4fe3761b0ec9dfd6df';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string audiopath
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_ttsResponse(null);
    if (msg.audiopath !== undefined) {
      resolved.audiopath = msg.audiopath;
    }
    else {
      resolved.audiopath = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: robot_ttsRequest,
  Response: robot_ttsResponse,
  md5sum() { return '2ad2a7e28f20ec853b183153ee6b6d2d'; },
  datatype() { return 'robot_audio/robot_tts'; }
};
