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

class AwakeRequest {
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
    // Serializes a message object of type AwakeRequest
    // Serialize message field [text]
    bufferOffset = _serializer.string(obj.text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AwakeRequest
    let len;
    let data = new AwakeRequest(null);
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
    return 'robot_audio/AwakeRequest';
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
    const resolved = new AwakeRequest(null);
    if (msg.text !== undefined) {
      resolved.text = msg.text;
    }
    else {
      resolved.text = ''
    }

    return resolved;
    }
};

class AwakeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.awake_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('awake_flag')) {
        this.awake_flag = initObj.awake_flag
      }
      else {
        this.awake_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AwakeResponse
    // Serialize message field [awake_flag]
    bufferOffset = _serializer.bool(obj.awake_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AwakeResponse
    let len;
    let data = new AwakeResponse(null);
    // Deserialize message field [awake_flag]
    data.awake_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/AwakeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ba26fa73d43b7a318fdd106444479e6e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool awake_flag
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AwakeResponse(null);
    if (msg.awake_flag !== undefined) {
      resolved.awake_flag = msg.awake_flag;
    }
    else {
      resolved.awake_flag = false
    }

    return resolved;
    }
};

module.exports = {
  Request: AwakeRequest,
  Response: AwakeResponse,
  md5sum() { return '346f56948fa329d395224adefd3ff2c1'; },
  datatype() { return 'robot_audio/Awake'; }
};
