
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
    cylinder(h = 60, r = 30); // Main body
translate([0, 0, 60]) {
    scale([1, 1, 0.5])
        cylinder(h = 20, r = 25); // Tapered shoulder
}
translate([0, 0, 80]) {
    scale([1, 1, 0.8])
        cylinder(h = 15, r = 15); // Tapered neck
}
translate([0, 0, 95]) {
    difference() {
        cylinder(h = 7, r = 10); // Cap body
        translate([0, 0, -1])
            cylinder(h = 9, r = 9); // Indentation for cap
    }
}
translate([0, 0, 80]) {
    for (i = [0 : 5]) {
        rotate(i * 60) {
            translate([0, 15, 0]) {
                cube([1, 0.5, 5]); // Texture or branding on neck
            }
        }
    }
}
translate([0, 0, 30]) {
    for (i = [0 : 5]) {
        rotate(i * 60) {
            translate([0, 28, 0]) {
                cube([1.5, 0.5, 7]); // Labeling detail on body
            }
        }
    }
}
    