/*
  Project: Xmas 2018 What Do I Do Project
  Part: Hex Snowflake Decor Generator

  dwu <dyanawu@gmail.com>
*/

use <MCAD/array/along_curve.scad>
use <MCAD/shapes/2Dshapes.scad>
include <MCAD/units/metric.scad>
include <snowflake_config_flat_random.scad>

module hex() {
	mcad_rotate_multiply(6)
		children();
}

module border() {
	linear_extrude(height = height) {
		rotate([0,0,30]) {
			hex() {
				translate([-edge_l/2,((edge_l/2)/tan(30))-edge_w,0]) {
					square([edge_l,edge_w]);
				}
			}
		}
	}
	cylinder(r = hub/2, h = height, $fn = hub_s);
}

module border2() {
	$fn = 6;
	linear_extrude(height = height) {
		rotate([0,0,30]) {
			difference() {
				circle(r = edge_l);
				circle(r = edge_l-(edge_w*2));
			}
		}
	}
}

module dots() {
		hex() {
			translate([0,((edge_l/2)/sin(30))-(dot/2)-dot_dist-edge_w,0]) {
				cylinder(r = dot/2, h = height, $fn = dot_s);
			}
	}
}

module spokes() {
		hex() {
			translate([-spoke_w/2,0,0]) {
				cube([spoke_w, spoke_l, height]);
			}
	}
}

module branches() {
	hex() {
		for(i = [1 : branch_n]) {
			translate([0,(((edge_l/2)/sin(30))-(dot/2)-dot_dist-edge_w)*(i/(branch_n+1)),0]) {
				rotate([0,0,branch_a]) {
					ccube([branch_w,branch_l-(i+i),height], center = [1,0,0]);
				}
				mirror([1,0,0]) {
					rotate([0,0,branch_a]) {
						ccube([branch_w,branch_l-(i+i),height], center = [1,0,0]);
					}
				}
			}
		}
	}
}

module hanger() {
		translate([0,((edge_l/2)/sin(30))+edge_w,0]) {
				cylinder(r = edge_w*2, h = height, $fn=30);
	}
}
				
module hanger_hole() {
		translate([0,((edge_l/2)/sin(30))+edge_w,-0.5]) {
			cylinder(r = edge_w*1, h = height+1,  $fn=30);
	}
}

difference() {
	union() {
		border2();
		hanger();
		spokes();
		dots();
		branches();
	}
	hanger_hole();
}
