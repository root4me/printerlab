use <utils.scad>

module base()
{
 //   honeycombSquare(102,12,2,5,2);
    hollowRoundedCornerCube(100,15,4,4);
}

module holder()
{
    honeycombSquare(22,42,2,5,2);
    hollowRoundedCornerCube(20,40,2,2);
}

base();
rotate([90,0,0]) 
    translate([-38,21,7]) holder();
rotate([90,0,0]) 
    translate([-38,21,-7]) holder();

rotate([90,0,0]) 
    translate([38,21,7]) holder();
rotate([90,0,0]) 
    translate([38,21,-7]) holder();
