// Auto-generated. Do not edit!

// (in-package face_rec.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let face_results = require('../msg/face_results.js');

//-----------------------------------------------------------

class recognition_resultsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.mode = null;
      this.image_path = null;
    }
    else {
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = 0;
      }
      if (initObj.hasOwnProperty('image_path')) {
        this.image_path = initObj.image_path
      }
      else {
        this.image_path = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type recognition_resultsRequest
    // Serialize message field [mode]
    bufferOffset = _serializer.int8(obj.mode, buffer, bufferOffset);
    // Serialize message field [image_path]
    bufferOffset = _serializer.string(obj.image_path, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type recognition_resultsRequest
    let len;
    let data = new recognition_resultsRequest(null);
    // Deserialize message field [mode]
    data.mode = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [image_path]
    data.image_path = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.image_path);
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'face_rec/recognition_resultsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b0e7560dc21d6956d378e96d296c64a6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int8 mode
    string image_path
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new recognition_resultsRequest(null);
    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = 0
    }

    if (msg.image_path !== undefined) {
      resolved.image_path = msg.image_path;
    }
    else {
      resolved.image_path = ''
    }

    return resolved;
    }
};

class recognition_resultsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
      this.success = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = new face_results();
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
    // Serializes a message object of type recognition_resultsResponse
    // Serialize message field [result]
    bufferOffset = face_results.serialize(obj.result, buffer, bufferOffset);
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type recognition_resultsResponse
    let len;
    let data = new recognition_resultsResponse(null);
    // Deserialize message field [result]
    data.result = face_results.deserialize(buffer, bufferOffset);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += face_results.getMessageSize(object.result);
    return length + 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'face_rec/recognition_resultsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '22bd2b1480094425ede2ba2224be1250';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    face_rec/face_results result
    bool success
    
    ================================================================================
    MSG: face_rec/face_results
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
    const resolved = new recognition_resultsResponse(null);
    if (msg.result !== undefined) {
      resolved.result = face_results.Resolve(msg.result)
    }
    else {
      resolved.result = new face_results()
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
  Request: recognition_resultsRequest,
  Response: recognition_resultsResponse,
  md5sum() { return '63688d89abce970a45bd24bcb017d875'; },
  datatype() { return 'face_rec/recognition_results'; }
};
