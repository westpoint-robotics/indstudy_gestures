// gesture_publisher.cpp
#include "ros/ros.h"
#include "publisher_subscriber/GestureInformation.h" // Assuming your message is defined in "GestureInformation.msg"

int main(int argc, char **argv)
{
  // Initialize ROS
  ros::init(argc, argv, "publisher");
  ros::NodeHandle nh;

  // Create a publisher for the custom message
  ros::Publisher pub = nh.advertise<publisher_subscriber::GestureInformation>("gesture_topic", 10);

  // Create a custom message
  publisher_subscriber::GestureInformation msg;
  msg.user_id = 123;
  msg.gesture_id = 456;
  msg.gesture_name = "Wave";

  // Set the loop rate (in Hz)
  ros::Rate loop_rate(10);

  // Counter for printing
  int counter = 0;

  // Main loop
  while (ros::ok())
  {
    // Increment counter and print
    counter++;
    ROS_INFO("Publishing gesture message #%d", counter);

    // Publish the custom message
    pub.publish(msg);

    // Spin once
    ros::spinOnce();

    // Sleep to maintain the loop rate
    loop_rate.sleep();
  }

  return 0;
}
