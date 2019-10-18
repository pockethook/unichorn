$fn=100;

circle_diameter = 60;
circle_shift = 10;
height = 250;
twists = 3;
thickness = 1;

twist_degrees = twists * 360;
diameter = circle_diameter + circle_shift;
radius = diameter / 2;
thickness_twists = twists * thickness / radius;
thickness_twists_degrees = 360 * thickness_twists;

module double_twisted_cone(diameter, shift, height, twists) {
	linear_extrude(height, scale=0, twist=twist_degrees) {
		union() {
		 translate ([shift, shift])
			 circle(d=diameter);
		 translate ([-shift, -shift])
			 circle(d=diameter);
		}
	}
}

module hollow_double_twisted_cone(diameter, shift, height, twists, thickness) {
	difference() {
		double_twisted_cone(diameter, shift, height, twists);
		rotate([0, 0, thickness_twists_degrees])
			translate([0, 0, -(thickness_twists * height / twists)])
				double_twisted_cone(diameter, shift, height, twists);
	}
}

hollow_double_twisted_cone(
	circle_diameter, circle_shift, height, twists, thickness);
