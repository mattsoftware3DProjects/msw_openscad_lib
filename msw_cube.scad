
// use <./msw_openscad_lib/msw_cube.scad>
// msw_cube([10,20,30]);

module msw_cube(dim, rounded = 2, mask = [1,1,1,1,1,1,1,1], center=false, quality="fine", $fn = 60) {
    offsetx = center ? -dim[0]/2 : 0;
    offsety = center ? -dim[1]/2 : 0;
    offsetz = center ? -dim[2]/2 : 0;
    if (quality != "fine") {
        cube(dim, center=true);
    } else {
        d = dim;
        r = rounded;
        hull() {
            translate([offsetx+r,offsety+r,offsetz+r]) if (mask[0]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+r,offsety+d[1]-r,offsetz+r]) if (mask[1]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+r,offsety+d[1]-r,offsetz+d[2]-r]) if (mask[2]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+r,offsety+r,offsetz+d[2]-r]) if (mask[3]) sphere(r=r); else cube(r*2, center=true);

            translate([offsetx+d[0]-r,offsety+r,offsetz+r]) if (mask[4]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+d[0]-r,offsety+d[1]-r,offsetz+r]) if (mask[5]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+d[0]-r,offsety+d[1]-r,offsetz+d[2]-r]) if (mask[6]) sphere(r=r); else cube(r*2, center=true);
            translate([offsetx+d[0]-r,offsety+r,offsetz+d[2]-r]) if (mask[7]) sphere(r=r); else cube(r*2, center=true);
        }
    }
}

