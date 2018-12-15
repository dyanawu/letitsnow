/*
  Project: Xmas 2018 What Do I Do Project
  Part: Snowflake Generator Config File - random

  dwu <dyanawu@gmail.com>
*/

//length of one edge
edge_l = 30;

//edge thickness
edge_w = 1.6;

//height
height = 3;

//snowflake dots
dot = (rands(0,6,1)[0]); // maximum of 0.43* edge_l if you want non-touching dots but who cares
dot_s = (rands(3,12,1)[0]);

//distance of dots from corners
dot_dist = (rands(0,3,1)[0]);

//snowflake spoke length
spoke_l = ((edge_l/2)/tan(30))+(edge_w*2);

//snowflake spoke width
spoke_w = 1.6;

//snowflake branch angle
branch_a = (rands(40,150,1)[0]);

//snowflake branch length
branch_l = (rands(edge_l/3,edge_l*0.75,1)[0]);

//number of branches
branch_n = (rands(0,6,1)[0]);

//branch snowflake branch width
branch_w = 1.2;
