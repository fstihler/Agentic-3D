
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
    cylinder(h = 70, r = 25); // Main body
translate([0, 0, 70]) {
    cylinder(h = 10, r = 20); // Shoulder
}
translate([0, 0, 80]) {
    cylinder(h = 20, r = 12); // Neck
}
translate([0, 0, 100]) {
    cylinder(h = 5, r = 8); // Cap
}
translate([0, 0, 85]) {
    for (i = [0 : 5]) {
        rotate(i * 30) {
            translate([0, 12, 0]) {
                cube([2, 0.5, 3]); // Grooves on neck
            }
        }
    }
}
translate([0, 0, 10]) {
    for (i = [0 : 5]) {
        rotate(i * 30) {
            translate([0, 25, 0]) {
                cube([1, 0.5, 5]); // Texture or branding on body
            }
        }
    }
}
    