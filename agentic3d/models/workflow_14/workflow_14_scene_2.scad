
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
    cylinder(h = 80, r = 20); 
translate([0, 0, 80]) {
    scale([1, 1, 0.5]) {
        cylinder(h = 20, r = 15);
    }
}
translate([0, 0, 100]) {
    cylinder(h = 3, r = 5); 
}
translate([0, 0, 10]) {
    for (i = [0 : 5]) {
        rotate(i * 30) {
            translate([0, 20, 0]) {
                cube([2, 0.5, 5]);
            }
        }
    }
}
    