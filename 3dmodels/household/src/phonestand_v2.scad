// Simple phone stand

use <utils.scad> 

l = 50;
w = 70; // width of the base (l x w = area of the base)
h = 50; // Height of the back support 
th = 4; // thickness
eb = true; // extend base to back to prevent tip over. Not required if phone is placed only on the side (watch videos etc.) on the stand

// base of the stand
module base()
{
    hollowRoundedCornerCube(l,w,th,th);
}

// vertical back of the stand
module backside()
{

    translate([0,0,h/2])
        rotate ([90,0,0])
            hollowRoundedCornerCube(l,h,th,th);


        // horizontal rows
        translate([0,0,50/4]) cube ([50,4,2], center=true);   
        translate([0,0,(50/4 + 50/4)]) cube ([50,4,2], center=true);   
        translate([0,0,(50/4 + (50/4 * 2))]) cube ([50,4,2], center=true);   

        // vertical supports
        translate([0,0,(50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);
        
        translate([50/4,0,(50/4 + 50/4) - (50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);
        translate([-50/4,0,(50/4 + 50/4) - (50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);

        translate([0,0,(50/4 + (50/4 * 2)) - (50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);

        translate([50/4,0,(50/4 + (50/4 * 2)) + (50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);
        translate([-50/4,0,(50/4 + (50/4 * 2)) + (50/4)/2]) rotate([0,90,0]) cube ([50/4,4,2], center=true);

}  


//end stop
module endstop()
{
    difference()
    {
        hull()
        {
            translate([l/2,-w/2,th]) cylinder(r=2, h=4, $fn=50, center=true);
            translate([-l/2,-w/2,th]) cylinder(r=2, h=4, $fn=50, center=true);
        }
        
        translate([0,-w/2 + 1,th]) cube([l+th,th/2,th], center=true);
    }
}


/*
module roundedCornerCube(length, width, thickness){

       hull()
        {
            translate([length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
        }

}
*/

base();
backside();
endstop();
