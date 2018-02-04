
// use <./msw_openscad_lib/msw_cube.scad>
// msw_cube([10,20,30]);

module msw_cube(dim, rounded = 1, mask = [1,1,1,1,1,1,1,1], center=false, quality="fine", flat_top=false, $fn = 60) {
    offsetx = center ? -dim[0]/2 : 0;
    offsety = center ? -dim[1]/2 : 0;
    offsetz = center ? -dim[2]/2 : 0;
    if (quality != "fine") {
        cube(dim, center=true);
    } else {
        d = dim;
        r = rounded;
        difference() {
            hull() {
                translate([offsetx+r,offsety+r,offsetz+r]) if (mask[0]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+r,offsety+d[1]-r,offsetz+r]) if (mask[1]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+d[0]-r,offsety+r,offsetz+r]) if (mask[4]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+d[0]-r,offsety+d[1]-r,offsetz+r]) if (mask[5]) sphere(r=r); else cube(r*2, center=true);

                extra = flat_top ? rounded : 0;
                translate([offsetx+r,offsety+d[1]-r,offsetz+d[2]-r+extra]) if (mask[2]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+r,offsety+r,offsetz+d[2]-r+extra]) if (mask[3]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+d[0]-r,offsety+d[1]-r,offsetz+d[2]-r+extra]) if (mask[6]) sphere(r=r); else cube(r*2, center=true);
                translate([offsetx+d[0]-r,offsety+r,offsetz+d[2]-r+extra]) if (mask[7]) sphere(r=r); else cube(r*2, center=true);
            }
            union() {
                translate([offsetx-r*2,offsety-r*2,offsetz-r*2]) cube([dim[0]+r*4, dim[1]+r*4, r*2], center=false);
                translate([offsetx-r*2,offsety-r*2,dim[2]]) cube([dim[0]+r*4, dim[1]+r*4, r*2], center=false);
                translate([offsetx-r*2,offsety-r*2,offsetz-r*2]) cube([dim[0]+r*4, r*2, dim[2]+r*4], center=false);
                translate([offsetx-r*2,dim[1],offsetz-r*2]) cube([dim[0]+r*4, r*2, dim[2]+r*4], center=false);
                translate([offsetx-r*2,offsety-r*2,offsetz-r*2]) cube([r*2, dim[1]+r*4, dim[2]+r*4], center=false);
                translate([dim[0],offsety-r*2,offsetz-r*2]) cube([r*2, dim[1]+r*4, dim[2]+r*4], center=false);
            }
        }
    }
}

