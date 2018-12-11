/*
  Project: Xmas 2018 What Do I Do Project
  Part: Hex Snowflake Cookie Cutter Generator - random

  dwu <dyanawu@gmail.com>
*/

//length of one edge of cookie
edge_l = 25;

//cutter edge thickness
edge_w = 0.8;

//raw cookie dough thickness
cookie_t = 6;

//snowflake hub
hub = (rands(0,6,1)[0]);
hub_s = (rands(3,32,1)[0]);

//snowflake dots
dot = (rands(0,6,1)[0]); // maximum of 0.43* edge_l if you want non-touching dots but who cares
dot_s = (rands(3,32,1)[0]);

//distance of dots from corners
dot_dist = (rands(-2,3,1)[0]);

//snowflake spoke length
spoke_l = ((edge_l/2)/tan(30))+(edge_w*3);

//snowflake spoke width
spoke_w = 0.8;

//snowflake branch length
branch_l = (rands(3,edge_l,1)[0]);

//snowflake branch angle
branch_a = (rands(10,180,1)[0]);

//number of branches
branch_n = (rands(0,8,1)[0]);

//branch snowflake branch width
branch_w = 0.8;

//support struts
strut_l = ((edge_l/2)/tan(30))+(edge_w*3);
strut_w = 1.5;
