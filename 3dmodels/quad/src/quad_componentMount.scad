use <../../lib/utils.scad>

use <../../3rdParty/threads.scad>

// Standard M8 x 1


// M3 threaded mount; countersunk = false

module M3_threaded_mount()
{
  difference()
  {
    translate([0,0,1]) cube ([10,10,2], center=true);
    metric_thread (diameter=3, pitch=.5, length=5, internal=true);
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
    translate([0,0,.5]) hex(w=2.3,h=2);
  }
  translate([0,0,1.7])metric_thread (diameter=2.9, pitch=.5, length=6);
}

module M2_8_hex_screw(l=5,c=true)
{
  difference()
  {
    if (c == true)  cone(b=6, t=3, h=1.7); else cone(b=6, t=6, h=1.7);
    translate([0,0,.5]) hex(w=2.2,h=2);
  }
  translate([0,0,1.7])metric_thread (diameter=2.8, pitch=.5, length=6);
}

/*
module threaded_mount(d=3)
{
  difference()
  {
    translate([0,0,2]) cube ([10,10,4], center=true);
    metric_thread (diameter=d, pitch=.5, length=5, internal=true);
  }
}
*/

module threaded_mount(d=3,t=4)
{
	difference()
	{
		//cylinder(r = rolson_hex_nut_dia(dia)/2,h = hi, $fn=6);
		translate([0,0,t/2]) cube([10,10,t], center=true);
		translate([0,0,-0.1])	cylinder(r = d/2, h=t + 0.2, $fn=30);
	}
  thread_in_pitch(dia=d,hi=t,p=.5,thr=30);
}

//s = hex slot
//hh = head hight
module hex_screw(d=3,h=5,hh=2,s=2.4)
{

		c=false;
		difference()
		{
			if (c == true)  cone(b=6, t=3, h=2); else cone(b=6, t=6, h=2);
			translate([0,0,.8]) hex(w=s,h=2);
		}
		//////
		//translate([0,0,hhi-0.1])	thread_out(d,h+0.1,thr=50);
    translate([0,0,hh-0.1])	thread_out_pitch(d,h+0.1,.5,thr=30);
		//translate([0,0,hhi-0.1])	thread_out_centre(d,h+0.1);
    translate([0,0,hh-0.1])	thread_out_centre_pitch(d,h+0.1,.5,thr=30);
}

// M3_holeCountersunk();
// M3_hex_screw();
//translate ([10,0,0])
//M3_threaded_standOffMount();
//translate ([-10,0,0])

// Mounts
threaded_mount(d=3,t=4);
translate ([8,0,0]) threaded_mount(d=3.1,t=4);
translate ([16,0,0]) threaded_mount(d=3.2,t=4);

translate ([0,10,0]) hex_screw(d=2.8,h=5,s=2.5, hh=2);
translate ([8,10,0]) hex_screw(d=2.8,h=5,s=2.6, hh=2);
translate ([16,10,0]) hex_screw(d=2.8,h=5,s=2.7, hh=2);
//translate ([16,10,0]) hex_screw(d=2.8);
//translate ([24,10,0]) hex_screw(d=2.7,s=3);

//translate ([0,12,0]) M3_holeCountersunk();;

/*
translate ([8,0,0]) hex_bolt(2.8,5);	// could be 2.8
translate ([16,0,0]) M3_hex_screw(); // hex slot need to be reduced
translate ([24,0,0]) M2_8_hex_screw(); // try 2.9
*/
