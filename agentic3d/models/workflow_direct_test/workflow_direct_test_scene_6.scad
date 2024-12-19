
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
    translate([0, 0, 0]) {
    // Seat
    difference() {
        translate([0, 0, 0]) 
            linear_extrude(height=10) 
                polygon(points=[[40, 20], [-40, 20], [-45, -30], [45, -30]]);
        translate([0, 0, -5]) 
            cube([90, 60, 10], center=true);
    }

    // Curved Backrest with Contours
    translate([0, -40, 10])
        rotate([-10, 0, 0])
        linear_extrude(height=10) 
            polygon(points=[[38, 0], [-38, 0], [-30, -25], [30, -25]]);

    // Rounded Armrests
    for (x = [-40, 40]) {
        translate([x, 0, 10]) {
            rotate([0, 0, x > 0 ? 10 : -10])
                linear_extrude(height=10) 
                    polygon(points=[[5, 0], [30, -10], [30, -5], [5, 0]]);
        }
    }

    // Tapered Legs
    for (x = [-25, 25]) {
        for (y = [-20, 20]) {
            translate([x, y, -20]) {
                linear_extrude(height=30) {
                    polygon(points=[[0, 0], [4, -8], [2, -8], [8, 0]]);
                }
            }
        }
    }

    // Cross Support for Stability
    translate([0, 0, -20]) {
        rotate([0, 0, 0]) {
            linear_extrude(height=5) 
                polygon(points=[[-30, 15], [30, 15], [30, 5], [-30, 5]]);
            rotate([0, 90, 0]) 
                linear_extrude(height=5) 
                    polygon(points=[[-15, 30], [15, 30], [15, 20], [-15, 20]]);
        }
    }

    // Under-Seat Cutout Design
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 1]) 
                linear_extrude(height=9) 
                    polygon(points=[[-18, 5], [-18, -5], [18, -5], [18, 5]]);
            translate([0, 0, -1]) 
                cube([36, 12, 10], center=true);
        }
    }
}
    