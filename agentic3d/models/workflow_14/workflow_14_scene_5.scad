
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
    cylinder(h = 50, r = 25); // Main body
translate([0, 0, 50]) {
    scale([1, 1, 0.5]) 
        cylinder(h = 25, r1 = 25, r2 = 15); // Tapered shoulder
}
translate([0, 0, 75]) {
    cylinder(h = 20, r1 = 15, r2 = 8); // Tapered neck
}
translate([0, 0, 95]) {
    difference() {
        cylinder(h = 10, r = 10); // Cap body
        translate([0, 0, -1]) 
            cylinder(h = 11, r = 9); // Indentation for cap
    }
}
translate([0, 0, 80]) {
    for (i = [0 : 11]) {
        rotate(i * 30) {
            translate([0, 7, 0]) {
                cube([1, 0.4, 5]); // Ribbed texture on neck
            }
        }
    }
}
translate([0, 0, 30]) {
    for (i = [0 : 5]) {
        rotate(i * 60) {
            translate([0, 23, 0]) {
                cube([1.5, 0.5, 7]); // Labeling detail on body
            }
        }
    }
}
    