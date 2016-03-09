


// Cube with rounded corners
// roundedCornerCube (50,50,4);
module roundedCornerCube(length, width, thickness){

        hull()
        {
            translate([length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2, -width/2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
        }

}

// Hollow cube with rounded corners. Will look like a frame with rounded con
// hollowRoundedCornerCube(50,70,4,2);
module hollowRoundedCornerCube(length, width, thickness, wallthickness)
{
    difference()
    {
        roundedCornerCube(length,width,thickness);
        roundedCornerCube(length-(wallthickness*2),width-(wallthickness*2),thickness);
    }
}

module cylinderWithHandle(radius, thickness)
{
    rotate_extrude($fn=100) 
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


// honey comb design
module hc_column(length, cell_size, wall_thickness) {
        no_of_cells = floor(length / (cell_size + wall_thickness)) ;

        for (i = [0 : no_of_cells]) {
                translate([0,(i * (cell_size + wall_thickness)),0])
                         circle($fn = 6, r = cell_size * (sqrt(3)/3));
        }
}

module honeycomb (length, width, height, cell_size, wall_thickness) {
        no_of_rows = floor(1.2 * length / (cell_size + wall_thickness)) ;

        tr_mod = cell_size + wall_thickness;
        tr_x = sqrt(3)/2 * tr_mod;
        tr_y = tr_mod / 2;
        off_x = -1 * wall_thickness / 2;
        off_y = wall_thickness / 2;
        linear_extrude(height = height, center = true, convexity = 10, twist = 0, slices = 1)
                difference(){
                        square([length, width]);
                        for (i = [0 : no_of_rows]) {
                                translate([i * tr_x + off_x, (i % 2) * tr_y + off_y,0])
                                        hc_column(width, cell_size, wall_thickness);
                        }
                }
}

//honeycomb(length, width, height, cell_size, wall_thickness);
//honeycomb(50, 50, 4, 10, 1);

hollowRoundedCornerCube(50,70,4,2);