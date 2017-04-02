
// use <./msw_openscad_lib/msw_helper.scad>
// msw_repeat([[5,5], [5,10], [10,10], [10,5]]) riser(8, 2);
// msw_riser(height=8, inner=2, outer=4);

module msw_repeat(points) {
    for (p = points) {
        translate(p) children();
    }
}

module msw_riser (height, inner=2, outer=0) {
    outer_d = outer == 0 ? inner * 2 : outer;
    difference() {
        cylinder(h=height, d=outer_d, $fn = 60);
        translate([0,0,-0.01]) cylinder(h=height+0.02, d=inner, $fn = 60);
    }
}

