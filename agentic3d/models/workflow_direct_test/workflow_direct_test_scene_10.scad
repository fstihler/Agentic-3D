
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
    // Cushioned and Contoured Seat
    difference() {
        translate([0, 0, 0]) 
            linear_extrude(height=5) 
                polygon(points=[[-40, 25], [40, 25], [30, -20], [-30, -20]]);
        translate([0, 0, -1]) 
            cube([80, 50, 8], center=true);
    }

    // Ergonomic Backrest with Curves
    translate([0, -35, 5])
        rotate([-20, 0, 0])
        linear_extrude(height=18) 
            polygon(points=[[-30, 0], [30, 0], [20, -50], [-20, -50]]);
    
    // Stylized Armrests
    for (x = [-35, 35]) {
        translate([x, -15, 10]) {
            rotate([0, 0, x > 0 ? 20 : -20])
                linear_extrude(height=10) 
                    offset(r=2) 
                    polygon(points=[[3, 0], [30, -10], [30, -6], [3, 0]]);
        }
    }

    // Tapered and Splayed Legs
    for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i * 25, j * 22, -22]) {
                rotate([0, 0, 0])
                    linear_extrude(height=30) 
                        polygon(points=[[0, 0], [-5, -15], [5, -15]]);
            }
        }
    }

    // Cross Support Structure
    translate([0, 0, -22]) {
        linear_extrude(height=4) 
            polygon(points=[[-30, 16], [30, 16], [30, 12], [-30, 12]]);
        rotate([0, 90, 0]) 
            linear_extrude(height=4) 
                polygon(points=[[-16, 30], [16, 30], [16, 26], [-16, 26]]);
    }

    // Seat Detail with Textural Indent
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 2]) 
                linear_extrude(height=4) 
                    polygon(points=[[-30, 18], [30, 18], [30, -18], [-30, -18]]);
            translate([0, 0, -1]) 
                cube([60, 36, 10], center=true);
        }
    }
}
    