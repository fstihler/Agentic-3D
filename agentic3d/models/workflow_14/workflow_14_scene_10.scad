
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
    cylinder(h = 70, r = 15); // Main body of the bottle

translate([0, 0, 70]) {
    // Neck of the bottle
    cylinder(h = 15, r1 = 15, r2 = 10);
}

translate([0, 0, 85]) {
    // Cap design
    difference() {
        cylinder(h = 8, r = 10); // Cap body
        translate([0, 0, -1])
            cylinder(h = 9, r = 8); // Indentation for cap
    }
}

translate([0, 0, 5]) {
    // Base design for stability
    cylinder(h = 5, r = 18);
}

// Adding subtle embossing for visual interest
translate([0, 0, 35]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 12, 0]) {
                cylinder(h = 1, r = 1.5); // Embossed details
            }
        }
    }
}
    