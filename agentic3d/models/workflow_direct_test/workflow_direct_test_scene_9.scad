
    // Combined Scene

    // Permanent Model
    
    // Permanent Model (Black)
    color([0, 0, 0]) {
        // Your permanent model code here
        cube([100,0.1,0.1], center = false);
        cube([0.1,100,0.1], center = false);
        cube([0.1,0.1,100], center = false);
    }
    

    // Dynamic Model
    translate([0, 0, 0]) {
    // Main body of the mug
    difference() {
        // Outer mug with a wider base and slightly tapered top
        cylinder(h = 85, r1 = 40, r2 = 32, center = true);
        // Hollow interior of the mug
        translate([0, 0, 2])
            cylinder(h = 83, r1 = 38, r2 = 30, center = true);
    }
    
    // Defining the rim with an overhang
    translate([0, 0, 85]) {
        difference() {
            cylinder(h = 5, r = 41, center = true);
            translate([0, 0, 1])
                cylinder(h = 3, r = 39, center = true);
        }
    }
    
    // Handle of the mug
    translate([40, 0, 40]) {
        rotate([90, 0, 0])
        difference() {
            // Comfortable, rounded handle
            scale([1, 1.2, 1])
            rotate_extrude(angle = 180)
                translate([15, 0])
                    circle(r = 12);
                
            // Hollowing out the handle
            translate([-4, 0, -1])
                scale([1, 1.2, 1])
                rotate_extrude(angle = 180)
                translate([15, 0])
                    circle(r = 13);
        }
    }
    
    // Adding texture detail to the body of the mug
    for (i = [0 : 8]) {
        rotate([0, 0, i * 10])
        translate([0, 0, 10 + i * 8])
        cylinder(h = 4, r = 38, center = true);
    }
}
    