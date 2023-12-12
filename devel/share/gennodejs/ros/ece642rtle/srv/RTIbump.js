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

class RTIbumpRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.t = null;
      this.x1 = null;
      this.y1 = null;
      this.x2 = null;
      this.y2 = null;
    }
    else {
      if (initObj.hasOwnProperty('t')) {
        this.t = initObj.t
      }
      else {
        this.t = {secs: 0, nsecs: 0};
      }
      if (initObj.hasOwnProperty('x1')) {
        this.x1 = initObj.x1
      }
      else {
        this.x1 = 0;
      }
      if (initObj.hasOwnProperty('y1')) {
        this.y1 = initObj.y1
      }
      else {
        this.y1 = 0;
      }
      if (initObj.hasOwnProperty('x2')) {
        this.x2 = initObj.x2
      }
      else {
        this.x2 = 0;
      }
      if (initObj.hasOwnProperty('y2')) {
        this.y2 = initObj.y2
      }
      else {
        this.y2 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RTIbumpRequest
    // Serialize message field [t]
    bufferOffset = _serializer.time(obj.t, buffer, bufferOffset);
    // Serialize message field [x1]
    bufferOffset = _serializer.int8(obj.x1, buffer, bufferOffset);
    // Serialize message field [y1]
    bufferOffset = _serializer.int8(obj.y1, buffer, bufferOffset);
    // Serialize message field [x2]
    bufferOffset = _serializer.int8(obj.x2, buffer, bufferOffset);
    // Serialize message field [y2]
    bufferOffset = _serializer.int8(obj.y2, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RTIbumpRequest
    let len;
    let data = new RTIbumpRequest(null);
    // Deserialize message field [t]
    data.t = _deserializer.time(buffer, bufferOffset);
    // Deserialize message field [x1]
    data.x1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [y1]
    data.y1 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [x2]
    data.x2 = _deserializer.int8(buffer, bufferOffset);
    // Deserialize message field [y2]
    data.y2 = _deserializer.int8(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ece642rtle/RTIbumpRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b776e1edb457fed3b060e7d733d94b13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    time t
    int8 x1
    int8 y1
    int8 x2
    int8 y2
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RTIbumpRequest(null);
    if (msg.t !== undefined) {
      resolved.t = msg.t;
    }
    else {
      resolved.t = {secs: 0, nsecs: 0}
    }

    if (msg.x1 !== undefined) {
      resolved.x1 = msg.x1;
    }
    else {
      resolved.x1 = 0
    }

    if (msg.y1 !== undefined) {
      resolved.y1 = msg.y1;
    }
    else {
      resolved.y1 = 0
    }

    if (msg.x2 !== undefined) {
      resolved.x2 = msg.x2;
    }
    else {
      resolved.x2 = 0
    }

    if (msg.y2 !== undefined) {
      resolved.y2 = msg.y2;
    }
    else {
      resolved.y2 = 0
    }

    return resolved;
    }
};

class RTIbumpResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bump = null;
    }
    else {
      if (initObj.hasOwnProperty('bump')) {
        this.bump = initObj.bump
      }
      else {
        this.bump = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type RTIbumpResponse
    // Serialize message field [bump]
    bufferOffset = _serializer.bool(obj.bump, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type RTIbumpResponse
    let len;
    let data = new RTIbumpResponse(null);
    // Deserialize message field [bump]
    data.bump = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ece642rtle/RTIbumpResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '735dfbbb79e16ebcd80b369cfbea8d63';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool bump
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new RTIbumpResponse(null);
    if (msg.bump !== undefined) {
      resolved.bump = msg.bump;
    }
    else {
      resolved.bump = false
    }

    return resolved;
    }
};

module.exports = {
  Request: RTIbumpRequest,
  Response: RTIbumpResponse,
  md5sum() { return '572d9da764261393a9c6c33976c42dac'; },
  datatype() { return 'ece642rtle/RTIbump'; }
};
