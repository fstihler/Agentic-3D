
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
        cube([60, 50, 5], center=true);
    }
    
    // Chair Backrest
    translate([0, -25, 5])
        rotate([5, 0, 0])
        cube([60, 5, 35], center=true);
    
    // Stylish Armrests
    translate([-30, 0, 10])
        rotate([0, 0, 30])
        scale([1, 0.5, 1])
        cube([30, 5, 10], center=true);
    translate([30, 0, 10])
        rotate([0, 0, -30])
        scale([1, 0.5, 1])
        cube([30, 5, 10], center=true);
    
    // Tapered Chair Legs
    for (x = [-20, 20]) {
        for (y = [-20, 20]) {
            translate([x, y, -10])
                linear_extrude(height=15) {
                    polygon(points=[[0, 0], [5, -10], [3, -10], [8, 0]]);
                }
        }
    }
}
    