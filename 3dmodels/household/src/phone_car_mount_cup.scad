
rad1= 85;
rad2=75;

/*
translate([0,-20/2 + 4,10/2 - 4])
rotate([0,90,180])
difference()
{
   cube([8,8,20], center=true);
   translate([0,0,-20/2]) cylinder(r1=4,r2=4,h=20,$fn=50);
   translate([4,0,0]) cube([8.02,8.02,l + 1], center=true);
   translate([0,-4,0]) cube([8.02,8.02,l + 1], center=true);
}
*/


/**
 * [inside_concave_edge description]
 * @param  {[type]} s=10 [description]
 * @param  {[type]} l=1  [description]
 * @return {[type]}      [description]
 *
 */
module inside_concave_edge(s=10,l=1)
{
  difference()
  {
    cube([s,s,l]);
    translate([s/2,s/2, -.02]) cylinder(r1=s/2,r2=s/2,h=l + .1,$fn=100);

    translate([-.02,s/2, -.02]) cube([s,s + .1,l + .1]);
    translate([s/2,-.02,-.02]) cube([s,s + .1,l + .1]);
  }

}

intersection()
{

  translate([10/2,10/2, -.02]) cylinder(r1=10/2,r2=10/2,h=1 + .1,$fn=100);

cube([10,10 + .1,1 + .1]);

}
