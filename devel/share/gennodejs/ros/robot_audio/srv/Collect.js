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

class CollectRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.collect_flag = null;
    }
    else {
      if (initObj.hasOwnProperty('collect_flag')) {
        this.collect_flag = initObj.collect_flag
      }
      else {
        this.collect_flag = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CollectRequest
    // Serialize message field [collect_flag]
    bufferOffset = _serializer.bool(obj.collect_flag, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollectRequest
    let len;
    let data = new CollectRequest(null);
    // Deserialize message field [collect_flag]
    data.collect_flag = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/CollectRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1e5a4c2fde512defbeb6f36ecc721e7f';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool collect_flag
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CollectRequest(null);
    if (msg.collect_flag !== undefined) {
      resolved.collect_flag = msg.collect_flag;
    }
    else {
      resolved.collect_flag = false
    }

    return resolved;
    }
};

class CollectResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.voice_filename = null;
    }
    else {
      if (initObj.hasOwnProperty('voice_filename')) {
        this.voice_filename = initObj.voice_filename
      }
      else {
        this.voice_filename = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type CollectResponse
    // Serialize message field [voice_filename]
    bufferOffset = _serializer.string(obj.voice_filename, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type CollectResponse
    let len;
    let data = new CollectResponse(null);
    // Deserialize message field [voice_filename]
    data.voice_filename = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.voice_filename);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/CollectResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '54891ae46df7ead06046f88b1fa92aa3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string voice_filename
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new CollectResponse(null);
    if (msg.voice_filename !== undefined) {
      resolved.voice_filename = msg.voice_filename;
    }
    else {
      resolved.voice_filename = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: CollectRequest,
  Response: CollectResponse,
  md5sum() { return '10ccb23b7c8752a359f2fdb188e7b775'; },
  datatype() { return 'robot_audio/Collect'; }
};
