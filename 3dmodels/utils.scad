


module roundedEdgeSquare()
{
    hull()
    {
        translate([5,0,0]) cylinder(2, $fn=50);
        translate([0,5,0]) cylinder(2, $fn=50);
        translate([-5,0,0]) cylinder(2, $fn=50);
        translate([0,-5,0]) cylinder(2, $fn=50);
    }
}

module cylinderWithHandle(radius, thickness)
{
    rotate_extrude($fn=50) 
        polygon( points = [[0,0], [radius,0], [radius,thickness] , [1,thickness], [2,thickness + 2] , [2,thickness + 6],[0,thickness + 6]] );
}

module hollowCylinders(height, maxRadius, minRadius, wallThickness)
{
    $fn=100;
    difference()
    {
        cylinder(h=height, r1=maxRadius, r2=maxRadius);
        cylinder(h=height, r1=maxRadius - wallThickness, r2=maxRadius - wallThickness);
        

    }
}

hollowCylinders(10,20,1,2);

