
use <../../lib/utils.scad>

/*
receiverLength = 52;
receiverWidth = 34.5;
receiverThickness = 15.5;
*/


// h = height
// wt = wall thickness
// sw = side stop width
// bl =  base inside length
// bw = base inside width
// bt = base thickness
module receiver_sideStops(h,wt, sw, bl,bw,bt)
{

  //when in front view
  //top
  translate([(bl-sw)/2,bw - .01,0]) cube([sw,wt,h]);
  translate([bl/2,bw + 1,h + 1 - .01]) rotate([180,0,0]) edgeClamp(l=sw);

  // right
  translate([bl - .01,bw-sw,0]) cube([wt,sw,h]);
  translate([bl + 1,bw - (sw/2),h + 1 - .01]) rotate([0,0,90]) edgeClamp(l=sw);

  //bottom
  translate([(bl-sw)/2,-2 + .01,0]) cube([sw,wt,h]);
  translate([bl/2,-1,h + 1 - .01]) edgeClamp(l=sw);

  //left
  translate([-2 + .01,0,0]) cube([wt,sw,h]);
  translate([-1,sw/2,h + 1 - .01]) rotate([0,0,-90]) edgeClamp(l=sw);

}

// l =  length of receiver
// w = width of receiver
// h = height of receiver
// t = thickness of base
module receiver_holder(l=receiver_holder_l(), w=receiver_holder_w() ,h=receiver_holder_h() ,  t=receiver_holder_t() )
{
  cube([l,w,t]);
  receiver_sideStops(h= (h + t),wt=2,sw=6 , bl=l , bw=w, bt=t);

  %receiver_sample();
}

module receiver_sample()
{
  translate([0,0,receiver_holder_t()]) cube([receiver_holder_l(),receiver_holder_w(),receiver_holder_h()]);
}

function receiver_holder_l() = 51;
function receiver_holder_w() = 34.8;
function receiver_holder_h() = 15;
function receiver_holder_t() = 1;


receiver_holder(l=receiver_holder_l(), w=receiver_holder_w() , h=receiver_holder_h(), t=receiver_holder_t());
