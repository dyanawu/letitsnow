/*
  Project: Xmas 2018 What Do I Do Project
  Part: Hex Snowflake Cookie Cutter Generator - variables

  dwu <dyanawu@gmail.com>
*/

//length of one edge of cookie
edge_l = 25;

//cutter edge thickness
edge_w = 0.8;

//raw cookie dough thickness
cookie_t = 6;

//snowflake hub
hub = 1.5;
hub_s = 50;

//snowflake dots
dot = 3; // maximum of 0.43* edge_l if you want non-touching dots but who cares
dot_s = 50;

//distance of dots from corners
dot_dist = 2;

//snowflake spoke length
spoke_l = 20;

//snowflake spoke width
spoke_w = 0.8;

//snowflake branch length
branch_l = 5;

//snowflake branch angle
branch_a = 120;

//number of branches
branch_n = 4;

//branch snowflake branch width
branch_w = 0.8;

//support struts
strut_l = ((edge_l/2)/tan(30))+(edge_w*3);
strut_w = 4;

$fn = 50;
