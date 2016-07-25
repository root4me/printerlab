use <../../lib/utils.scad>
use <../../3rdParty/threads.scad>

//hex_nut(3);							// make an M8 ISO nut


// h = height
// d = thread diameter
// w = width of square
module standOff_female_square(h=5,d=3,w=5)
{
  difference()
  {
    translate([0,0, h/2]) cube([w, w, h], center=true);
    translate([0,0,-0.1])	cylinder(r = d/2, h=h + 0.2, $fn=30);
  }
  thread_in_pitch(dia=d,hi=h,p=.5,thr=30);
}


standOff_female_square(h=10,d=3.4,w=5);
