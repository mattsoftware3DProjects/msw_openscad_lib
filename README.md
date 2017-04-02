## Helper

**module msw_repeat(points);**
* points = an array of points to repeat the children of the module with

~~~
use <./msw_openscad_lib/msw_helper.scad>
points = [[5,5], [5,10], [20,10], [20,5]];
msw_repeat(points) riser(8);
~~~

**module msw_riser (height, inner=2, outer=0);**
* height = the height of the riser
* inner = the size of the inside hole
* outer = the size of the outside of the riser, if outer == 0 then it will be calculated as twice the inner size


## Cube

**module msw_cube(dim, rounded = 2, mask = [1,1,1,1,1,1,1,1], center=false, quality="fine", flat_top=false, $fn = 60);**
* dim = the dimentions of the cube
* rounded = the size of the sphere to use for rounding the corners
* mask = which corners to apply the sphere to
* center = if the cube is centered or not
* quality = the quality of the cube. Use "fine" for rendering a smooth cornered cube, or anything else for a square cornered cube.
* flat_top = the top of the cube will be flattened
* $fn = the standard OpenSCAD variable rendering the roundered corners

~~~
use <./msw_openscad_lib/msw_cube.scad>
msw_cube([10,20,30]);
~~~

