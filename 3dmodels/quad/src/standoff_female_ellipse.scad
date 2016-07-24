use <../../lib/utils.scad>
use <../../3rdParty/threads.scad>

//hex_nut(3);							// make an M8 ISO nut


// h = height
// d = thread diameter
// od = outer diameter
module standOffThreadedFemale(h=5,d=3,od=5)
{
  difference()
  {
    union()
    {
      hull()
      {
        translate([od/2,0,0])	cylinder(r= od/2, h=h, $fn=30);
        translate([-od/2,0,0])	cylinder(r= od/2, h=h, $fn=30);
      }
    }
    translate([0,0,-0.1])	cylinder(r = d/2, h=h + 0.2, $fn=30);
  }
  thread_in_pitch(dia=d,hi=h,p=.5,thr=30);
}

module standOffFemale(h=20, td=3.2, d =5)
{
  standOffThreadedFemale(h=5,d=td,od=d);
/*
  translate([0,0,5])
  hull()
  {
    translate([d/2,0,0])	cylinder(r= d/2, h=h-10, $fn=30);
    translate([-d/2,0,0])	cylinder(r= d/2, h=h-10, $fn=30);
  }
*/
  translate([0,0,5]) standOffThreadedFemale(h=h-10,d=td,od=d);
  translate([0,0,5 + (h-10)]) standOffThreadedFemale(h=5,d=td,od=5);
}

//standOffFemale(h=20, td=3.3, d =5);
 standOffThreadedFemale(h=20,d=3.4,od=5);
