$fn=100;

circle_diameter = 40;
circle_shift = 10;
height = 180;
twists = 3;
thickness = 1;
end_scale = 0.1;

module double_twisted_cone(diameter, shift, height, twists, end_scale) {
	twist_degrees = twists * 360;
	linear_extrude(height, scale=end_scale, twist=twist_degrees) {
		union() {
		 translate ([-shift / 2, 0])
			 circle(d=diameter);
		 translate ([shift / 2, 0])
			 circle(d=diameter);
		}
	}
}

module hollow_double_twisted_cone(
	diameter, shift, height, twists, end_scale, thickness) {
	extrapolated_height = height / (1 - end_scale);
	extrapolated_twists = twists / (1 - end_scale);
	radius = diameter / 2;
	min_radius = sqrt(radius * radius - shift * shift / 4);
	thickness_twists = extrapolated_twists * thickness / min_radius;
	thickness_twists_degrees = 360 * thickness_twists;
	thickness_offset = -thickness_twists * height / twists;
	difference() {
		double_twisted_cone(diameter, shift, height, twists, end_scale);
		rotate([0, 0, thickness_twists_degrees])
			translate([0, 0, thickness_offset])
				double_twisted_cone(
					diameter, shift, height, twists, end_scale);
	}
}

hollow_double_twisted_cone(
	circle_diameter, circle_shift, height, twists, end_scale, thickness);
