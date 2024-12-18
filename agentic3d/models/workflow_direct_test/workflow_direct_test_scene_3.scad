
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
    // Main body of the mug with a slight taper
    difference() {
        // Create the outer body with a taper towards the base
        linear_extrude(height = 60) 
            polygon(points=[[40,0], [30,60], [-30,60], [-40,0], [-30,-60], [30,-60]]);
        // Hollow out the inside of the mug
        translate([0, 0, 1])
            linear_extrude(height = 62) 
                polygon(points=[[38,0], [28,58], [-28,58], [-38,0], [-28,-58], [28,-58]]);
    }

    // Adding a distinct rim to the mug
    translate([0, 0, 60]) {
        linear_extrude(height = 2) 
            polygon(points=[[40,0], [38,0], [38,-2], [40,-2]]);
    }

    // Handle of the mug
    translate([40, 0, 30]) {
        rotate([90, 0, 0])
        difference() {
            // Create a handle with a rounded shape
            scale([1, 1.5, 1])
            rotate_extrude(angle = 180)
            translate([10, 0])
                circle(r = 8);
                
            // Subtract inner handle to hollow it out
            translate([-2, 0, -2])
                scale([1, 1.3, 1])
                rotate_extrude(angle = 180)
                translate([10, 0])
                    circle(r = 8.5);
        }
    }

    // Rounded base for stability
    translate([0, 0, -4]) {
        rotate_extrude(angle = 360)
            translate([20, 0])
                circle(r = 2);
    }
}
    