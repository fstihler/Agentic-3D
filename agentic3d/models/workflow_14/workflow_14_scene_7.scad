
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
        cylinder(h = 20, r1 = 20, r2 = 20); // Enhanced rounded shoulder for smooth transition
}
translate([0, 0, 70]) {
    cylinder(h = 25, r = 15); // Consistent neck with a uniform diameter
}
translate([0, 0, 95]) {
    cylinder(h = 5, r = 15); // Flat base for stability
}
translate([0, 0, 95]) {
    difference() {
        cylinder(h = 10, r = 12); // Cap body with flat profile
        translate([0, 0, -1]) 
            cylinder(h = 11, r = 11); // Indentation for cap
    }
}
translate([0, 0, 85]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 5, 0]) {
                cube([1, 0.2, 4]); // Uniform ribbed texture along the neck
            }
        }
    }
}
translate([0, 0, 40]) {
    difference() {
        cube([20, 0.5, 8]); // Labeling area with distinct flat surface
        translate([0, 0.05, 0]) 
            cube([20, 0.4, 8]); // Indentation for label
    }
}
    