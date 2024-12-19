
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
    // Cushioned Seat
    difference() {
        translate([0, 0, 0]) 
            linear_extrude(height=4) 
                polygon(points=[[-35, 25], [35, 25], [35, -25], [-35, -25]]);
        translate([0, 0, -1]) 
            cube([70, 50, 5], center=true);
    }

    // Ergonomic Backrest
    translate([0, -30, 4])
        rotate([-20, 0, 0])
        linear_extrude(height=15) 
            polygon(points=[[-30, 0], [30, 0], [25, -40], [-25, -40]]);

    // Stylish Armrests
    for (x = [-30, 30]) {
        translate([x, -10, 5]) {
            rotate([0, 0, x > 0 ? 15 : -15])
                linear_extrude(height=6) 
                    polygon(points=[[4, 0], [28, -10], [28, -5], [4, 0]]);
        }
    }

    // Tapered Legs
    for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i * 25, j * 20, -20]) {
                rotate([0, 0, 0])
                    linear_extrude(height=30) 
                        polygon(points=[[0, 0], [4, -10], [4, -3], [8, 0]]);
            }
        }
    }

    // Cross Support Structure
    translate([0, 0, -20]) {
        linear_extrude(height=3) 
            polygon(points=[[-30, 18], [30, 18], [30, 14], [-30, 14]]);
        rotate([0, 90, 0]) 
            linear_extrude(height=3) 
                polygon(points=[[-18, 30], [18, 30], [18, 26], [-18, 26]]);
    }

    // Seat Detail
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 1]) 
                linear_extrude(height=3) 
                    polygon(points=[[-30, 15], [30, 15], [30, -15], [-30, -15]]);
            translate([0, 0, -1]) 
                cube([60, 30, 8], center=true);
        }
    }
}
    