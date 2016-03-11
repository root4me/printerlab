


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

/*
module cylinderWithHandle(radius, thickness)
{
    rotate_extrude($fn=100)
        polygon( points = [[0,0], [radius,0], [radius,thickness] , [1,thickness], [2,thickness + 2] , [2,thickness + 6],[0,thickness + 6]] );
}
*/


// hollow cylinder
// hollowCylinder(radius, height, wallThickness)
// radius : radius to outter wall
// wallThickness : Thickness of wall
module hollowCylinder(radius, height, wallThickness)
{
    difference()
    {
        cylinder(h=height, r1=radius, r2=radius, $fn=100);
        cylinder(h=height, r1=radius - wallThickness, r2=radius - wallThickness, $fn=100);
    }
}


// hollow cylinders
// hollowCylinders(20, 10, 2, 2, 2)
// radius : radius to outer wall
// gapsSize : size of gap between each rings
// minradius : radius of the smallest ring
module hollowCylinders(radius, height, wallThickness, gapSize, minRadius)
{
    for (i = [radius : -(gapSize + wallThickness) : minRadius])
    {
       //echo (i);
       hollowCylinder(i,height,wallThickness);
    }
}

module cone(bottomRadius, topRadius, height)
{
    cylinder(h=height, r1=bottomRadius, r2=topRadius, $fn=100);
}

// hollowCone(10,4,20, 2)
module hollowCone(bottomRadius, topRadius, height, wallThickness)
{
    difference()
    {
        cylinder(h=height, r1=bottomRadius, r2=topRadius, $fn=100);
        cylinder(h=height, r1=bottomRadius - wallThickness, r2=topRadius - wallThickness, $fn=100);
    }
}


// honey comb design
module hc_column(length, cell_size, wall_thickness) {
        no_of_cells = floor(length / (cell_size + wall_thickness)) ;

    echo(no_of_cells);

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
//hollowRoundedCornerCube(50,70,4,2);

//hollowCylinder(10,20,2);

//hollowCylinders(20, 10, 2, 2, 2);
//cone(10,2,20);

//hollowCone(10,4,20, 2);

//hc_column(50, 4, 1);


  hex();

module hex()
{
    rad = 10;
    wallThickness = 2;
    length = 100;


    //cylinder($fn=6, r=rad, h=2);
    for (i = [0 : length/((rad*2) + (wallThickness*2))])
    {
      translate([rad*(3*i) + (wallThickness*2)*i,0,0]) cylinder($fn=6, r=10, h=2);

      //translate([rad*6 + (wallThickness*2)*2,0,0]) cylinder($fn=6, r=10, h=2);
      //translate([rad*9 + (wallThickness*2)*3,0,0]) cylinder($fn=6, r=10, h=2);
    }

    for (j = [1 : 2 : (length/(rad + wallThickness))])
    {
      translate([(rad*1.5) *j + wallThickness *j ,rad + wallThickness/2 ,0]) cylinder($fn=6, r=10, h=2);
    }



    //translate([(rad*1.5) *3 + wallThickness *3 ,10,0]) circle($fn=6, r=10);
    //translate([(rad*1.5) *5 + wallThickness *5 ,10,0]) circle($fn=6, r=10);


/*
    for (i = [3 : 3 : (length/ rad)])
    {
       echo (i);
        translate([(rad * i) + wallThickness,0,0]) circle($fn=6, r=rad);
    }

    for (i = [3 : 3 : (length/ rad)])
    {
        translate([(rad + (rad/2) + wallThickness/2) * i ,10,0]) circle($fn=6, r=10);
    }
*/
}
