use <../../lib/utils.scad>

/*
l = 29.9
w=29.9
h=10.5
*/


// h = height
// wt = wall thickness
// sw = side stop width
// bl =  base inside length
// bw = base inside width
// bt = base thickness
module cam_sideStops(h,wt, sw, bl,bw,bt)
{

  //when in front view
  //top
  translate([(bl-sw)/2,bw,0]) cube([sw,wt,h]);
  translate([bl/2,bw + 1,h + 1]) rotate([180,0,0]) edgeClamp(l=sw);

  // right
  translate([bl,(bw - sw)/2,0]) cube([wt,sw,h]);
  translate([bl + 1, bw/2,h + 1]) rotate([0,0,90]) edgeClamp(l=sw);

  //bottom
  translate([(bl-sw)/2,-2,0]) cube([sw,wt,h]);
  translate([bl/2,-1,h + 1]) edgeClamp(l=sw);

  //left
  translate([-2,(bw - sw)/2,0]) cube([wt,sw,h]);
  translate([-1,bw/2,h + 1]) rotate([0,0,-90]) edgeClamp(l=sw);

}

// l =  length of cam
// w = width of cam
// h = height of cam
// t = thickness of base
module cam_holder(l=cam_holder_l(), w=cam_holder_w() ,h=cam_holder_h() ,  t=cam_holder_t() )
{
  difference()
  {
    union()
    {
      cube([l,w,t]);
      cam_sideStops(h= (h + t),wt=2,sw=6 , bl=l , bw=w, bt=t);
    }
    translate([-.1, cam_holder_w() - 8 +.1,-.1]) cube([8,8,8]);
  }

  translate([-2,-2,0]) cube([2,l + 4,t]);
  translate([0,-2,0]) cube([5,2,t]);
  translate([0,cam_holder_w(),0]) cube([5,2,t]);

// fastner holes
translate([3,-5/2 - 2 + .01,5/2])
  rotate([0,90,0])
    difference()
    {
      translate([0,0,2/2]) cube([5, 5, 2], center=true);
      translate([0,0,-0.1])	cylinder(r = 3.4/2, h=5 + 0.2, $fn=50);
    }

translate([3,cam_holder_w() + 5/2 + 2 - .01,5/2])
  rotate([0,90,0])
    difference()
    {
      translate([0,0,2/2]) cube([5, 5, 2], center=true);
      translate([0,0,-0.1])	cylinder(r = 3.4/2, h=5 + 0.2, $fn=50);
    }


  %cam_sample();
}

module cam_sample()
{
  translate([0,0,2]) cube([30,30,10.5]);
  translate([15,15,2]) cylinder(h=20, r1=5, r2=5, $fn=50);
}

function cam_holder_l() = 30;
function cam_holder_w() = 30;
function cam_holder_h() = 10.5;
function cam_holder_t() = 2;

//cam_sample();
cam_holder(l=cam_holder_l(), w=cam_holder_w() , h=cam_holder_h(), t=cam_holder_t());
