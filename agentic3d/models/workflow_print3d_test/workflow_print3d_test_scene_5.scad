
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
    // Outer mug body with a flared rim and tapered shape for aesthetics
    difference() {
        // Outer shape with a larger top diameter and tapered bottom
        cylinder(h=80, r1=40, r2=32, center=true);
        // Inner hollow space for fluid containment
        translate([0, 0, 2])
            cylinder(h=78, r=28, center=true);
    }
    
    // Handle of the mug
    translate([40, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    rotate([0, 90, 0]) 
                    cylinder(h=15, r=10, center=true);
                
                // Inner cutout of handle
                translate([-6, -6, -7])
                    scale([1, 1, 0.5])
                        rotate([0, 90, 0]) 
                        cylinder(h=20, r=8, center=true);
            }

    // Slightly rounded base for stability
    translate([0, 0, -5])
        cylinder(h=5, r=34, center=true);

    // Fillet the top rim for comfort
    translate([0, 0, 80])
        cylinder(h=4, r=40, center=true);
    translate([0, 0, 80])
        cylinder(h=4, r=32, center=true);
}
    