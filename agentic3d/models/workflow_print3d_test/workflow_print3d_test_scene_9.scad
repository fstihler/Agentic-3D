
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
    // Main mug body
    difference() {
        // Outer shape with a wider top and narrower bottom
        cylinder(h=100, r1=45, r2=35, center=true); // Slightly wider at the top
        // Inner hollow space for fluid containment with 3 mm wall thickness
        translate([0, 0, 2])
            cylinder(h=98, r=32, center=true); // 3 mm wall thickness
    }

    // Handle of the mug
    translate([45, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=20, r=12, center=true); // Slightly larger handle
                // Inner cutout of handle
                translate([-6, 0, -10])
                    scale([1, 1, 0.5])
                        cylinder(h=40, r=8, center=true); // Maintain wall thickness
            }

    // Rounded base for stability
    translate([0, 0, -2])
        sphere(r=35); // Use sphere to create a rounded base

    // Flared rim for comfort
    translate([0, 0, 100])
        cylinder(h=5, r1=47, r2=35, center=true); // Flare the rim
    
    // Texturing for grip
    for (i = [0:8]) {
        // Create vertical grooves for grip
        rotate(i * 45)
            translate([25, 0, 0])
                linear_extrude(height=100)
                    offset(r=0.5)
                        polygon(points=[[0, -3], [0, 3], [1, 3], [1, -3]]);
    }
}
    