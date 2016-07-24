use <../../lib/utils.scad>


/*
l = 35
w = 25.3
h = 5.5
actual height = 10
*/



// h = height
// wt = wall thickness
// sw = side stop width
// bl =  base inside length
// bw = base inside width
// bt = base thickness
module alarm_sideStops(h,wt, sw, bl,bw,bt)
{

  //when in top view
  //top
  translate([(bl-sw)/2,bw - .01,0]) cube([sw,wt,h]);
  translate([bl/2,bw + 1,h + 1 - .01]) rotate([180,0,0]) edgeClamp(l=sw);

  // right
  //translate([bl,(bw - 2)/2 + 4,0]) cube([wt,2,h]);
  //translate([bl + 1, bw/2 + 4,h + 1]) rotate([0,0,90]) edgeClamp(l=2);

  //bottom
  translate([(bl-sw)/2,-2 + .01,0]) cube([sw,wt,h]);
  translate([bl/2,-1,h + 1 - .01]) edgeClamp(l=sw);

  //left
  translate([-2 + .01,(bw - sw)/2,0]) cube([wt,sw,h]);
  translate([-1,bw/2,h + 1 - .01]) rotate([0,0,-90]) edgeClamp(l=sw);

}

// l =  length of alarm
// w = width of alarm
// h = height of alarm
// t = thickness of base
module alarm_holder(l=52, w=34.5 ,h=15.5 ,  t=2 )
{
  cube([l,w,t]);
  alarm_sideStops(h= (h + t),wt=2,sw=5 , bl=l , bw=w, bt=t);

  %alarm_sample();
}

module alarm_sample()
{
  translate([0,0,alarm_holder_t()]) cube([alarm_holder_l(),alarm_holder_w(),alarm_holder_ah()]);
}

//alarm_sample();
//alarm_holder(l=35, w=25.5 , h=5.5, t=2 );


function alarm_holder_l() = 35;
function alarm_holder_w() = 26;
function alarm_holder_h() = 5.5;
function alarm_holder_t() = 2;
function alarm_holder_ah() = 10;

//alarm_sample();
alarm_holder(l=alarm_holder_l(), w=alarm_holder_w() , h=alarm_holder_h(), t=alarm_holder_t());
