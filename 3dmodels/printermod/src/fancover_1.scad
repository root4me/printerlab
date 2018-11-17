use <../../lib/utils.scad>

union()
{
    translate([-79,4,-3])
        hollowRoundedCornerCube(48,48,14,4);

    translate([-79,4,2]) color("Green")
        hollowRoundedCornerCube(44,44,4,4);

    import("../stl/L_print_fan_funnel.stl");
}