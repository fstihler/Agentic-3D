
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
    // Chair Seat with Contour
    difference() {
        translate([0, 0, 0]) 
            linear_extrude(height=10) 
                polygon(points=[[35, 30], [-35, 30], [-40, -30], [40, -30]]);
        translate([0, 0, -5]) 
            cube([70, 60, 10], center=true);
    }

    // Ergonomic Backrest
    translate([0, -40, 10])
        rotate([-15, 0, 0])
        linear_extrude(height=10) 
            polygon(points=[[35, 0], [-35, 0], [-30, -30], [30, -30]]);

    // Armrests
    for (x = [-40, 40]) {
        translate([x, 0, 10]) {
            rotate([0, 0, x > 0 ? 15 : -15])
                linear_extrude(height=10) 
                    polygon(points=[[15, 0], [35, -10], [35, -5], [15, 0]]);
        }
    }

    // Sturdy Legs
    for (x = [-30, 30]) {
        for (y = [-25, 25]) {
            translate([x, y, -20]) {
                linear_extrude(height=25) {
                    polygon(points=[[0, 0], [8, -12], [4, -12], [12, 0]]);
                }
            }
        }
    }

    // Unique Cutout Design on Seat
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 1]) 
                linear_extrude(height=9) 
                    polygon(points=[[-15, 8], [-15, -8], [15, -8], [15, 8]]);
            translate([0, 0, -1]) 
                cube([30, 16, 10], center=true);
        }
    }
}
    