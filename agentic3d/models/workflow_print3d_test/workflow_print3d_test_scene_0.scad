
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
    difference() {
    // Main body of the mug
    cylinder(h=80, r=30, center=true);
    // Hollow out the inside of the mug
    translate([0, 0, 2])
        cylinder(h=76, r=28, center=true);
    
    // Handle of the mug
    translate([30, 0, 40])
        rotate([90, 0, 0])
            difference() {
                scale([1, 1, 0.5])
                    cylinder(h=10, r=10, center=true);
                translate([-5, -5, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=10, center=true);
            }
}
    