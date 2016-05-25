use <utils.scad>

diameter = 85;
thickness = 4;
spokeWidth = 2;
ringWallThickness = 2;
ringGapSize = 6;

$fn=200;
 
// spokes
module spokes()
{
    for (j = [0 : 30 : 180])
    {
        rotate([0 , 0 ,j]) cube([diameter,spokeWidth, thickness], center=true);
    }
}

hollowCylinders(diameter/2, thickness, ringWallThickness, ringGapSize, 4);
translate([0,0,thickness/2]) spokes();
cylinder(r=thickness, h=thickness*3);

translate([0,0,thickness]) hollowCylinder(diameter/2,thickness, ringWallThickness);