use <../../lib/utils.scad>

/*

measurements that fits snug when printed standalone
bl = 27; // base inside length
bw = 21; // base inside width
bt = 2; // base thickness

sh = 5; // side stop height
st = 2; // side stop Thickness
sw = 5; // side stop width
*/


// h = height
// wt = wall thickness
// sw = side stop width
// bl =  base inside length
// bw = base inside width
// bt = base thickness
module videoTx_sideStops(h,wt, sw, bl,bw,bt)
{

  //when in front view
  //top
  translate([(bl-sw)/2,bw - .01,0]) cube([sw,wt,h]);
  translate([bl/2,bw + 1,h + 1 - .01]) rotate([180,0,0]) edgeClamp(l=sw);

  // right
  translate([bl - .01,0,0]) cube([wt,sw,h]);
  translate([bl + 1,sw/2,h + 1 - .01]) rotate([0,0,90]) edgeClamp(l=sw);

  //bottom
  translate([(bl-sw)/2,-2 + .01,0]) cube([sw,wt,h]);
  translate([bl/2,-1,h + 1  - .01]) edgeClamp(l=sw);

  //left
  translate([-2 + .01,(bw - sw)/2,0]) cube([wt,sw,h]);
  translate([-1,bw/2,h + 1  - .01]) rotate([0,0,-90]) edgeClamp(l=sw);

}

module videoTx_holder(l=videoTx_holder_l(), w=videoTx_holder_w() ,h=videoTx_holder_h() ,  t=videoTx_holder_t() )
{
  //base
  cube([l,w,t]);
  videoTx_sideStops(h= (h + t),wt=2,sw=5 , bl=l , bw=w, bt=t);

  %alarm_sample();
}

module alarm_sample()
{
  translate([0,0,2]) cube([videoTx_holder_l(),videoTx_holder_w(),videoTx_holder_h()]);
  translate([videoTx_holder_l() -3,videoTx_holder_w() - 3,5]) rotate([0,90,0]) cylinder(h=10, r1=2, r2=2, $fn=50);
  translate([videoTx_holder_l() -3,videoTx_holder_w() - 3,5]) rotate([0,90,0]) cylinder(h=40, r1=1, r2=1, $fn=50);
}

function videoTx_holder_l() = 27;
function videoTx_holder_w() = 21;
function videoTx_holder_h() = 5;
function videoTx_holder_t() = 2;


videoTx_holder(l=videoTx_holder_l(), w=videoTx_holder_w() , h=videoTx_holder_h(), t=videoTx_holder_t());
