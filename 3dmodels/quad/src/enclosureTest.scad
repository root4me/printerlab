difference()
{
    cube([20,20,10]);
    translate([1,1,-1]) cube([22,18,20]);
}

translate([0,0,10])
{
    difference()
    {
        cube([20,20,1]);
        translate([10,10,-1]) cylinder(h=10, r1=2, r2=2, $fn=50);
        translate([16,8,-1]) cube([2,5,4]);
    }
}

translate([19,1.5,0]) cube([1,17,1]);

translate([19,2,0]) cube([.8,.8,10]);
translate([19,4,0]) cube([.8,.8,10]);
translate([19,6,0]) cube([.8,.8,10]);
translate([19,8,0]) cube([.8,.8,10]);
translate([19,10,0]) cube([.8,.8,10]);
translate([19,12,0]) cube([.8,.8,10]);
translate([19,14,0]) cube([.8,.8,10]);
translate([19,16,0]) cube([.8,.8,10]);



translate([12,1.5,0]) cube([1,17,1]);

translate([12,2,0]) cube([.8,.8,10]);
translate([12,4,0]) cube([.8,.8,10]);
translate([12,6,0]) cube([.8,.8,10]);
translate([12,8,0]) cube([.8,.8,10]);
translate([12,10,0]) cube([.8,.8,10]);
translate([12,12,0]) cube([.8,.8,10]);
translate([12,14,0]) cube([.8,.8,10]);
translate([12,16,0]) cube([.8,.8,10]);


translate([12,2,0]) cube([7,.8,1]);
translate([12,4,0]) cube([7,.8,1]);
translate([12,6,0]) cube([7,.8,1]);
translate([12,8,0]) cube([7,.8,1]);
translate([12,10,0]) cube([7,.8,1]);
translate([12,12,0]) cube([7,.8,1]);
translate([12,14,0]) cube([7,.8,1]);
translate([12,16,0]) cube([7,.8,1]);


translate([5,1.5,0]) cube([1,17,1]);

translate([5,2,0]) cube([.8,.8,10]);
translate([5,4,0]) cube([.8,.8,10]);
translate([5,6,0]) cube([.8,.8,10]);
translate([5,8,0]) cube([.8,.8,10]);
translate([5,10,0]) cube([.8,.8,10]);
translate([5,12,0]) cube([.8,.8,10]);
translate([5,14,0]) cube([.8,.8,10]);
translate([5,16,0]) cube([.8,.8,10]);

translate([5,2,0]) cube([7,.8,1]);
translate([5,4,0]) cube([7,.8,1]);
translate([5,6,0]) cube([7,.8,1]);
translate([5,8,0]) cube([7,.8,1]);
translate([5,10,0]) cube([7,.8,1]);
translate([5,12,0]) cube([7,.8,1]);
translate([5,14,0]) cube([7,.8,1]);
translate([5,16,0]) cube([7,.8,1]);
