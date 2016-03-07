
draindia = 85;
holedia = 8;

drainrad = draindia/2;
module singlestrip()
{

    cube([draindia, holedia, 1],center = true);

    for (i = [0 : holedia : drainrad])
    {

        if (( i + (holedia/2) < drainrad) && i !=0 && i !=holedia)
        {
            translate([i,0,0]) cylinder(10 , d=holedia-3 , $fn = 50);
        }
    }
    
    for (i = [0 : -holedia : -drainrad])
    {
        if (( i - (holedia/2) > -drainrad) && i !=0 && i != -holedia)
        {
            translate([i,0,0]) cylinder(10 , d=holedia -3 , $fn = 50);
        }
    }
  
   translate([-drainrad + 1,0,2]) cube ([holedia,holedia,10],center = true);
   translate([drainrad - 1,0,2]) cube ([holedia,holedia,10],center = true);

}

module multistrips()
{
    for (j = [0 : 30 : 180])
    {
        rotate([0 , 0 ,j]) singlestrip();
    }
}

//translate ([0,0,0]) multistrips();

module sinkstrainer()
{
    difference()
    {
        rotate_extrude($fn=200) 
        polygon( points = [[0,0], [drainrad,0], [drainrad,4] , [1,4], [2,6] , [2,10],[0,10]] );
        translate ([0,0,-1]) multistrips();
    }
}

sinkstrainer();