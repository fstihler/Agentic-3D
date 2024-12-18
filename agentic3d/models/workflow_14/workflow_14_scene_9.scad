
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
    cylinder(h = 50, r = 20); // Main body of the bottle

translate([0, 0, 50]) {
    // Gradual neck transition
    for (i = [0 : 5]) {
        cylinder(h = 5, r = 20 - i * 1, center = false);
        translate([0, 0, 5]) {}
    }
}

translate([0, 0, 80]) {
    cylinder(h = 5, r = 25); // Wide flat base for stability
}

// Cap design
translate([0, 0, 85]) {
    difference() {
        cylinder(h = 10, r = 12); // Cap body
        translate([0, 0, -1])
            cylinder(h = 11, r = 10); // Indentation for cap
    }
}

// Textured neck detail
translate([0, 0, 70]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 7, 0]) {
                cube([1, 0.2, 5]); // Ribbed texture along the neck
            }
        }
    }
}

// Label area
translate([0, 0, 35]) {
    difference() {
        cube([22, 0.5, 5]); // Label area
        translate([0, 0.05, 0]) 
            cube([22, 0.4, 5]); // Indentation for label
    }
}

// Indentations for detailing
translate([0, 0, 20]) {
    for (i = [0 : 12]) {
        rotate(i * 30) {
            translate([0, 10, 0]) {
                cylinder(h = 2, r = 1, center = true); // Indentations for detailing
            }
        }
    }
}
    