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
	$fn = 6;
	rotate([0,0,30]) {
		difference() {
			circle(r = edge_l);
			circle(r = edge_l-(edge_w*2));
		}
	}
}

module dots() {
	hex() {
		translate([0,((edge_l/2)/sin(30))-(dot/2)-dot_dist-edge_w,0]) {
			circle(r = dot/2, $fn = dot_s);
		}
	}
}

module spokes() {
	hex() {
		translate([-spoke_w/2,0,0]) {
			square([spoke_w, spoke_l]);
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
		circle(r = edge_w*2,, $fn=30);
	}
}
				
module hanger_hole() {
	translate([0,((edge_l/2)/sin(30))+edge_w,-0.5]) {
		cylinder(r = edge_w*1, h = height+1,  $fn=30);
	}
}


difference() {
	union() {
		linear_extrude(height = height) {
			border();
			hanger();
			spokes();
			dots();
		}
		branches();
	}
	hanger_hole();
}
