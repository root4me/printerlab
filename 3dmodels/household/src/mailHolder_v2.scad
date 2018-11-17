use <utils.scad>

module base()
{
 //   honeycombSquare(102,12,2,5,2);
    hollowRoundedCornerCube(100,10,2,4);
}

module holder()
{
    honeycombSquare(22,42,2,5,2);
    hollowRoundedCornerCube(20,40,2,2);
}


module holders()
{
rotate([90,0,0])
    translate([-38,21,5]) holder();
rotate([90,0,0])
    translate([-38,21,-5]) holder();

rotate([90,0,0])
    translate([38,21,5]) holder();
rotate([90,0,0])
    translate([38,21,-5]) holder();
}

base();
holders();

difference()
{
    translate([0,-26,1]) hollowRoundedCornerCube(100,40,4,2);
}
translate([0,-26,0]) honeycombSquare(102,42,2,5,2);
