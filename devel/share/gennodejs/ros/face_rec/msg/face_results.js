// Auto-generated. Do not edit!

// (in-package face_rec.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let face_data = require('./face_data.js');

//-----------------------------------------------------------

class face_results {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.num = null;
      this.face_data = null;
    }
    else {
      if (initObj.hasOwnProperty('num')) {
        this.num = initObj.num
      }
      else {
        this.num = 0;
      }
      if (initObj.hasOwnProperty('face_data')) {
        this.face_data = initObj.face_data
      }
      else {
        this.face_data = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type face_results
    // Serialize message field [num]
    bufferOffset = _serializer.uint8(obj.num, buffer, bufferOffset);
    // Serialize message field [face_data]
    // Serialize the length for message field [face_data]
    bufferOffset = _serializer.uint32(obj.face_data.length, buffer, bufferOffset);
    obj.face_data.forEach((val) => {
      bufferOffset = face_data.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type face_results
    let len;
    let data = new face_results(null);
    // Deserialize message field [num]
    data.num = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [face_data]
    // Deserialize array length for message field [face_data]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.face_data = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.face_data[i] = face_data.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.face_data.forEach((val) => {
      length += face_data.getMessageSize(val);
    });
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'face_rec/face_results';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3582c39ba7ba2498c9e7ea9f75703724';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 num
    face_rec/face_data[] face_data
    ================================================================================
    MSG: face_rec/face_data
    string name
    float64 xmin
    float64 xmax
    float64 ymin
    float64 ymax
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new face_results(null);
    if (msg.num !== undefined) {
      resolved.num = msg.num;
    }
    else {
      resolved.num = 0
    }

    if (msg.face_data !== undefined) {
      resolved.face_data = new Array(msg.face_data.length);
      for (let i = 0; i < resolved.face_data.length; ++i) {
        resolved.face_data[i] = face_data.Resolve(msg.face_data[i]);
      }
    }
    else {
      resolved.face_data = []
    }

    return resolved;
    }
};

module.exports = face_results;
