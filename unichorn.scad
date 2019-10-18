$fn=100;

diameter = 60;
height = 250;
twists = 3;
thickness = 0.2;

module double_twisted_cone(diameter, height, twists) {
	shift = diameter / 6;
	linear_extrude(height, scale=0, twist=twists * 360) {
		union() {
		 translate ([shift, shift])
			 circle(d=diameter);
		 translate ([-shift, -shift])
			 circle(d=diameter);
		}
	}
}

module hollow_double_twisted_cone(diameter, height, twists, thickness) {
	difference() {
		double_twisted_cone(diameter, height, twists);
		rotate([0, 0, thickness * 360])
			translate([0, 0, -(thickness * height / twists)])
				double_twisted_cone(diameter, height, twists);
	}
}

hollow_double_twisted_cone(diameter, height, twists, thickness);
