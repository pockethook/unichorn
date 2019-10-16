$fn=100;

diameter = 60;
height = 250;
twist = 720;
thickness = 5;

module double_twisted_cone(diameter, height, twist, thickness) {
	shift = diameter / 6;
	linear_extrude(height, scale=0.1, twist=twist)
		difference() {
			union() {
			 translate ([shift, shift])
				 circle(d=diameter);
			 translate ([-shift, -shift])
				 circle(d=diameter);
			}
			union() {
			 translate ([shift, shift])
				 circle(d=diameter - thickness);
			 translate ([-shift, -shift])
				 circle(d=diameter - thickness);
			}
		}
}

double_twisted_cone(diameter, height, twist, thickness);
