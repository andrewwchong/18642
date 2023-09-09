/**
 * turtle_publisher_18642.cpp
 * Skeleton code by Milda Zizyte (milda@cmu.edu)
 * 
 * You should edit this file to use the /turtle1/cmd_vel topic
 * to draw a figure-eight with the turtlebot.
 *
 * A figure eight is two adjacent circles. You can draw this by drawing a full
 * circle using constant non-zero angular and linear velocity, and then
 * negating angular velocity and drawing a second full circle.
 *
 * For extra credit, add a function to print the Turtle's (x,y) location and
 * linear and angular velocity, by reading the turtlesim/Pose message.
 * You can print using the ROS_INFO(string) function.
 */

#include "ros/ros.h"
#include "geometry_msgs/Twist.h" // access using geometry_msgs::Twist
#include "turtlesim/Pose.h" // access using turtlesim::Pose

// any state variables or callback/computation functions go here

void callback(const turtlesim::Pose::ConstPtr& msg){
  int i = 0;
  ROS_INFO("\nPOSE: (x:[%f],y:[%f],linear velocity:[%f],angular velocity[%f])",msg->x,msg->y,msg->linear_velocity,msg->angular_velocity);
}

int main(int argc, char **argv) {
  ros::init(argc, argv, "turtle_publisher_18642");
  ros::NodeHandle nh;

  ros::Publisher vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 1000);
  ros::Subscriber sub = nh.subscribe("/turtle1/pose", 1000, callback);


  ROS_INFO("Starting up turtle_publisher_18642.");

  /* 
   * The following is code to command the turtle in a straight line, in 5 steps.
   * You should replace it with your own code to draw a figure 8.
   */
  ros::Rate r(10); // .5Hz (run every 2 seconds)

  int num_steps = 680;

  while (num_steps > 0) {
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = .1;
    vel_msg.angular.z= .1; 
    vel_pub.publish(vel_msg);
    num_steps--;
    ros::spinOnce();
    r.sleep();
  }

  num_steps = 680;
  while (num_steps > 0) {
    geometry_msgs::Twist vel_msg;
    vel_msg.linear.x = .1;
    vel_msg.angular.z= -.1;
    vel_pub.publish(vel_msg);
    num_steps--;
    ros::spinOnce();
    r.sleep();
  }
  return 0;
}
