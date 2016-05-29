use <../utils.scad>
use <threads.scad>

// Standard M8 x 1


// M3 threaded mount; countersunk = false

module M3_threaded_mount()
{
  difference()
  {
    translate([0,0,1]) cube ([10,10,2], center=true);
    metric_thread (diameter=3, pitch=.5, length=10, internal=true);
  }
}

module M3_threaded_standOffMount()
{

  translate([0,0,1]) cube ([10,10,2], center=true);

  difference()
  {
    translate([0,0,2]) cylinder(h=6, r1=2, r2=2, $fn=50);
    metric_thread (diameter=3, pitch=.5, length=8, internal=true);
  }

}

module M3_holeCountersunk(){
  difference()
  {
    translate([0,0,1]) cube ([10,10,2], center=true);
    //adding .2 to give screw some room
    cone(b=6 + .2, t=3 + .2, h=2);
  }
}

// l = thread length
// c = countersunk
module M3_hex_screw(l=5,c=true)
{
  difference()
  {
    if (c == true)  cone(b=6, t=3, h=1.7); else cone(b=6, t=6, h=1.7);
    translate([0,0,.5]) hex(w=2,h=2);
  }
  translate([0,0,1.7])metric_thread (diameter=3, pitch=.5, length=6);
}



// M3_holeCountersunk();
M3_hex_screw();
translate ([10,0,0]) M3_threaded_standOffMount();
translate ([-10,0,0]) M3_threaded_mount();
translate ([0,12,0]) M3_holeCountersunk();
