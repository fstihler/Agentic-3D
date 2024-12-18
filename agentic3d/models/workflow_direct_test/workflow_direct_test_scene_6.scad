
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
    // Main body of the mug with a wider base and tapered top
    difference() {
        // Create outer cylinder for the mug
        cylinder(h = 80, r1 = 30, r2 = 25, center = true);
        // Hollow out the inside of the mug
        translate([0, 0, 1])
            cylinder(h = 80, r1 = 27, r2 = 22, center = true);
    }

    // Thick rim to delineate the opening of the mug
    translate([0, 0, 80]) {
        cylinder(h = 6, r = 31, center = true);
    }

    // Handle of the mug
    translate([25, 0, 40]) {
        rotate([90, 0, 0])
        difference() {
            // Create a wider ergonomic handle
            scale([1, 1.5, 1])
            rotate_extrude(angle = 180)
                translate([12, 0])
                    circle(r = 10);
                
            // Subtract to hollow out the handle
            translate([-2, 0, -2])
                scale([1, 1.3, 1])
                rotate_extrude(angle = 180)
                translate([12, 0])
                    circle(r = 11);
        }
    }

    // Adding texture detail to the body of the mug
    for (i = [0 : 4]) {
        rotate([0, 0, i * 15])
        translate([0, 0, i * 16])
        cylinder(h = 6, r1 = 22, r2 = 22, center = true);
    }
}
    