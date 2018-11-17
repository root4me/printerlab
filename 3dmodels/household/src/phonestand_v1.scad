// Simple phone stand

l = 50;
w = 38; // l x w will be the size of the base
h = 50;  
th = 4; // thickness of the bouding pillars
eb = true; // extend base to back to prevent tip over. Not required if phone is placed only on the side (watch videos etc.) on the stand

// base of the stand
module base()
{
    difference()
    {
        cube ([l, w, th]);
        translate([th,th,0]) cube ([l - (th*2), w - (th*2) ,th]);
    }
}

// vertical back of the stand
module backside()
{
    difference()
    {
        cube([l, th, h]);
        translate([th,0,th]) cube([l-(th*2),th,h - (th*2)]);

    }
    // give additional colum support in the back so that printer does not need to draw long bridge
    translate([(l/2) - (th/2),0,0]) cube ([th,th,h]);
}  


//end stop
module endstop()
{
    translate([0,w,0]) cube([l,th/2,th*2]);
}

module extendbase()
{
    if (eb)
    {
    translate([0,-w + th,0]) base();
    }
}

base();
backside();
endstop();
extendbase();
