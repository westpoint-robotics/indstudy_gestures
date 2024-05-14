#include "ros/ros.h"
#include "body_tracker_msgs/Skeleton.h"

const int NUM_JOINTS = 12; // Define the number of joints

const std::string joint_names[] = {"Head", "Neck", "Shoulder", "Top of Spine", "Middle of Spine", "Bottom of Spine", "Left Shoulder", "Left Elbow", "Left Hand", "Right Shoulder", "Right Elbow", "Right Hand"};

void skeletonCallback(const body_tracker_msgs::Skeleton::ConstPtr& msg)
{
  // Declare a multidimensional array to store the joint positions
  float jointPositions[NUM_JOINTS][3];

  // Save the position of each joint to the array
  jointPositions[0][0] = msg->joint_position_head.x;
  jointPositions[0][1] = msg->joint_position_head.y;
  jointPositions[0][2] = msg->joint_position_head.z;

  jointPositions[1][0] = msg->joint_position_neck.x;
  jointPositions[1][1] = msg->joint_position_neck.y;
  jointPositions[1][2] = msg->joint_position_neck.z;

  jointPositions[2][0] = msg->joint_position_shoulder.x;
  jointPositions[2][1] = msg->joint_position_shoulder.y;
  jointPositions[2][2] = msg->joint_position_shoulder.z;

  jointPositions[3][0] = msg->joint_position_spine_top.x;
  jointPositions[3][1] = msg->joint_position_spine_top.y;
  jointPositions[3][2] = msg->joint_position_spine_top.z;

  jointPositions[4][0] = msg->joint_position_spine_mid.x;
  jointPositions[4][1] = msg->joint_position_spine_mid.y;
  jointPositions[4][2] = msg->joint_position_spine_mid.z;

  jointPositions[5][0] = msg->joint_position_spine_bottom.x;
  jointPositions[5][1] = msg->joint_position_spine_bottom.y;
  jointPositions[5][2] = msg->joint_position_spine_bottom.z;

  jointPositions[6][0] = msg->joint_position_left_shoulder.x;
  jointPositions[6][1] = msg->joint_position_left_shoulder.y;
  jointPositions[6][2] = msg->joint_position_left_shoulder.z;

  jointPositions[7][0] = msg->joint_position_left_elbow.x;
  jointPositions[7][1] = msg->joint_position_left_elbow.y;
  jointPositions[7][2] = msg->joint_position_left_elbow.z;

  jointPositions[8][0] = msg->joint_position_left_hand.x;
  jointPositions[8][1] = msg->joint_position_left_hand.y;
  jointPositions[8][2] = msg->joint_position_left_hand.z;

  jointPositions[9][0] = msg->joint_position_right_shoulder.x;
  jointPositions[9][1] = msg->joint_position_right_shoulder.y;
  jointPositions[9][2] = msg->joint_position_right_shoulder.z;

  jointPositions[10][0] = msg->joint_position_right_elbow.x;
  jointPositions[10][1] = msg->joint_position_right_elbow.y;
  jointPositions[10][2] = msg->joint_position_right_elbow.z;

  jointPositions[11][0] = msg->joint_position_right_hand.x;
  jointPositions[11][1] = msg->joint_position_right_hand.y;
  jointPositions[11][2] = msg->joint_position_right_hand.z;

  // Print the joint positions along with their names for verification
  for (int i = 0; i < NUM_JOINTS; ++i) {
    ROS_INFO("%s Position: x=%f, y=%f, z=%f", joint_names[i].c_str(),
              jointPositions[i][0], jointPositions[i][1], jointPositions[i][2]);
  }
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "skeleton_listener");
  ros::NodeHandle nh;
  ros::Subscriber sub = nh.subscribe("/body_tracker/skeleton", 1000, skeletonCallback);
  ros::spin();
  return 0;
}
