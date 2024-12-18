
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
    translate([0, 0, 0]) {
    difference() {
        // Main body of the mug with a wider lip
        difference() {
            cylinder(h = 80, r = 35, center = true);
            translate([0, 0, -1])
            cylinder(h = 82, r = 33, center = true);
        }
        
        // Adding interior details to signify depth
        translate([0, 0, -5])
        cylinder(h = 10, r = 30, center = true);
    }

    // Handle of the mug
    translate([35, 0, 20]) {
        rotate([90, 0, 0])
        difference() {
            scale([1, 1.5, 1])
            cylinder(h = 15, r = 7, center = true);
            
            scale([1, 1.3, 1])
            translate([0, 0, -1]) 
            cylinder(h = 17, r = 7.5, center = true);
        }
    }
}
    