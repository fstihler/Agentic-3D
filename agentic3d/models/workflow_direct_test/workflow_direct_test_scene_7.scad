
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
                polygon(points=[[45, 25], [-45, 25], [-50, -35], [50, -35]]);
        translate([0, 0, -5]) 
            cube([100, 70, 10], center=true);
    }

    // Enhanced Backrest
    translate([0, -45, 10])
        rotate([-15, 0, 0])
        linear_extrude(height=15) 
            polygon(points=[[40, 0], [-40, 0], [-30, -35], [30, -35]]);

    // Curved Armrests
    for (x = [-40, 40]) {
        translate([x, 0, 10]) {
            rotate([0, 0, x > 0 ? 15 : -15])
                linear_extrude(height=10) 
                    polygon(points=[[5, 0], [35, -15], [35, -5], [5, 0]]);
        }
    }

    // Angled Legs
    for (i = [-1, 1]) {
        for (j = [-1, 1]) {
            translate([i * 20, j * 25, -20]) {
                rotate([0, 0, 45 * i])
                    linear_extrude(height=30) 
                        polygon(points=[[0, 0], [5, -10], [5, -5], [10, 0]]);
            }
        }
    }

    // Cross Support Structure
    translate([0, 0, -20]) {
        rotate([0, 0, 0]) {
            linear_extrude(height=5) 
                polygon(points=[[-35, 20], [35, 20], [35, 10], [-35, 10]]);
            rotate([0, 90, 0]) 
                linear_extrude(height=5) 
                    polygon(points=[[-20, 35], [20, 35], [20, 25], [-20, 25]]);
        }
    }

    // Cushioned Under-Seat Design
    translate([0, 0, 0]) {
        difference() {
            translate([0, 0, 1]) 
                linear_extrude(height=9) 
                    polygon(points=[[-20, 5], [-20, -5], [20, -5], [20, 5]]);
            translate([0, 0, -1]) 
                cube([40, 20, 10], center=true);
        }
    }
}
    