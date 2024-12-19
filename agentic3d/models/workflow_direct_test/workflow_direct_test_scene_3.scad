
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
        cube([70, 60, 5], center=true);
    }
    
    // Chair Backrest
    translate([0, -30, 5])
        rotate([-5, 0, 0])
        cube([70, 5, 40], center=true);
    
    // Revised Armrests
    translate([-40, 0, 10])
        rotate([0, 0, 10])
        scale([1, 0.5, 1])
        cube([40, 7, 15], center=true);
    translate([40, 0, 10])
        rotate([0, 0, -10])
        scale([1, 0.5, 1])
        cube([40, 7, 15], center=true);
    
    // Stylish Chair Legs
    for (x = [-25, 25]) {
        for (y = [-25, 25]) {
            translate([x, y, -10])
                linear_extrude(height=20) {
                    polygon(points=[[0, 0], [6, -15], [4, -15], [10, 0]]);
                }
        }
    }
    
    // Detailing on the seat
    translate([0, 0, 5]) {
        for (i = [-20, -10, 0, 10, 20]) {
            translate([0, i, 0])
                cube([60, 2, 1], center=true);
        }
    }
}
    