function add_points(a, b)
    = [a[0] + b[0], a[1] + b[1], a[2] + b[2]];

module screw_hole(size, length, depth = 2, top = 0) {
    translate([0, 0, -depth])
    cylinder(h = depth, r = size);
    
    cone_height = size / 2;
    
    translate([0, 0, -depth - cone_height])
    cylinder(h = cone_height, d1 = size, r2 = size);
    
    translate([0, 0, -depth - cone_height - length])
    cylinder(h = length, d = size);
    
    if (top > 0) {
        cylinder(h = top, r = size);
    }
}

module triangular_prism(a, b, c, depth) {
    a2 = add_points(a, depth);
    b2 = add_points(b, depth);
    c2 = add_points(c, depth);
    points = [a, b, c, a2, b2, c2];
    faces = [
        [0, 2, 1],
        [3, 4, 5],
        [0,1,4,3],
        [1,2,5,4],
        [0,3,5,2]
    ];
    polyhedron(points, faces);
}

module quater_cylinder(h, r) {
    intersection() {
        cylinder(h = h, r = r);
        cube([r, r, h]);
    }
}

module quater_cylinder_inverted(h, r) {
    difference() {
        cube([r, r, h]);
        cylinder(h = h, r = r);
    }
}