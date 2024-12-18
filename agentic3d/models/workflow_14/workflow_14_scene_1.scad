
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
    cylinder(h = 60, r = 25); 
translate([0, 0, 60]) {
    scale([1, 1, 1.5]) {
        cylinder(h = 20, r = 15);
    }
}
translate([0, 0, 80]) {
    cylinder(h = 5, r = 3); 
}
    