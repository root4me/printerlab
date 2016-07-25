use <../../lib/utils.scad>


// h : height
// ns : number of sides for base
// br : bottom radius
// tr : top radius
// ro : rotation in degree between bottom and top
// sl : slice layer. high value give smooth appearence
// wt : wall thickness
difference()
{
    union()
    {
        hollowTwistExtrude(h=80,br=12,tr=12,sl=100, ro=180, wt=.5 , ns=8);
        difference()
        {
          cylinder(h=5, r1=12, r2=11, $fn=100);
          translate([0,0,2]) cylinder(h=5, r1=7, r2=7, $fn=100);
        }
    }

    translate([0,0,3.1]) rotate([98,0,0]) cylinder(h=20, r1=1, r2=1, $fn=50);
    translate([0,0,3.1]) rotate([-98,0,0]) cylinder(h=20, r1=1, r2=1, $fn=50);
    translate([0,0,3.1]) rotate([0,98,0]) cylinder(h=20, r1=1, r2=1, $fn=50);
    translate([0,0,3.1]) rotate([0,-98,0]) cylinder(h=20, r1=1, r2=1, $fn=50);
}
