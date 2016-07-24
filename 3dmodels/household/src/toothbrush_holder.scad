use <../../lib/utils.scad>


// h : height
// ns : number of sides for base
// br : bottom radius
// tr : top radius
// ro : rotation in degree between bottom and top
// sl : slice layer. high value give smooth appearence
// wt : wall thickness
hollowTwistExtrude(br=25,tr=15,sl=20, ro=180, wt=1);


cylinder(h=1, r1=26, r2=26, $fn=100);
