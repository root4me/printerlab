use <standoff.scad>


difference()
{
    cube([20,20,10]);
    translate([1,1,-1]) cube([22,20,20]);
    translate([10,8,5]) rotate([-90,0,90]) cylinder(h=20, r1=2, r2=2, $fn=50);
}

translate([1,8,5]) rotate([-90,0,90]) standOffThreadedFemale(h=5,d=3.4,od=5);


translate([-4,5,0]) cube([.8,.8,5]);
translate([-4,10,0]) cube([.8,.8,5]);

translate([-4,5,0]) cube([.8,5,1]);