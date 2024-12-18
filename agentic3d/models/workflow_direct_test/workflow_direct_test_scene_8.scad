
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
        cylinder(h = 85, r = 37, center = true);
        // Hollow interior of the mug
        translate([0, 0, 2])
            cylinder(h = 83, r = 34, center = true);
    }
    
    // Defining the rim with an overhang
    translate([0, 0, 85]) {
        difference() {
            cylinder(h = 5, r = 38, center = true);
            translate([0, 0, 1])
                cylinder(h = 3, r = 35, center = true);
        }
    }
    
    // Handle of the mug
    translate([37, 0, 40]) {
        rotate([90, 0, 0])
        difference() {
            // Comfortable, rounded handle
            scale([1, 1.2, 1])
            rotate_extrude(angle = 180)
                translate([10, 0])
                    circle(r = 10);
                
            // Hollowing out the handle
            translate([-3, 0, -1])
                scale([1, 1.2, 1])
                rotate_extrude(angle = 180)
                translate([10, 0])
                    circle(r = 11);
        }
    }
    
    // Adding vertical texture detail to the body of the mug
    for (i = [0 : 8]) {
        rotate([0, 0, i * 10])
        translate([0, 0, 10 + i * 8])
        cylinder(h = 4, r = 34, center = true);
    }
}
    