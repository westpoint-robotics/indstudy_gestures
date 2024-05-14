#!/usr/bin/env python

import rospy
from body_tracker_msgs.msg import Skeleton
from dtaidistance import dtw
import numpy as np

NUM_JOINTS = 12  # Define the number of joints

joint_names = ["Head", "Neck", "Shoulder", "Top of Spine", "Middle of Spine", "Bottom of Spine",
               "Left Shoulder", "Left Elbow", "Left Hand", "Right Shoulder", "Right Elbow", "Right Hand"]

def compute_vector(p1, p2):
    if p1 == [0,0,0] or p2 == [0,0,0]:
        return [0,0,0]
    else:
        return np.array(p2) - np.array(p1)

def cartesian_to_spherical(vector):
    """Convert Cartesian coordinates to spherical coordinates."""
    x, y, z = vector
    r = np.sqrt(x**2 + y**2 + z**2)
    
    # Compute phi (polar angle) with positive z-axis as 0 and range [0, pi]
    phi = np.arccos(z / r)
    
    # Compute theta (azimuthal angle) with positive x-axis as 0 and range [0, 2*pi)
    theta = np.arctan2(y, x)
    if theta < 0:
        theta += 2 * np.pi
    
    return theta, phi

# Define your control set representing the specific gesture
control_set = {
    'Right Elbow to Right Hand': [[theta1, phi1], [theta2, phi2], ...],
    'Left Elbow to Left Hand': [[theta1, phi1], [theta2, phi2], ...]
}

# Compute DTW distance between control set and observed vectors
def compute_dtw_distance(observed_vectors):
    dtw_distances = []
    for key, control_vector in control_set.items():
        dtw_distance, _ = dtw.distance_fast(control_vector, observed_vectors[key])
        dtw_distances.append(dtw_distance)
    return dtw_distances

def skeleton_callback(msg):
    # Declare a list to store the joint positions
    joint_positions = [[] for _ in range(NUM_JOINTS)]

    # Save the position of each joint to the list
    joint_positions[0] = [msg.joint_position_head.x, -1*msg.joint_position_head.y, msg.joint_position_head.z]
    joint_positions[1] = [msg.joint_position_neck.x, -1*msg.joint_position_neck.y, msg.joint_position_neck.z]
    joint_positions[2] = [msg.joint_position_shoulder.x, -1*msg.joint_position_shoulder.y, msg.joint_position_shoulder.z]
    joint_positions[3] = [msg.joint_position_spine_top.x, -1*msg.joint_position_spine_top.y, msg.joint_position_spine_top.z]
    joint_positions[4] = [msg.joint_position_spine_mid.x, -1*msg.joint_position_spine_mid.y, msg.joint_position_spine_mid.z]
    joint_positions[5] = [msg.joint_position_spine_bottom.x, -1*msg.joint_position_spine_bottom.y, msg.joint_position_spine_bottom.z]
    joint_positions[6] = [msg.joint_position_left_shoulder.x, -1*msg.joint_position_left_shoulder.y, msg.joint_position_left_shoulder.z]
    joint_positions[7] = [msg.joint_position_left_elbow.x, -1*msg.joint_position_left_elbow.y, msg.joint_position_left_elbow.z]
    joint_positions[8] = [msg.joint_position_left_hand.x, -1*msg.joint_position_left_hand.y, msg.joint_position_left_hand.z]
    joint_positions[9] = [msg.joint_position_right_shoulder.x, -1*msg.joint_position_right_shoulder.y, msg.joint_position_right_shoulder.z]
    joint_positions[10] = [msg.joint_position_right_elbow.x, -1*msg.joint_position_right_elbow.y, msg.joint_position_right_elbow.z]
    joint_positions[11] = [msg.joint_position_right_hand.x, -1*msg.joint_position_right_hand.y, msg.joint_position_right_hand.z]

    # Compute vectors between joints and store their phi and theta values
    observed_vectors = {
        'Right Elbow to Right Hand': [],
        'Left Elbow to Left Hand': []
    }

    for key in observed_vectors.keys():
        p1, p2 = key.split(" to ")
        theta, phi = cartesian_to_spherical(compute_vector(joint_positions[joint_names.index(p1)], joint_positions[joint_names.index(p2)]))
        observed_vectors[key].append([theta, phi])

    # Compute DTW distance between the control set and observed vectors
    dtw_distances = compute_dtw_distance(observed_vectors)

    # Set a threshold for DTW distance to determine gesture match
    threshold = 0.5  # Adjust as needed

    # Check if the observed vectors match the specific gesture based on the threshold
    if all(distance < threshold for distance in dtw_distances):
        rospy.loginfo("Observed vectors match the specific gesture.")
    else:
        rospy.loginfo("Observed vectors do not match the specific gesture.")

def main():
    rospy.init_node('skeleton_listener')
    rospy.Subscriber('/body_tracker/skeleton', Skeleton, skeleton_callback)
    rospy.spin()

if __name__ == '__main__':
    main()
