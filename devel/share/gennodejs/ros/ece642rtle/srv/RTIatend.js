// Auto-generated. Do not edit!

// (in-package ece642rtle.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class RTIatendRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.t = null;
      this.x = null;
      this.y = null;
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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RTIatendRequest
    // Serialize message field [t]
    bufferOffset = _serializer.time(obj.t, buffer, bufferOffset);
    // Serialize message field [x]
    bufferOffset = _serializer.int8(obj.x, buffer, bufferOffset);
    // Serialize message field [y]
    bufferOffset = _serializer.int8(obj.y, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RTIatendRequest
    let len;
    let data = new RTIatendRequest(null);
    // Deserialize message field [t]
    data.t = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [x]
    data.x = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [y]
    data.y = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 10;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ece642rtle/RTIatendRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5d6e6d637d0e8170a0b6b92006975d55';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time t
    int8 x
    int8 y
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RTIatendRequest(null);
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

    return resolved;
    }
};

class RTIatendResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.atend = null;
    }
    else {
      if (initObj.hasOwnProperty('atend')) {
        this.atend = initObj.atend
      }
      else {
        this.atend = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RTIatendResponse
    // Serialize message field [atend]
    bufferOffset = _serializer.bool(obj.atend, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RTIatendResponse
    let len;
    let data = new RTIatendResponse(null);
    // Deserialize message field [atend]
    data.atend = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ece642rtle/RTIatendResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '74eb9cd583cb224ce5e6427d11f6cad3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool atend
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RTIatendResponse(null);
    if (msg.atend !== undefined) {
      resolved.atend = msg.atend;
    }
    else {
      resolved.atend = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RTIatendRequest,
  Response: RTIatendResponse,
  md5sum() { return '601274b2c558d8c19960f10fd7863a32'; },
  datatype() { return 'ece642rtle/RTIatend'; }
};
