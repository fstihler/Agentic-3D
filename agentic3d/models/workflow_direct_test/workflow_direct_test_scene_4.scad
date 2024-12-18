
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
    // Main body of the mug as a cylinder
    difference() {
        // Create outer cylinder for the mug
        cylinder(h = 60, r = 20, center = true);
        // Hollow out the inside of the mug
        translate([0, 0, 1])
            cylinder(h = 60, r = 18, center = true);
    }

    // Thicker rim to delineate the opening of the mug
    translate([0, 0, 60]) {
        cylinder(h = 3, r = 22, center = true);
    }

    // Handle of the mug
    translate([20, 0, 30]) {
        rotate([90, 0, 0])
        difference() {
            // Create a curved handle
            scale([1, 1.5, 1])
            rotate_extrude(angle = 180)
                translate([8, 0])
                    circle(r = 6);
                
            // Subtract to hollow out the handle
            translate([-2, 0, -2])
                scale([1, 1.3, 1])
                rotate_extrude(angle = 180)
                translate([8, 0])
                    circle(r = 7);
        }
    }
}
    