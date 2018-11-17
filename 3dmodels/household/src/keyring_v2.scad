use <../../lib/utils.scad>

$fn=100;
module ringlock()
{

    intersection()
    {
        hollowCylinder(10,4,.6);
        translate([0,-10,1]) cube([5,5,6], center=true);
    }

     translate([-2.4,-7.7,2]) cube([.6,4,4], center=true);
     translate([2.4,-11.3,2]) cube([.6,4,4], center=true);
}

module ring()
{
  // translate([0,0,-1.5]) 
       // hollowCylinder(14,3,2);

    rotate_extrude()
        translate([13,0,0]) circle(1.4, center=true);
    
}


difference()
{
    ring();
    rotate([45,0,0]) translate([10,0,0]) cube([10,.4,10], center=true);
    translate([0,-3.2,-2]) ringlock();
}
