
use <cam.scad>
use <receiver.scad>
use <videoTx.scad>
use <alarm.scad>
use <base.scad>
use <standoff_female_square.scad>

use <../../lib/utils.scad>

/*
width inner distance  = 37
// Measurements for center stand off holes
length inner distance = 82.5
dia = 5
distace between centre to center of holes for width = 37 + 5

0------0
  87.5
--0------0--
    87.5 + 10

// Measurements for end stand off holes from center stand off holes
length inner distace = 48.5
distace between centre to center of holes = 48.5 + 5

0----0----0----0
53.5 +87.5+53.5+ 10
= 204.5
*/


module battery(x, l)
{
  translate([x,(w-35)/2,2])  cube([l,35,25]);
}


l = 220;
w = 60;
t = 1;

sh = 34; // side height

// x axis points where components need to be positions
ch = 0;
rr = ch + 5 + 3; // 5 = cam holder w ;  3mm from cam
bt = rr + receiver_holder_l() + 2 +  7; // 2 mm = endstop wall thickness; 10 mm from receiver holder
btl = 108; // max battery length
al = bt + btl + 7; // 10mm from battery

module base()
{
  //cube([l,w,t]);

  translate([l/2,w/2,t/2]) roundedCornerCube(l,w,t);

  // Cam holder stand offs
  translate([5/2,(5/2 + (w-cam_holder_w())/2) - 5 -2,t]) standOff_female_square(h=5,d=3.4,w=5);
  translate([5/2,5/2 + (w-cam_holder_w())/2 + cam_holder_w() + 2,t]) standOff_female_square(h=5,d=3.4,w=5);

  // Receiver
  translate([rr, (w -receiver_holder_w())/2,0 ]) receiver_holder(t=t);


  %battery(bt, btl);

  // alarm holder
  translate([alarm_holder_l() + al,30,0]) rotate([0,0,180]) alarm_holder(l=alarm_holder_l(), w=alarm_holder_w() , h=alarm_holder_h(), t=alarm_holder_t());


  translate([al + 2,(w-videoTx_holder_w() - 4),t/2]) rotate([0,-20,0]) videoTx_holder(l=videoTx_holder_l(), w=videoTx_holder_w() , h=videoTx_holder_h(), t=2);
  translate([al + videoTx_holder_l() ,(w-videoTx_holder_w() - 4),0]) rotate([0,-90,0]) cube([12,21,2]);
}

difference()
{
  base();
  //translate([bt,0,0]) cube([200,60,20]);
}
translate([bt - .01,0,0]) cube([1,60,20]);

// Cam
//translate([5,(w - cam_holder_l()) /2, t + 2]) rotate([0,-90,0]) cam_holder(l=cam_holder_l(), w=cam_holder_w() , h=cam_holder_h(), t=cam_holder_t());

hull()
{
  translate([1,1,0]) cylinder(r=1, h=sh, $fn=50);
  translate([bt - 1,1,0]) cylinder(r=1, h=sh, $fn=50);
}

hull()
{
  translate([al,1,0]) cylinder(r=1, h=sh, $fn=50);
  translate([l - 1,1,0]) cylinder(r=1, h=sh, $fn=50);
}


translate([0,w - 2,0])
hull()
{
  translate([1,1,0]) cylinder(r=1, h=sh, $fn=50);
  translate([bt - 1,1,0]) cylinder(r=1, h=sh, $fn=50);
}

translate([0,w - 2,0])
hull()
{
  translate([al,1,0]) cylinder(r=1, h=sh, $fn=50);
  translate([l - 1,1,0]) cylinder(r=1, h=sh, $fn=50);
}

//translate([((l-alarm_holder_l()) + alarm_holder_l()),15,alarm_holder_w() + t ]) rotate([90,180,0]) alarm_holder(l=alarm_holder_l(), w=alarm_holder_w() , h=alarm_holder_h(), t=alarm_holder_t());

//cube([t,w,30 + (2*t)]);
//translate([15,0,0]) rotate([0,0,45]) cube([t,w/3,30 + (2*t)]);
//translate([15,0,0]) translate([1.4,w-1.4,0]) rotate([0,0,135]) cube([t,w/3,30 + (2*t)]);

//translate([0,0,34]) basePlate();

//standOffThreadedFemale(h=10,d=3.4,od=5);


//cube([l,2,34]);
