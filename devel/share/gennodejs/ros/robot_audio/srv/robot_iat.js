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

class robot_iatRequest {
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
    // Serializes a message object of type robot_iatRequest
    // Serialize message field [audiopath]
    bufferOffset = _serializer.string(obj.audiopath, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_iatRequest
    let len;
    let data = new robot_iatRequest(null);
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
    return 'robot_audio/robot_iatRequest';
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
    const resolved = new robot_iatRequest(null);
    if (msg.audiopath !== undefined) {
      resolved.audiopath = msg.audiopath;
    }
    else {
      resolved.audiopath = ''
    }

    return resolved;
    }
};

class robot_iatResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.text = null;
    }
    else {
      if (initObj.hasOwnProperty('text')) {
        this.text = initObj.text
      }
      else {
        this.text = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type robot_iatResponse
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type robot_iatResponse
    let len;
    let data = new robot_iatResponse(null);
    // Deserialize message field [text]
    data.text = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.text);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/robot_iatResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '74697ed3d931f6eede8bf3a8dfeca160';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string text
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new robot_iatResponse(null);
    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: robot_iatRequest,
  Response: robot_iatResponse,
  md5sum() { return '318b42904b3fd33a38a273170db5f135'; },
  datatype() { return 'robot_audio/robot_iat'; }
};
