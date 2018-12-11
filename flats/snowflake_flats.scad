/*
  Project: Xmas 2018 What Do I Do Project
  Part: Hex Snowflake Decor Generator

  dwu <dyanawu@gmail.com>
*/

use <MCAD/array/along_curve.scad>
use <MCAD/shapes/2Dshapes.scad>
use <MCAD/shapes/cylinder.scad>
include <MCAD/units/metric.scad>
include <snowflake_flat_config_random.scad>

module hex() {
	mcad_rotate_multiply(6)
		children();
}

module layer(x=0) {
	linear_extrude(height = height+x)
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
}

module hub() {
	layer() {
		circle(hub, $fn = hub_s);
	}
}

module dots() {
	layer() {
		hex() {
			translate([0,((edge_l/2)/sin(30))-(dot/2)-dot_dist-edge_w,0]) {
				circle(r = dot/2, $fn = dot_s);
			}
		}
	}
}

module spokes() {
	layer() {
		hex() {
			translate([-spoke_w/2,0,0]) {
				square([spoke_w, spoke_l]);
			}
		}
	}
}

module branches() {
	hex() {
		for(i = [1 : branch_n]) {
			translate([0,(((edge_l/2)/sin(30))-(dot/2)-dot_dist-edge_w)*(i/(branch_n+1)),0]) {
				rotate([0,0,branch_a]) {
					ccube([branch_w,branch_l,height], center = [1,0,0]);
				}
				mirror([1,0,0]) {
					rotate([0,0,branch_a]) {
						ccube([branch_w,branch_l,height], center = [1,0,0]);
					}
				}
			}
		}
	}
}

module hanger() {
	layer() {
		translate([0,((edge_l/2)/sin(30))+edge_w,0]) {
				circle(r=edge_w*3, $fn=30);
		}
	}
}
				
module hanger_hole() {
	layer(1) {
		translate([0,((edge_l/2)/sin(30))+edge_w,-0.5]) {
			circle(r=edge_w*1.5, $fn=30);
		}
	}
}

difference() {
	union() {
		border();
		hanger();
		spokes();
		hub();
		dots();
		branches();
	}
	hanger_hole();
}
