


// Cube with rounded corners
// roundedCornerCube (50,50,4);
module roundedCornerCube(length, width, thickness){

        hull()
        {
            translate([length/2 - 2, width/2 - 2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([length/2 - 2, -width/2 + 2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2 + 2, width/2 - 2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
            translate([-length/2 + 2, -width/2 + 2, 0]) cylinder(r=2, h=thickness, $fn=50, center=true);
        }

}

// Hollow cube with rounded corners. Will look like a frame with rounded con
// hollowRoundedCornerCube(50,70,4,2);
module hollowRoundedCornerCube(length, width, thickness, wallthickness)
{
    difference()
    {
        roundedCornerCube(length,width,thickness);
        roundedCornerCube(length -(wallthickness + 2),width-(wallthickness +2 ),thickness + .1);
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
        cylinder(h=height, r1=radius, r2=radius);
        translate([0,0,-.02]) cylinder(h=height + .04, r1=radius - wallThickness, r2=radius - wallThickness);
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

//
// b = bottom diameter
// t = top diameter
// h = height
module cone(b, t, h)
{
    cylinder(h=h, r1=b/2, r2=t/2, $fn=100);
}

// hollowCone(10,4,20, 2)
module hollowCone(bottomRadius, topRadius, height, wallThickness)
{
    difference()
    {
        cylinder(h=height, r1=bottomRadius, r2=topRadius, $fn=100);
        translate([0,0,-.02]) cylinder(h=height, r1=bottomRadius - wallThickness, r2=topRadius - wallThickness, $fn=100);
    }
}


// w = width between flat surface
// h = height
module hex (w=10, h=2){
  cylinder (r=w/2, h=h, center=true, $fn=6);
}

// hollowCone(10,4,20, 2)
module hollowHex(w=10, h=2, th=2)
{
    difference()
    {
        cylinder (r=w/2, h=h, center=true, $fn=6);
        cylinder (r=w/2 - th, h=h, center=true, $fn=6);
    }
}

// h : height
// ns : number of sides for base
// br : bottom radius
// tr : top radius
// ro : rotation in degree between bottom and top
// sl : slice layer. high value give smooth appearence
module twistExtrude(h=50,ns=6,br=20,tr=20,ro=100,sl=5)
{

	linear_extrude(height = h, twist  = ro,	slices = sl, scale  = tr/br)
		circle(r=br, $fn=ns);
}


// h : height
// ns : number of sides for base
// br : bottom radius
// tr : top radius
// ro : rotation in degree between bottom and top
// sl : slice layer. high value give smooth appearence
// wt : wall thickness
module hollowTwistExtrude(h=50,ns=6,br=20,tr=20,ro=100,sl=5,wt=1)
{
	difference()
	{
		linear_extrude(height = h, twist  = ro,	slices = sl, scale  = tr/br)
			circle(r=br, $fn=ns);

    translate([0,0,-.01])
		linear_extrude(height = h + .1, twist  = ro,	slices = sl, scale  = tr/br)
			circle(r=br - wt, $fn=ns);
	}
}


///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// honeycomb tiles
// honeycombSquare(100,100,4,10,2);
module honeycombTiles(length, width,thickness,rad,wallThickness)
{
    //thickness = 4;
    //rad = 10;
    //wallThickness = 2;
    //length = 100;
    //width = 100;

    for (w=[0: width/rad])
    {

        if (w % 2 == 0)
        {
            //cylinder($fn=6, r=rad, h=2);
            for (i = [0 : length/((rad*2) + (wallThickness*2))])
            {
              translate([rad*(3*i) + (wallThickness*2)*i,w*rad,0]) cylinder($fn=6, r=rad, h=thickness);

              //translate([rad*6 + (wallThickness*2)*2,0,0]) cylinder($fn=6, r=10, h=2);
              //translate([rad*9 + (wallThickness*2)*3,0,0]) cylinder($fn=6, r=10, h=2);
            }
        }

        if (w % 2 == 1)
        {
            for (j = [1 : 2 : (length/(rad + wallThickness))])
            {
              translate([(rad*1.5) *j + wallThickness *j , (w*rad) + wallThickness/2 ,0])  cylinder($fn=6, r=rad, h=thickness);
                //translate([(rad*1.5) *3 + wallThickness *3 ,10,0]) circle($fn=6, r=10);
                //translate([(rad*1.5) *5 + wallThickness *5 ,10,0]) circle($fn=6, r=10);
            }
        }
    }
}

// honeycomb square
// A square area with hollow honeycomb design
// honeycombSquare(100,100,4,10,2);
module honeycombSquare(length, width, thickness, cellRad,wallThickness)
{
    difference()
    {
        cube([length,width,thickness], center=true);
        translate([-length/2,-width/2, -thickness/2]) honeycombTiles(length,width,thickness,cellRad,wallThickness);
    }
}

//honeycomb(length, width, height, cell_size, wall_thickness);
//honeycomb(50, 50, 4, 10, 1);
//hollowRoundedCornerCube(50,70,4,2);

//hollowCylinder(10,20,2);

//hollowCylinders(20, 10, 2, 2, 2);
//cone(10,2,20);

// hollowCone(10,4,20, 2);

// honeycombSquare(40,40,2,5,2);


module edgeClamp(l=10)
{
   difference()
   {
    translate([0,.6,0]) rotate([45,0,0]) cube([l,2,2], center=true);
    translate([0,.6,1.5]) cube([l + .1,1,1], center=true);
    translate([0,.6,-1.5]) cube([l + .1,1,1], center=true);
   }
   cube([l,2,2], center=true);
}

cube([10,2,2], center=true);
translate([0,0,2]) edgeClamp();
