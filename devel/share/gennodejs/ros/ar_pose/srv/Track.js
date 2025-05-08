// Auto-generated. Do not edit!

// (in-package ar_pose.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TrackRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ar_id = null;
      this.goal_dist = null;
    }
    else {
      if (initObj.hasOwnProperty('ar_id')) {
        this.ar_id = initObj.ar_id
      }
      else {
        this.ar_id = 0;
      }
      if (initObj.hasOwnProperty('goal_dist')) {
        this.goal_dist = initObj.goal_dist
      }
      else {
        this.goal_dist = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackRequest
    // Serialize message field [ar_id]
    bufferOffset = _serializer.int8(obj.ar_id, buffer, bufferOffset);
    // Serialize message field [goal_dist]
    bufferOffset = _serializer.float32(obj.goal_dist, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackRequest
    let len;
    let data = new TrackRequest(null);
    // Deserialize message field [ar_id]
    data.ar_id = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [goal_dist]
    data.goal_dist = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ar_pose/TrackRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '31ed716f20b90cfc893ff145533260be';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 ar_id
    float32 goal_dist
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackRequest(null);
    if (msg.ar_id !== undefined) {
      resolved.ar_id = msg.ar_id;
    }
    else {
      resolved.ar_id = 0
    }

    if (msg.goal_dist !== undefined) {
      resolved.goal_dist = msg.goal_dist;
    }
    else {
      resolved.goal_dist = 0.0
    }

    return resolved;
    }
};

class TrackResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.message = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TrackResponse
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TrackResponse
    let len;
    let data = new TrackResponse(null);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ar_pose/TrackResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9bf829f07d795d3f9e541a07897da2c4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string message
    bool success
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TrackResponse(null);
    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    return resolved;
    }
};

module.exports = {
  Request: TrackRequest,
  Response: TrackResponse,
  md5sum() { return 'a9830d64a630dd3c64bf976a0539314c'; },
  datatype() { return 'ar_pose/Track'; }
};
