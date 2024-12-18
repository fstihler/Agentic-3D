
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
    // Outer mug body with wider top
    difference() {
        // Main mug shape
        cylinder(h=80, r1=32, r2=36, center=true); // Flaring top
        // Inner hollow space for the mug
        translate([0, 0, 1])
            cylinder(h=78, r=30, center=true); // Inner cylinder for fluid containment
    }
    
    // Handle of the mug
    translate([38, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=10, r=9.5, center=true);

                // Inner cutout of handle
                translate([-6, -6, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=8, center=true);
            }
    
    // Slightly round the base for stability
    translate([0, 0, -5])
        cylinder(h=5, r=35, center=true);
}
    