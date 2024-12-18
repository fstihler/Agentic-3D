
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
    // Main body of the mug – wider at the base and slightly tapered at the top
    difference() {
        // Outer cylinder for the mug
        cylinder(h = 80, r1 = 35, r2 = 30, center = true);
        // Hollow out the inside of the mug
        translate([0, 0, 1])
            cylinder(h = 80, r1 = 32, r2 = 27, center = true);
    }

    // Thick, beveled rim to delineate the opening of the mug
    translate([0, 0, 80]) {
        difference() {
            cylinder(h = 5, r = 36, center = true);
            translate([0, 0, 1])
                cylinder(h = 5, r = 34, center = true);
        }
    }

    // Handle of the mug
    translate([35, 0, 40]) {
        rotate([90, 0, 0])
        difference() {
            // Create a wider ergonomic handle
            scale([1, 1.8, 1])
            rotate_extrude(angle = 180)
                translate([10, 0])
                    circle(r = 12);
                
            // Subtract to hollow out the handle
            translate([-4, 0, -2])
                scale([1, 1.5, 1])
                rotate_extrude(angle = 180)
                translate([10, 0])
                    circle(r = 13);
        }
    }

    // Adding horizontal texture detail to the body of the mug
    for (i = [0 : 5]) {
        rotate([0, 0, i * 10])
        translate([0, 0, 15 + i * 10])
        cylinder(h = 3, r1 = 27, r2 = 27, center = true);
    }
}
    