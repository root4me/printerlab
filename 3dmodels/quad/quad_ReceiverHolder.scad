use <utils.scad>

// hole - hole outer 48 mm . Platform should be atleast this
platformInnerLength = 48;
platformInnerWidth = 48;

// Area
platformOuterLength = 56;
platformIOuterWidth = 52;


receiverLength = 52;
receiverWidth = 34.5;
receiverThickness = 15.5;
thickness = 2;
endStopLength = 10;

threadDia = 4; //this should be atleast 2.5 mm

module receiver()
{
   translate([0,0,receiverThickness/2 + thickness/2]) color([0,1,0]) cube([receiverLength,receiverWidth,receiverThickness], center=true);
}

module base()
{
    difference()
    {
        cube([platformOuterLength,platformIOuterWidth,thickness], center=true);
        pokeHoles();
    }

}

module edgeStop()
{
    cube([endStopLength,thickness,thickness]);
    rotate([0,0,90]) cube([endStopLength,thickness,thickness]);
}


 //translate([0,-thickness,0]) edgeStop();
module pokeHoles()
{
    translate([platformInnerLength/2 - threadDia/2, platformInnerWidth/2 - threadDia/2, 0]) cylinder(r=threadDia/2, h=thickness*2, $fn=50, center=true);
    translate([platformInnerLength/2 - threadDia/2, -platformInnerWidth/2 + threadDia/2, 0]) cylinder(r=threadDia/2, h=thickness*2, $fn=50, center=true);
    translate([-platformInnerLength/2 + threadDia/2, platformInnerWidth/2- threadDia/2, 0]) cylinder(r=threadDia/2, h=thickness*2, $fn=50, center=true);
    translate([-platformInnerLength/2 + threadDia/2, -platformInnerWidth/2 + threadDia/2, 0]) cylinder(r=threadDia/2, h=thickness*2, $fn=50, center=true);
}

module sideFastner()
{
    // Side pillars
     translate([0, - receiverWidth / 2 - thickness/2  , receiverThickness/2 + thickness/2 ]) rotate([90,90,0]) cube([receiverThickness,thickness,thickness], center=true);
     translate([0, receiverWidth / 2 + thickness/2 , receiverThickness/2 + thickness/2]) rotate([90,90,0]) cube([receiverThickness,thickness,thickness], center=true);

    // Side pillar base    
    translate([0, -receiverWidth / 2 - thickness/2 , 1]) cube([receiverThickness/2,thickness,thickness], center=true);
    translate([0, receiverWidth / 2 + thickness/2 , 1]) cube([receiverThickness/2,thickness,thickness], center=true);
    
    // Side pillar end stops
    translate([0, -receiverWidth / 2 - thickness/2 , receiverThickness + thickness + .8]) rotate([90,0,90]) cylinder(r=threadDia/2, h=thickness, $fn=50, center=true);
    translate([0, receiverWidth / 2 + thickness/2 , receiverThickness + thickness + .8]) rotate([90,0,90]) cylinder(r=threadDia/2, h=thickness, $fn=50, center=true);
}

module edgeFastner()
{
    translate([-receiverLength/2 , -receiverWidth/2 - thickness,.5]) edgeStop();
    translate([receiverLength/2 + thickness, -receiverWidth/2 ,.5]) rotate([0,0,90]) edgeStop();
    translate([-receiverLength/2, receiverWidth/2 + thickness,2.5])  rotate([180,0,0]) edgeStop();
    translate([receiverLength/2, receiverWidth/2 + thickness,.5])  rotate([0,0,180]) edgeStop();
}

//receiver();
// rotate([0,0,90]) cube([receiverWidth ,thickness,thickness *2], center=true);



    difference()
    {
        base();
        cube([receiverWidth ,thickness,thickness *2], center=true);
        translate([0, 10 , 0]) cube([receiverWidth ,thickness,thickness *2], center=true);
        translate([0, - 10 , 0]) cube([receiverWidth ,thickness,thickness *2], center=true);
        translate([0, 22.5 , 0]) cube([receiverWidth ,thickness,thickness *2], center=true);        
        translate([0, - 22.5 , 0]) cube([receiverWidth ,thickness,thickness *2], center=true);
    }
    
sideFastner();
edgeFastner();

