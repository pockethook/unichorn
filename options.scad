$fn=100;

diameter = 7;
height = 25;

module cone(diameter, height) {
	linear_extrude(height, scale=0.1)
		 circle(d=diameter);
}

module twisted_cone(diameter, height, twist) {
	linear_extrude(height, scale=0.1, twist=twist)
		 translate ([diameter / 10, diameter / 10])
			 circle(d=diameter);
}

module double_twisted_cone(diameter, height, twist) {
	shift = diameter / 6;
	linear_extrude(height, scale=0.1, twist=twist)
		union() {
		 translate ([shift, shift])
			 circle(d=diameter);
		 translate ([-shift, -shift])
			 circle(d=diameter);
		}
}

translate([2 * diameter, 0, 0])
	cone(diameter, height);

translate([4 * diameter, 0, 0])
	twisted_cone(diameter, height, twist=720);

translate([6 * diameter, 0, 0])
	double_twisted_cone(0.8 * diameter, height, twist=720);
