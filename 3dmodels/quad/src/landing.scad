use <../../lib/utils.scad>
use <../../3rdParty/threads.scad>


module base(l=bl, w=bw,t=bt)
{
  cube([l,w,t], center=true);
}

module landingSkid(td=0)
{
  // leg
  difference()
  {
    hull()
    {
      rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
      translate([10,0,0]) rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
      translate([20,0,25]) rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
    }

    //Make it hollow
    hull()
    {
      translate([6,.1,4]) rotate([90,0,0]) cylinder(r=2, h=7, $fn=30);
      translate([10,.1,4]) rotate([90,0,0]) cylinder(r=2, h=7, $fn=30);
      translate([15,.1,16]) rotate([90,0,0]) cylinder(r=2, h=7, $fn=30);
    }

    translate([17,.1,25]) rotate([90,0,0]) cylinder(r=2, h=7, $fn=30);

    // M3 threaded holes
    if( td==1)
    {
      translate([2,-3,-2]) threaded_hole(d=3.1,t=5);
      translate([8,-3,-2]) threaded_hole(d=3,t=5);
    }
  }


  // feet
  difference()
  {
    hull()
    {
      translate([20,0,25]) rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
      translate([15,0,30]) rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
      translate([15,0,20]) rotate([90,0,0]) cylinder(r=2, h=6, $fn=30);
    }

    translate([17,.1,25]) rotate([90,0,0]) cylinder(r=2, h=7, $fn=30);
  }
}

module threaded_hole(d=3,t=4)
{
  translate([0,0,-0.1])	cylinder(r = d/2, h=t + 0.2, $fn=30);
  thread_in_pitch(dia=d,hi=t,p=.5,thr=30);
}

landingSkid();
