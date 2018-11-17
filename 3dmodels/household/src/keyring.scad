use <../../lib/utils.scad>

$fn=100;
module ringlock()
{

    intersection()
    {
        hollowCylinder(10,4,.6);
        translate([0,-10,1]) cube([5,5,6], center=true);
    }

     //translate([-2.2,-8.5,2]) cube([.6,4,4], center=true);
     //translate([2.2,-16.3,2]) cube([.6,4,4], center=true);
}

module ring()
{
   translate([0,0,-1.5]) 
        hollowCylinder(12,3,2);

    rotate_extrude()
        translate([11,0,0]) circle(1.4, center=true);
    
}


difference()
{
    ringlock();
    // translate([0,-.3,-2]) ringlock();
}
