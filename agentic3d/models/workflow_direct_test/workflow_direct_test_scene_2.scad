
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
        // Create the outer body with a slightly wider lip
        cylinder(h = 60, r = 40, center = true);
        // Hollow out the inside of the mug
        translate([0, 0, -1])
        cylinder(h = 62, r = 38, center = true);
    }

    // Adding a rim to the mug
    translate([0, 0, 30]) {
        cylinder(h = 2, r = 40, center = false);
    }

    // Handle of the mug
    translate([40, 0, 15]) {
        rotate([90, 0, 0])
        difference() {
            // Create a handle that has a slight curve
            scale([1, 1.5, 1])
            rotate([0, 0, 0])
            cylinder(h = 20, r = 8, center = true);
            
            translate([-2, 0, -2])
            scale([1, 1.3, 1])
            cylinder(h = 24, r = 8.5, center = true);
        }
    }
}
    