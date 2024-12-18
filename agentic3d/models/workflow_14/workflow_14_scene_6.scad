
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
    cylinder(h = 50, r = 25); // Main body with slight curves
translate([0, 0, 50]) {
    scale([1.1, 1.1, 0.5]) 
        cylinder(h = 20, r1 = 25, r2 = 20); // Rounded shoulder
}
translate([0, 0, 70]) {
    scale([1, 1, 1.5]) 
        cylinder(h = 30, r1 = 20, r2 = 10); // Taller, more conical neck
}
translate([0, 0, 100]) {
    difference() {
        cylinder(h = 10, r = 12); // Cap body with pronounced lip
        translate([0, 0, -1]) 
            cylinder(h = 11, r = 11); // Indentation for cap
    }
}
translate([0, 0, 90]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 6, 0]) {
                cube([1, 0.3, 4]); // Ribbed texture on neck
            }
        }
    }
}
translate([0, 0, 40]) {
    difference() {
        cube([20, 0.5, 8]); // Labeling area
        translate([0, 0.05, 0]) 
            cube([20, 0.4, 8]); // Indentation for label
    }
}
    