
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
    cylinder(h = 50, r = 20); // Main body as a true cylinder

translate([0, 0, 50]) {
    scale([1.1, 1.1, 0.5])
        cylinder(h = 10, r1 = 20, r2 = 20); // Softer transition to neck
}

translate([0, 0, 60]) {
    cylinder(h = 20, r = 15); // Consistent neck with a uniform diameter
}

translate([0, 0, 80]) {
    cylinder(h = 5, r = 18); // Flat base for stability with wider radius
}

translate([0, 0, 80]) {
    difference() {
        cylinder(h = 10, r = 12); // Cap body with flat profile
        translate([0, 0, -1])
            cylinder(h = 11, r = 11); // Indentation for cap
    }
}

translate([0, 0, 75]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 5, 0]) {
                cube([1, 0.2, 5]); // Ribbed texture along the neck
            }
        }
    }
}

translate([0, 0, 35]) {
    difference() {
        cube([22, 0.5, 10]); // Labeling area with distinct flat surface
        translate([0, 0.05, 0]) 
            cube([22, 0.4, 10]); // Indentation for label
    }
}

// Adding subtle detailing - small indentations along the bottle
translate([0, 0, 20]) {
    for (i = [0 : 12]) {
        rotate(i * 30) {
            translate([0, 10, 0]) {
                cylinder(h = 2, r = 1, center = true); // Slight indentations for detailing
            }
        }
    }
}
    