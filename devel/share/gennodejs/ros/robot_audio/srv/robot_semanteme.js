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

class robot_semantemeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
      this.textorpath = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('textorpath')) {
        this.textorpath = initObj.textorpath
      }
      else {
        this.textorpath = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_semantemeRequest
    // Serialize message field [mode]
    bufferOffset = _serializer.int32(obj.mode, buffer, bufferOffset);
    // Serialize message field [textorpath]
    bufferOffset = _serializer.string(obj.textorpath, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_semantemeRequest
    let len;
    let data = new robot_semantemeRequest(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [textorpath]
    data.textorpath = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.textorpath);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/robot_semantemeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd317f79ad89a19b72d1e4794651dfbde';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 mode
    string textorpath
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_semantemeRequest(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.textorpath !== undefined) {
      resolved.textorpath = msg.textorpath;
    }
    else {
      resolved.textorpath = ''
    }

    return resolved;
    }
};

class robot_semantemeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.tech = null;
      this.iat = null;
      this.anwser = null;
      this.intent = null;
      this.slots_name = null;
      this.slots_value = null;
    }
    else {
      if (initObj.hasOwnProperty('tech')) {
        this.tech = initObj.tech
      }
      else {
        this.tech = '';
      }
      if (initObj.hasOwnProperty('iat')) {
        this.iat = initObj.iat
      }
      else {
        this.iat = '';
      }
      if (initObj.hasOwnProperty('anwser')) {
        this.anwser = initObj.anwser
      }
      else {
        this.anwser = '';
      }
      if (initObj.hasOwnProperty('intent')) {
        this.intent = initObj.intent
      }
      else {
        this.intent = '';
      }
      if (initObj.hasOwnProperty('slots_name')) {
        this.slots_name = initObj.slots_name
      }
      else {
        this.slots_name = [];
      }
      if (initObj.hasOwnProperty('slots_value')) {
        this.slots_value = initObj.slots_value
      }
      else {
        this.slots_value = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_semantemeResponse
    // Serialize message field [tech]
    bufferOffset = _serializer.string(obj.tech, buffer, bufferOffset);
    // Serialize message field [iat]
    bufferOffset = _serializer.string(obj.iat, buffer, bufferOffset);
    // Serialize message field [anwser]
    bufferOffset = _serializer.string(obj.anwser, buffer, bufferOffset);
    // Serialize message field [intent]
    bufferOffset = _serializer.string(obj.intent, buffer, bufferOffset);
    // Serialize message field [slots_name]
    bufferOffset = _arraySerializer.string(obj.slots_name, buffer, bufferOffset, null);
    // Serialize message field [slots_value]
    bufferOffset = _arraySerializer.string(obj.slots_value, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_semantemeResponse
    let len;
    let data = new robot_semantemeResponse(null);
    // Deserialize message field [tech]
    data.tech = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [iat]
    data.iat = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [anwser]
    data.anwser = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [intent]
    data.intent = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [slots_name]
    data.slots_name = _arrayDeserializer.string(buffer, bufferOffset, null)
    // Deserialize message field [slots_value]
    data.slots_value = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.tech);
    length += _getByteLength(object.iat);
    length += _getByteLength(object.anwser);
    length += _getByteLength(object.intent);
    object.slots_name.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    object.slots_value.forEach((val) => {
      length += 4 + _getByteLength(val);
    });
    return length + 24;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/robot_semantemeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '77f681fe0c5d79108436880fba11f4b6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string tech
    string iat
    string anwser
    string intent
    string[] slots_name
    string[] slots_value
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_semantemeResponse(null);
    if (msg.tech !== undefined) {
      resolved.tech = msg.tech;
    }
    else {
      resolved.tech = ''
    }

    if (msg.iat !== undefined) {
      resolved.iat = msg.iat;
    }
    else {
      resolved.iat = ''
    }

    if (msg.anwser !== undefined) {
      resolved.anwser = msg.anwser;
    }
    else {
      resolved.anwser = ''
    }

    if (msg.intent !== undefined) {
      resolved.intent = msg.intent;
    }
    else {
      resolved.intent = ''
    }

    if (msg.slots_name !== undefined) {
      resolved.slots_name = msg.slots_name;
    }
    else {
      resolved.slots_name = []
    }

    if (msg.slots_value !== undefined) {
      resolved.slots_value = msg.slots_value;
    }
    else {
      resolved.slots_value = []
    }

    return resolved;
    }
};

module.exports = {
  Request: robot_semantemeRequest,
  Response: robot_semantemeResponse,
  md5sum() { return '137f770ca875cecbf1fccdae0ac71f77'; },
  datatype() { return 'robot_audio/robot_semanteme'; }
};
