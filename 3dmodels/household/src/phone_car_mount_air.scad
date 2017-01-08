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
 */

translate([0,0,w/2 + t/2])
rotate([90,0,0])
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
      }

        // big hole
        roundedCornerCube(l-12,w-12,h + 3);
        // through sides
        translate([0,w/3,0]) cube([l+10, w ,h +10], center=true);

    }

    //translate([0,w/2+ 20/2, - h/2 + 10/2 - t/2]) roundedCornerCube(10,20,10);
    //translate([0,w/2 + 20 - 3.7,0]) rotate([0,-45,0]) cylinder(r1=3.7,r2=3.7,h=30,$fn=50);
 }


module leg1()
{
  cube([60,4,4]);
  translate([60,0,0]) cube([4,4,6]);
}

module leg2()
{
  cube([60 + (sin(45) * l),7,7]);
  translate([60 + (sin(45) * l),0,0]) cube([7,7,20]);
}

al = sin(45) * l;

echo (al);

translate([-l/2 + 7,0,0]) rotate([0,0,90]) leg1();
translate([l/2 + .5,0,0]) rotate([0,0,90]) leg2();
