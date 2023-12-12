// Auto-generated. Do not edit!

// (in-package ece642rtle.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class PoseOrntBundle {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.t = null;
      this.x = null;
      this.y = null;
      this.o = null;
    }
    else {
      if (initObj.hasOwnProperty('t')) {
        this.t = initObj.t
      }
      else {
        this.t = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('x')) {
        this.x = initObj.x
      }
      else {
        this.x = 0;
      }
      if (initObj.hasOwnProperty('y')) {
        this.y = initObj.y
      }
      else {
        this.y = 0;
      }
      if (initObj.hasOwnProperty('o')) {
        this.o = initObj.o
      }
      else {
        this.o = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PoseOrntBundle
    // Serialize message field [t]
    bufferOffset = _serializer.time(obj.t, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.int8(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int8(obj.y, buffer, bufferOffset);
    // Serialize message field [o]
    bufferOffset = _serializer.int8(obj.o, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PoseOrntBundle
    let len;
    let data = new PoseOrntBundle(null);
    // Deserialize message field [t]
    data.t = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [o]
    data.o = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 11;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ece642rtle/PoseOrntBundle';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4bf56cff2846ddf0c7c3fbc294b28115';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time t
    int8 x
    int8 y
    int8 o
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PoseOrntBundle(null);
    if (msg.t !== undefined) {
      resolved.t = msg.t;
    }
    else {
      resolved.t = {secs: 0, nsecs: 0}
    }

    if (msg.x !== undefined) {
      resolved.x = msg.x;
    }
    else {
      resolved.x = 0
    }

    if (msg.y !== undefined) {
      resolved.y = msg.y;
    }
    else {
      resolved.y = 0
    }

    if (msg.o !== undefined) {
      resolved.o = msg.o;
    }
    else {
      resolved.o = 0
    }

    return resolved;
    }
};

module.exports = PoseOrntBundle;
