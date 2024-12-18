
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
    // Main body of the mug with wider top and narrower base
    difference() {
        scale([1, 1, 0.8])
            cylinder(h=80, r=35, center=true); // Outer cylinder
        
        translate([0, 0, 2])
            scale([1, 1, 0.8])
                cylinder(h=76, r=30, center=true); // Inner cylinder for hollow space
    }
    
    // Handle of the mug
    translate([35, 0, 40])
        rotate([90, 0, 0])
            difference() {
                scale([1, 1, 0.5])
                    cylinder(h=10, r=10, center=true); // Outer part of handle
                
                translate([-5, -5, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=20, r=10, center=true); // Inner cutout of handle
            }
}
    