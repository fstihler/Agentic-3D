
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
    // Chair Seat
    difference() {
        cube([50, 50, 5], center=true);
        translate([-2.5, -2.5, -1])
            cylinder(3, 10, 10, center=true);
        translate([-22.5, -22.5, -5])
            cylinder(2, 10, 10, center=true);
        translate([22.5, -22.5, -5])
            cylinder(2, 10, 10, center=true);
        translate([-22.5, 22.5, -5])
            cylinder(2, 10, 10, center=true);
        translate([22.5, 22.5, -5])
            cylinder(2, 10, 10, center=true);
    }
    
    // Chair Legs
    translate([-22.5, -22.5, -5]) cylinder(2, 15, 15, center=true);
    translate([22.5, -22.5, -5]) cylinder(2, 15, 15, center=true);
    translate([-22.5, 22.5, -5]) cylinder(2, 15, 15, center=true);
    translate([22.5, 22.5, -5]) cylinder(2, 15, 15, center=true);
    
    // Chair Back
    translate([0, -25, 5]) {
        cube([50, 5, 40], center=true);
    }
}
    