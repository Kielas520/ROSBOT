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

class NavRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.nav_order = null;
    }
    else {
      if (initObj.hasOwnProperty('nav_order')) {
        this.nav_order = initObj.nav_order
      }
      else {
        this.nav_order = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavRequest
    // Serialize message field [nav_order]
    bufferOffset = _serializer.string(obj.nav_order, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavRequest
    let len;
    let data = new NavRequest(null);
    // Deserialize message field [nav_order]
    data.nav_order = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.nav_order);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/NavRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '038c2ccb2af0905079318ffc740cb9a6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string nav_order
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavRequest(null);
    if (msg.nav_order !== undefined) {
      resolved.nav_order = msg.nav_order;
    }
    else {
      resolved.nav_order = ''
    }

    return resolved;
    }
};

class NavResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.position = null;
    }
    else {
      if (initObj.hasOwnProperty('position')) {
        this.position = initObj.position
      }
      else {
        this.position = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavResponse
    // Serialize message field [position]
    bufferOffset = _serializer.string(obj.position, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavResponse
    let len;
    let data = new NavResponse(null);
    // Deserialize message field [position]
    data.position = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.position);
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_audio/NavResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd6afdd327a64a50f94a7d3a2de5435e3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string position
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavResponse(null);
    if (msg.position !== undefined) {
      resolved.position = msg.position;
    }
    else {
      resolved.position = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: NavRequest,
  Response: NavResponse,
  md5sum() { return 'a5777d99dbd597cc68511d66738b3956'; },
  datatype() { return 'robot_audio/Nav'; }
};
