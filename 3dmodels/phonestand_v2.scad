// Simple phone stand

l = 50;
w = 76; // l x w will be the size of the base
h = 50;  
th = 4; // thickness of the bouding pillars
eb = true; // extend base to back to prevent tip over. Not required if phone is placed only on the side (watch videos etc.) on the stand

// base of the stand
module base()
{
    difference()
    {
       
        roundedCornerCube(l,w,th);
        roundedCornerCube(l-(th*2),w-(th*2),th);
    }

}

// vertical back of the stand
module backside()
{

    translate([0,0,50/2])
    rotate ([90,0,0])
        difference()
        {
        roundedCornerCube(50,50,4);
        roundedCornerCube(50 - 8,50 - 8,4);
        }

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

module extendbase()
{
    if (eb)
    {
    translate([0,-w + th,0]) base();
    }
}

module roundedCornerCube(length, width, thickness){

            hull()
        {
            translate([length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
        }

 }
    
base();
backside();
endstop();
