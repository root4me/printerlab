use <../../lib/utils.scad>



l = 152.5; // length 
w = 77.5; // width 
h = 12; // height/thickness of phone
t = 2; // thickness of the sleve


module phone()
{
    roundedCornerCube(l, w, t);
}

// phone();

/*
translate([0,0,15])
union()
{
    difference()
    {
        cube([14 + 2,10,30] , center=true);
        translate([0,0,1]) cube([14 ,10 + 1,30] , center=true);
    }

    translate([-(14/2) - 2,0,-(15/2)])
    rotate([180,0,0])
    difference()
    {
        cube([2 + 2,10,15] , center=true);
        translate([0,0,1]) cube([2 ,10 + 1,15] , center=true);
    }
}
*/

/*
difference()
{
*/

union()
 {
 
    difference()
    {
     union()
     {    
        difference()
        {
            roundedCornerCube(l + t, w + t, h + t);
            roundedCornerCube(l, w, h);
        }

        //top
        translate([0,w/2 - 4,h/2 - 4])
         rotate([0,90,0])
         difference()
         {
            cube([8,8,l], center=true);
            translate([0,0,-l/2]) cylinder(r1=4,r2=4,h=l,$fn=50);
            translate([4,0,0]) cube([8.02,8.02,l + 1], center=true);
            translate([0,-4,0]) cube([8.02,8.02,l + 1], center=true);
         } 
                    
         //bottom
         translate([0,-w/2 + 4,h/2 - 4])
         rotate([0,90,180])
         difference()
         {
            cube([8,8,l], center=true);
            translate([0,0,-l/2]) cylinder(r1=4,r2=4,h=l,$fn=50);
            translate([4,0,0]) cube([8.02,8.02,l + 1], center=true);
            translate([0,-4,0]) cube([8.02,8.02,l + 1], center=true);
         } 

         // left
         translate([-l/2 + 4,0,h/2 - 4])
         rotate([90,0,0])
         difference()
         {
            cube([8,8,w], center=true);
            translate([0,0,-w/2]) cylinder(r1=4,r2=4,h=w,$fn=50);
            translate([4,0,0]) cube([8.02,8.02,w + 1], center=true);
            translate([0,-4,0]) cube([8.02,8.02,w + 1], center=true);
         } 

         // right
        translate([l/2 - 4,0,h/2 - 4])
        rotate([90,0,180])
         difference()
         {
            cube([8,8,w], center=true);
            translate([0,0,-w/2]) cylinder(r1=4,r2=4,h=w,$fn=50);
            translate([4,0,0]) cube([8.02,8.02,w + 1], center=true);
            translate([0,-4,0]) cube([8.02,8.02,w + 1], center=true);
         } 
        }
       
        // big hole
        roundedCornerCube(l-8,w-8,h + 3);
        // through sides
        translate([0,0,0]) cube([l+10, w -20,8], center=true);
        
        //
       translate([l/2 - 15/2,w/2,h/2 - 2]) cube([15,10,2], center=true);
       translate([l/2 - 15/2,w/2, -h/2 + 2]) cube([15,10,2], center=true);
    }

    translate([0,w/2+ 20/2, - h/2 + 10/2 - t/2]) roundedCornerCube(10,20,10);
    translate([0,w/2 + 20 - 3.7,0]) rotate([0,-45,0]) cylinder(r1=3.7,r2=3.7,h=30,$fn=50);
 }

 
  
 /*
    translate([0,-10,0]) cube([160, 60, 15], center=true);
}
   translate([-152.5/2 + 1.5,20.2,0]) cube([5,.4,13],center=true);
   translate([152.5/2 - 1.5,20.2,0]) cube([5,.4,13],center=true);
 */