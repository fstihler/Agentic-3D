
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
        cylinder(h=110, r1=40, r2=30, center=true);
        // Inner hollow space for fluid containment with 3 mm wall thickness
        translate([0, 0, 2])
            cylinder(h=108, r=27, center=true);
    }

    // Handle of the mug
    translate([40, 0, 40])
        rotate([90, 0, 0])
            difference() {
                // Outer part of handle
                scale([1, 1, 0.5])
                    cylinder(h=20, r=10, center=true);
                
                // Inner cutout of handle
                translate([-6, 0, -10])
                    scale([1, 1, 0.5])
                        cylinder(h=40, r=7, center=true);
            }

    // Rounded base for stability
    translate([0, 0, -3])
        cylinder(h=5, r=35, center=true);

    // Flared rim for comfort
    translate([0, 0, 110])
        cylinder(h=5, r=43, center=true);
    translate([0, 0, 105])
        cylinder(h=5, r=32, center=true);
    
    // Texturing for grip (optional pattern)
    for (i = [-1:1:1]) {
        translate([0, i * 1.5, 0])
            linear_extrude(height=110)
                offset(r=0.5)
                    polygon(points=[[25,-3], [25,3], [26,3], [26,-3]]);
    }
}
    