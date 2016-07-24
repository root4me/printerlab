
difference()
{
linear_extrude(height = .4, center = true, convexity = 10, twist = 0)
square([220,60]);

linear_extrude(height = 1, center = true, convexity = 10, twist = 0)
translate([.5,.5,-.1]) square([220 - 1,60 - 1]);

}