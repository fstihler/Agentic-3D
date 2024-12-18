
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
    // Outer mug body with a wider top and tapered bottom for aesthetics
    difference() {
        // Outer shape with a flared rim, wider at the top
        cylinder(h=100, r1=40, r2=30, center=true);
        // Inner hollow space for fluid containment with uniform wall thickness
        translate([0, 0, 2])
            cylinder(h=98, r=28, center=true);
    }

    // Handle of the mug
    translate([35, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=15, r=10, center=true);
                
                // Inner cutout of handle
                translate([-6, -6, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=7, center=true);
            }

    // Rounded base for stability
    translate([0, 0, -3])
        cylinder(h=3, r=32, center=true);

    // Fillet the top rim for comfort
    translate([0, 0, 100])
        cylinder(h=4, r=40, center=true);
    translate([0, 0, 100])
        cylinder(h=4, r=30, center=true);
}
    