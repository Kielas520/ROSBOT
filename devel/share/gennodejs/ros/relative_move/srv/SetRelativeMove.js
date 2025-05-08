// Auto-generated. Do not edit!

// (in-package relative_move.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class SetRelativeMoveRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal = null;
      this.global_frame = null;
      this.avoid_obstacle = null;
      this.finishStopObstacle = null;
    }
    else {
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = new geometry_msgs.msg.Pose2D();
      }
      if (initObj.hasOwnProperty('global_frame')) {
        this.global_frame = initObj.global_frame
      }
      else {
        this.global_frame = '';
      }
      if (initObj.hasOwnProperty('avoid_obstacle')) {
        this.avoid_obstacle = initObj.avoid_obstacle
      }
      else {
        this.avoid_obstacle = false;
      }
      if (initObj.hasOwnProperty('finishStopObstacle')) {
        this.finishStopObstacle = initObj.finishStopObstacle
      }
      else {
        this.finishStopObstacle = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetRelativeMoveRequest
    // Serialize message field [goal]
    bufferOffset = geometry_msgs.msg.Pose2D.serialize(obj.goal, buffer, bufferOffset);
    // Serialize message field [global_frame]
    bufferOffset = _serializer.string(obj.global_frame, buffer, bufferOffset);
    // Serialize message field [avoid_obstacle]
    bufferOffset = _serializer.bool(obj.avoid_obstacle, buffer, bufferOffset);
    // Serialize message field [finishStopObstacle]
    bufferOffset = _serializer.bool(obj.finishStopObstacle, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetRelativeMoveRequest
    let len;
    let data = new SetRelativeMoveRequest(null);
    // Deserialize message field [goal]
    data.goal = geometry_msgs.msg.Pose2D.deserialize(buffer, bufferOffset);
    // Deserialize message field [global_frame]
    data.global_frame = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [avoid_obstacle]
    data.avoid_obstacle = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [finishStopObstacle]
    data.finishStopObstacle = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.global_frame.length;
    return length + 30;
  }

  static datatype() {
    // Returns string type for a service object
    return 'relative_move/SetRelativeMoveRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '95e0b62a1da2ec483697d85f4f0775da';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    geometry_msgs/Pose2D goal
    string global_frame #map odom
    bool avoid_obstacle
    bool finishStopObstacle #停障碍时是否直接结束
    
    ================================================================================
    MSG: geometry_msgs/Pose2D
    # Deprecated
    # Please use the full 3D pose.
    
    # In general our recommendation is to use a full 3D representation of everything and for 2D specific applications make the appropriate projections into the plane for their calculations but optimally will preserve the 3D information during processing.
    
    # If we have parallel copies of 2D datatypes every UI and other pipeline will end up needing to have dual interfaces to plot everything. And you will end up with not being able to use 3D tools for 2D use cases even if they're completely valid, as you'd have to reimplement it with different inputs and outputs. It's not particularly hard to plot the 2D pose or compute the yaw error for the Pose message and there are already tools and libraries that can do this for you.
    
    
    # This expresses a position and orientation on a 2D manifold.
    
    float64 x
    float64 y
    float64 theta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetRelativeMoveRequest(null);
    if (msg.goal !== undefined) {
      resolved.goal = geometry_msgs.msg.Pose2D.Resolve(msg.goal)
    }
    else {
      resolved.goal = new geometry_msgs.msg.Pose2D()
    }

    if (msg.global_frame !== undefined) {
      resolved.global_frame = msg.global_frame;
    }
    else {
      resolved.global_frame = ''
    }

    if (msg.avoid_obstacle !== undefined) {
      resolved.avoid_obstacle = msg.avoid_obstacle;
    }
    else {
      resolved.avoid_obstacle = false
    }

    if (msg.finishStopObstacle !== undefined) {
      resolved.finishStopObstacle = msg.finishStopObstacle;
    }
    else {
      resolved.finishStopObstacle = false
    }

    return resolved;
    }
};

class SetRelativeMoveResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.success = null;
      this.message = null;
    }
    else {
      if (initObj.hasOwnProperty('success')) {
        this.success = initObj.success
      }
      else {
        this.success = false;
      }
      if (initObj.hasOwnProperty('message')) {
        this.message = initObj.message
      }
      else {
        this.message = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SetRelativeMoveResponse
    // Serialize message field [success]
    bufferOffset = _serializer.bool(obj.success, buffer, bufferOffset);
    // Serialize message field [message]
    bufferOffset = _serializer.string(obj.message, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SetRelativeMoveResponse
    let len;
    let data = new SetRelativeMoveResponse(null);
    // Deserialize message field [success]
    data.success = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [message]
    data.message = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.message.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a service object
    return 'relative_move/SetRelativeMoveResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '937c9679a518e3a18d831e57125ea522';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool success
    string message
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SetRelativeMoveResponse(null);
    if (msg.success !== undefined) {
      resolved.success = msg.success;
    }
    else {
      resolved.success = false
    }

    if (msg.message !== undefined) {
      resolved.message = msg.message;
    }
    else {
      resolved.message = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: SetRelativeMoveRequest,
  Response: SetRelativeMoveResponse,
  md5sum() { return '2f55ab509885410fe15bd79d5cf0ed25'; },
  datatype() { return 'relative_move/SetRelativeMove'; }
};
