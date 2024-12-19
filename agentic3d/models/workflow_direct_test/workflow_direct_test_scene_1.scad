
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
    }
    
    // Chair Backrest
    translate([0, -25, 5])
        cube([50, 5, 30], center=true);
    
    // Chair Armrests
    translate([-25, 0, 10])
        rotate([0, 0, 20])
        cube([30, 5, 10], center=true);
    translate([25, 0, 10])
        rotate([0, 0, -20])
        cube([30, 5, 10], center=true);
    
    // Chair Legs
    for (x = [-20, 20]) {
        for (y = [-20, 20]) {
            translate([x, y, -10])
                cylinder(r=3, h=15, center=true);
        }
    }
}
    