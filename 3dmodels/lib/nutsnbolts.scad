use <utils.scad>
use <../3rdParty/threads.scad>

// d = body diameter
// h = body height
// hh = head height
// hw = head width
// p = pitch
module M3_bolt(d=3,h=5,hh=2,hw=6,p=.5)
{
  //head
  translate([0,0,hh/2 + .1]) hex(w=hw,h=hh);

  // body
  translate([0,0,hh-0.1])	thread_out_pitch(d,h+0.1,p,thr=30);
  translate([0,0,hh-0.1])	thread_out_centre_pitch(d,h+0.1,p,thr=30);
}
