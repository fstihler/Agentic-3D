
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
    cylinder(h=80, r=35, center=true); // Outer cylinder
    
    // Inner hollow space for the mug
    translate([0, 0, 2])
        cylinder(h=76, r=32, center=true); // Inner cylinder for fluid containment, maintaining uniform wall thickness

    // Handle of the mug
    translate([35, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=10, r=10, center=true); 

                // Inner cutout of handle
                translate([-5, -5, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=10, center=true);
            }
    
    // Slightly round the base for stability
    translate([0, 0, -5])
        cylinder(h=5, r=35, center=true);
}
    