use <../../lib/utils.scad>



l = 60;
w = 70; // width of the base (l x w = area of the base) 70
h = 50; // Height of the back support 
th = 1; // thickness

er = 7; // inner radius of the curved edge in front

module body()
{
 
    // front curved edge
    difference()
    {
    translate([0, l/2,er+th/2])
        difference()
        {
            rotate([90,0,0]) cylinder(h=l, r1=er+(th/2), r2=er+(th/2), $fn=100);
            translate([0,.02,0]) rotate([90,0,0]) cylinder(h=l + 1, r1=er-th/2, r2=er-th/2, $fn=100);

        }
        translate([th,0,er*2 - th*2]) rotate([0,110,0]) cube([er+th*2,l+2,3*er+(th*2)], center=true);
        translate([5,0,5]) cube([10,l + 2,10] ,  center=true);
        
   }

    // high back
    translate([sin(20)*(h/2) + er/2 + th + th/2,0,cos(20)*(h/2) + th/2]) rotate([0,110,0]) roundedCornerCube(h, l, th); 
}

// Tip over back support
module support()
{
    difference()
    {

        translate([7,0,0]) hollowCone(l/2, 4, 1.5*h, th);
        //translate([sin(20)*(h/2) + er/2 + th + th/2,0,cos(20)*(h/2) + th/2]) rotate([0,110,0]) roundedCornerCube(h, l, th);
        #translate([(sin(20)*(h/2))- (h/2 * cos(20)) + th + th,0,(cos(20)*(h/2))]) rotate([0,20,0]) cube([h,l,4*h], center=true);
    }
}

union ()
{
    //body();
    //support();
    //roundedCornerCube(152.5, 12, 77.5);
}

module phone()
{
    rotate([90,0,0]) roundedCornerCube(152.5, 77.5, 12);
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
        roundedCornerCube(152.5 + 2, 77.5 + 2, 12 + 2);
        roundedCornerCube(152.5, 77.5, 12);
        
        cube([145,70,15], center=true);
        translate([0,3,0]) cube([160,65,10], center=true);
        
       translate([152.5/2 - 15/2,77.5/2,12/2 - 2]) cube([15,10,2], center=true);
       translate([152.5/2 - 15/2,77.5/2, -12/2 + 2]) cube([15,10,2], center=true);
    }

    translate([0,77.5/2+ 20/2, - 12/2 + 10/2 - 1]) roundedCornerCube(10,20,10);
    translate([0,77.5/2 + 20 - 3.7,0]) rotate([0,-45,0]) cylinder(r1=3.7,r2=3.7,h=30,$fn=50);
    }

    /*
    translate([0,-10,0]) cube([160, 60, 15], center=true);
}
   translate([-152.5/2 + 1.5,20.2,0]) cube([5,.4,13],center=true);
   translate([152.5/2 - 1.5,20.2,0]) cube([5,.4,13],center=true);
 */