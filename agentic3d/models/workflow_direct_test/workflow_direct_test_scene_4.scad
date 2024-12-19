
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
    // Curved Chair Seat
    difference() {
        hull() {
            translate([-35, -30, 0]) circle(r=35);
            translate([35, -30, 0]) circle(r=35);
            translate([-35, 30, 0]) circle(r=35);
            translate([35, 30, 0]) circle(r=35);
        }
        translate([0, 0, -5]) cube([70, 60, 10], center=true);
    }
    
    // Taller Chair Backrest for Lumbar Support
    translate([0, -50, 10])
        rotate([-10, 0, 0])
        scale([1, 1.5, 1])
        hull() {
            translate([-35, 0, 0]) circle(r=35);
            translate([35, 0, 0]) circle(r=35);
        }

    // Curved Armrests
    translate([-40, 0, 10]) {
        rotate([0, 0, -30])
        hull() {
            translate([-10, 0, 0]) circle(r=10);
            translate([0, -15, 0]) circle(r=10);
            translate([-30, 0, 0]) circle(r=10);
        }
    }
    
    translate([40, 0, 10]) {
        rotate([0, 0, 30])
        hull() {
            translate([-10, 0, 0]) circle(r=10);
            translate([0, -15, 0]) circle(r=10);
            translate([-30, 0, 0]) circle(r=10);
        }
    }

    // Tapered Legs for a Sleek Look
    for (x = [-30, 30]) {
        for (y = [-25, 25]) {
            translate([x, y, -20]) {
                linear_extrude(height=25) {
                    polygon(points=[[0, 0], [5, -15], [3, -15], [8, 0]]);
                }
            }
        }
    }
    
    // Optional Cushioning
    translate([0, 0, 5]) {
        color("gray") {
            difference() {
                hull() {
                    translate([-30, -25, 0]) circle(r=30);
                    translate([30, -25, 0]) circle(r=30);
                    translate([-30, 25, 0]) circle(r=30);
                    translate([30, 25, 0]) circle(r=30);
                }
                translate([0, 0, -2]) cube([70, 60, 5], center=true);
            }
        }
    }
}
    