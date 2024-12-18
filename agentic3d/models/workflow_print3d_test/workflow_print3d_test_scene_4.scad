
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
    // Outer mug body with a flared rim
    difference() {
        cylinder(h=80, r1=36, r2=32, center=true); // Flaring top for aesthetics
        translate([0, 0, 1])
            cylinder(h=78, r=29, center=true); // Inner hollow space for fluid containment
    }
    
    // Handle of the mug
    translate([36, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=15, r=12, center=true);

                // Inner cutout of handle
                translate([-6, -6, -7])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=9, center=true);
            }
    
    // Slightly round the base for stability
    translate([0, 0, -5])
        cylinder(h=5, r=33, center=true);
}
    