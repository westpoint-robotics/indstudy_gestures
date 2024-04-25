// gesture_subscriber.cpp
#include "ros/ros.h"
#include "publisher_subscriber/GestureInformation.h" // Assuming your message is defined in "GestureInformation.msg"

// Callback function to handle incoming custom messages
void gestureCallback(const publisher_subscriber::GestureInformation::ConstPtr& msg)
{
  ROS_INFO("Received gesture message:");
  ROS_INFO("User ID: %d", msg->user_id);
  ROS_INFO("Gesture ID: %d", msg->gesture_id);
  ROS_INFO("Gesture Name: %s", msg->gesture_name.c_str());
}

int main(int argc, char **argv)
{
  // Initialize ROS
  ros::init(argc, argv, "gesture_subscriber");
  ros::NodeHandle nh;

  // Create a subscriber for the custom topic
  ros::Subscriber sub = nh.subscribe("gesture_topic", 10, gestureCallback);

  // Spin to process incoming messages
  ros::spin();

  return 0;
}
