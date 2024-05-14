// Auto-generated. Do not edit!

// (in-package publisher_subscriber.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class GestureInformation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user_id = null;
      this.gesture_id = null;
      this.gesture_name = null;
    }
    else {
      if (initObj.hasOwnProperty('user_id')) {
        this.user_id = initObj.user_id
      }
      else {
        this.user_id = 0;
      }
      if (initObj.hasOwnProperty('gesture_id')) {
        this.gesture_id = initObj.gesture_id
      }
      else {
        this.gesture_id = 0;
      }
      if (initObj.hasOwnProperty('gesture_name')) {
        this.gesture_name = initObj.gesture_name
      }
      else {
        this.gesture_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GestureInformation
    // Serialize message field [user_id]
    bufferOffset = _serializer.uint16(obj.user_id, buffer, bufferOffset);
    // Serialize message field [gesture_id]
    bufferOffset = _serializer.uint16(obj.gesture_id, buffer, bufferOffset);
    // Serialize message field [gesture_name]
    bufferOffset = _serializer.string(obj.gesture_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GestureInformation
    let len;
    let data = new GestureInformation(null);
    // Deserialize message field [user_id]
    data.user_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [gesture_id]
    data.gesture_id = _deserializer.uint16(buffer, bufferOffset);
    // Deserialize message field [gesture_name]
    data.gesture_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.gesture_name);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'publisher_subscriber/GestureInformation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3cf88e91afe598ebbb2355758ea13cb1';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint16 user_id
    uint16 gesture_id
    string gesture_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GestureInformation(null);
    if (msg.user_id !== undefined) {
      resolved.user_id = msg.user_id;
    }
    else {
      resolved.user_id = 0
    }

    if (msg.gesture_id !== undefined) {
      resolved.gesture_id = msg.gesture_id;
    }
    else {
      resolved.gesture_id = 0
    }

    if (msg.gesture_name !== undefined) {
      resolved.gesture_name = msg.gesture_name;
    }
    else {
      resolved.gesture_name = ''
    }

    return resolved;
    }
};

module.exports = GestureInformation;
