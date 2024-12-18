
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
    translate([0, 0, 10]) {
    difference() {
        // Main body of the mug
        cylinder(h = 80, r = 30, center = true);
        
        // Hollow part of the mug
        translate([0, 0, -1]) 
        cylinder(h = 82, r = 28, center = true);
    }
    
    // Handle of the mug
    translate([30, 0, 40]) {
        rotate([90, 0, 0])
        difference() {
            scale([1, 1.5, 1])
            cylinder(h = 10, r = 6, center = true);
            
            scale([1, 1.3, 1])
            translate([0, 0, -1]) 
            cylinder(h = 12, r = 6.5, center = true);
        }
    }
}
    