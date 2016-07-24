
use <landing.scad>

l = 220; // length of the base plate 130
w = 60; // width for the base 52.5
ml = 10; // module lenght . Lenght of each strip containing holes to attach standoffs

t = 4; // thickness
f = 50; // number of facets for cylinders

// holes for screwing in the stand offs using M3 screw
d = 3.6; // diameter of holes
wd = 42; // distance between center of the hole to matching hole at opposite side of the width
ld = 87.5; // distance between center of the hole to matching hole at opposite side , length

module standOffHoles()
{
  hull()
  {
    cylinder (r=d/2, h=t, $fn=f);
    //translate([0,.5,0]) cylinder (r=d/2, h=t, $fn=f);
    //translate([0,-.5,0]) cylinder (r=d/2, h=t, $fn=f);
  }
  translate([0,wd,0]) cylinder (r=d/2, h=t, $fn=f);
}

module standOffHolesPair()
{
  standOffHoles();
  translate([ld,0,-.1]) standOffHoles();
}

// Module with holes for screwing in the stand offs
module tierConnectorW()
{
  difference()
  {
    cube([ml,w,2]);
    translate([ml/2,(w-wd)/2,-.1]) standOffHoles();
  }
}

// Module with holes for screwing in the stand offs
module tierConnectorL()
{
  difference()
  {
    cube([ld+6,ml,2]);
    translate([((ld+6) - ld)/2,ml/2,-.1])
    {
      cylinder (r=d/2, h=t, $fn=f);
      translate([ld,0,0]) cylinder (r=d/2, h=t, $fn=f);
    }
  }
}

module basePlate()
{
  difference()
  {
    cube([l,w,2]);
    translate([(l - ld)/2,(w-wd)/2,-.1]) standOffHolesPair();

    translate([(l - ld + 10)/2,(w-wd)/2 - 1,-.1]) cube([ld-10,2,4]);
    translate([(l - ld + 10)/2,(w-wd)/2 + wd - 1,-.1]) cube([ld-10,2,4]);
  }

translate([(l-40)/2,0,0]) cube ([40 , w ,2]);
}

module attachLandingSkids()
{
  translate([6,12,2]) rotate([0,0,-90]) landingSkid();
  translate([l,12,2]) rotate([0,0,-90]) landingSkid();
  translate([0,w - 12,2]) rotate([0,0,90]) landingSkid();
  translate([l - 6,w - 12,2]) rotate([0,0,90]) landingSkid();
}

// landingSkid();
basePlate();
//attachLandingSkids();

//battery();

//tierConnectorW();

module battery()
{
  translate([(l-105)/2,(w-35)/2,2])  cube([105,35,25]);
}
/*
width = 52.5

// Measurements for center stand off holes
width inner distance  = 37
length inner distance = 82.5
dia = 5
distace between centre to center of holes for width = 37 + 5

// Measurements for end stand off holes from center stand off holes
length inner distace = 48.5
distace between centre to center of holes = 48.5 + 5

// upper bottom plate measurements
length = 64.2
width inner distance = 23.2
distace between centre to center of holes = 23.2 + 5

//
battery length = 105
battery width = 35
battery height = 25

current length ~ 204

-------------------

*/
