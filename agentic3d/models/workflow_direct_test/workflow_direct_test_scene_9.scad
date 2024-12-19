
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
            linear_extrude(height=5) 
                polygon(points=[[-40, 25], [40, 25], [40, -25], [-40, -25]]);
        translate([0, 0, -1]) 
            cube([80, 50, 8], center=true);
    }

    // Ergonomic Backrest
    translate([0, -35, 5])
        rotate([-15, 0, 0])
        linear_extrude(height=18) 
            polygon(points=[[-35, 0], [35, 0], [25, -45], [-25, -45]]);

    // Stylish Armrests
    for (x = [-35, 35]) {
        translate([x, -15, 7]) {
            rotate([0, 0, x > 0 ? 20 : -20])
                linear_extrude(height=8) 
                    polygon(points=[[3, 0], [30, -12], [30, -6], [3, 0]]);
        }
    }

    // Tapered Legs
    for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i * 25, j * 22, -22]) {
                rotate([0, 0, 0])
                    linear_extrude(height=35) 
                        polygon(points=[[0, 0], [-5, -15], [5, -15]]);
            }
        }
    }

    // Cross Support Structure
    translate([0, 0, -22]) {
        linear_extrude(height=4) 
            polygon(points=[[-32, 18], [32, 18], [32, 14], [-32, 14]]);
        rotate([0, 90, 0]) 
            linear_extrude(height=4) 
                polygon(points=[[-18, 32], [18, 32], [18, 28], [-18, 28]]);
    }

    // Seat Detail
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 1]) 
                linear_extrude(height=4) 
                    polygon(points=[[-32, 20], [32, 20], [32, -20], [-32, -20]]);
            translate([0, 0, -1]) 
                cube([64, 40, 10], center=true);
        }
    }
}
    