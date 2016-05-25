use <utils.scad>

// hole - hole outer 48 mm . Platform should be atleast this
platformInnerLength = 48;
platformInnerWidth = 48;

// Area
platformOuterLength = 54;
platformIOuterWidth = 52;


receiverLength = 52;
receiverWidth = 34.5;
thickness = 2;
endStopLength = 10;

threadDia = 3; //this should be atleast 2.5 mm



module base()
{

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

difference()
{
    cube([platformOuterLength,platformIOuterWidth,thickness], center=true);
    pokeHoles();
}