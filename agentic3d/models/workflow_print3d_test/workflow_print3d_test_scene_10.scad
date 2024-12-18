
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
        cylinder(h=120, r1=45, r2=35, center=true);
        // Inner hollow space for fluid containment with 3 mm wall thickness
        translate([0, 0, 3])
            cylinder(h=114, r=32, center=true);
    }

    // Handle of the mug
    translate([45, 0, 60])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                translate([-10, 0, 0])
                    scale([1, 1, 0.5])
                        cylinder(h=30, r=12, center=true);
                // Inner cutout of handle
                translate([-6, 0, -5])
                    scale([1, 1, 0.5])
                        cylinder(h=40, r=8, center=true);
            }

    // Rounded base for stability
    translate([0, 0, -2])
        cylinder(h=2, r=35);

    // Flared rim for comfort
    translate([0, 0, 120])
        cylinder(h=5, r1=48, r2=35, center=true);
    
    // Texturing for grip
    for (i = [0:8]) {
        rotate(i * 45)
            translate([25, 0, 0])
                linear_extrude(height=120)
                    offset(r=0.5)
                        polygon(points=[[0, -2], [0, 2], [1, 2], [1, -2]]);
    }
}
    