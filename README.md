## Cube

module msw_cube(dim, rounded = 2, mask = [1,1,1,1,1,1,1,1], center=false, quality="fine", $fn = 60);
* dim = the dimentions of the cube
* rounded = the size of the sphere to use for rounding the corners
* mask = which corners to apply the sphere to
* center = if the cube is centered or not
* quality = the quality of the cube. Use "fine" for rendering a smooth cornered cube, or anything else for a square cornered cube.
* $fn = the standard OpenSCAD variable rendering the roundered corners

~~~
use <./msw_openscad_lib/msw_cube.scad>
msw_cube([10,20,30]);
~~~

