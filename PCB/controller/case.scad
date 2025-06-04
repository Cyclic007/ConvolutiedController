/* [Rendering options] */
// Show placeholder PCB in OpenSCAD preview
show_pcb = false;
// Lid mounting method
lid_model = "cap"; // [cap, inner-fit]
// Conditional rendering
render = "lid"; // [all, case, lid]


/* [Dimensions] */
// Height of the PCB mounting stand-offs between the bottom of the case and the PCB
standoff_height = 5;
// PCB thickness
pcb_thickness = 1.6;
// Bottom layer thickness
floor_height = 1.2;
// Case wall thickness
wall_thickness = 1.2;
// Space between the top of the PCB and the top of the case
headroom = 0;

/* [Hidden] */
$fa=$preview ? 10 : 4;
$fs=0.2;
inner_height = floor_height + standoff_height + pcb_thickness + headroom;

module wall (thickness, height) {
    linear_extrude(height, convexity=10) {
        difference() {
            offset(r=thickness)
                children();
            children();
        }
    }
}

module bottom(thickness, height) {
    linear_extrude(height, convexity=3) {
        offset(r=thickness)
            children();
    }
}

module lid(thickness, height, edge) {
    linear_extrude(height, convexity=10) {
        offset(r=thickness)
            children();
    }
    translate([0,0,-edge])
    difference() {
        linear_extrude(edge, convexity=10) {
                offset(r=-0.2)
                children();
        }
        translate([0,0, -0.5])
         linear_extrude(edge+1, convexity=10) {
                offset(r=-1.2)
                children();
        }
    }
}


module box(wall_thick, bottom_layers, height) {
    if (render == "all" || render == "case") {
        translate([0,0, bottom_layers])
            wall(wall_thick, height) children();
        bottom(wall_thick, bottom_layers) children();
    }
    
    if (render == "all" || render == "lid") {
        translate([0, 0, height+bottom_layers+0.1])
        lid(wall_thick, bottom_layers, lid_model == "inner-fit" ? headroom-2.5: bottom_layers) 
            children();
    }
}

module mount(drill, space, height) {
    translate([0,0,height/2])
        difference() {
            cylinder(h=height, r=(space/2), center=true);
            cylinder(h=(height*2), r=(drill/2), center=true);
            
            translate([0, 0, height/2+0.01])
                children();
        }
        
}

module connector(min_x, min_y, max_x, max_y, height) {
    size_x = max_x - min_x;
    size_y = max_y - min_y;
    translate([(min_x + max_x)/2, (min_y + max_y)/2, height/2])
        cube([size_x, size_y, height], center=true);
}

module pcb() {
    thickness = 1.6;

    color("#009900")
    difference() {
        linear_extrude(thickness) {
            polygon(points = [[47,59.75], [150.5,59.75], [150.5,129.75], [47,129.75]]);
        }
    }
}

module case_outline() {
    polygon(points = [[43.4,127.35], [55.652237,151.373338], [55.91124000000001,151.84878], [56.19554,152.30958], [56.50434,152.75428], [56.83684,153.18168], [57.19194,153.59038], [57.56864,153.97928000000002], [57.96584,154.34728], [58.38234,154.69318], [58.81694,155.01598], [59.268440000000005,155.31488000000002], [59.735440000000004,155.58888000000002], [60.21654,155.83718000000002], [60.710440000000006,156.05908], [61.215540000000004,156.25398], [61.730540000000005,156.42118], [62.253840000000004,156.56028], [62.783840000000005,156.67088], [63.31904,156.75258], [63.857940000000006,156.80528], [64.39884,156.82868000000002], [64.94024,156.82278], [65.48054,156.78758], [66.01814,156.72318], [66.55144,156.62978], [67.07894,156.50768], [67.59904,156.35718], [68.11024,156.17878000000002], [68.61104,155.97298], [69.09994,155.74028], [69.57554,155.48158], [70.03644,155.19748], [70.48124,154.88878], [70.90874000000001,154.55658], [90.737959,138.264684], [91.15599,137.93936000000002], [91.59079,137.63656], [92.04089,137.35726], [92.50519,137.10226], [92.98239,136.87216], [93.47109,136.66756], [93.96989,136.48926], [94.47739,136.33756000000002], [94.99229,136.21296], [95.51309,136.11576000000002], [96.03829,136.04636000000002], [96.56639,136.00476], [97.09599,135.99126], [97.62549,136.00586], [98.15359000000001,136.04836], [98.67859,136.11886], [99.19919,136.21706], [99.71379,136.34266000000002], [100.22109,136.49536], [100.71959,136.67466000000002], [101.20779,136.88016000000002], [101.68459,137.11126000000002], [102.14839,137.36716], [102.59799,137.64736000000002], [103.03209,137.95096], [103.44949,138.27716], [103.849109,138.624916], [121.073413,154.438265], [121.47093000000001,154.78432], [121.88613000000001,155.10902000000002], [122.31783,155.41132000000002], [122.76483,155.69052], [123.22593,155.94572], [123.69993000000001,156.17632], [124.18533000000001,156.38162], [124.68083,156.56102], [125.18523,156.71412], [125.69683,156.84042], [126.21453000000001,156.93952000000002], [126.73663,157.01132], [127.26183,157.05542], [127.78863,157.07182], [128.31553,157.06042], [128.84113,157.02132], [129.36393,156.95452], [129.88253,156.86032], [130.39533,156.73892], [130.90113,156.59072], [131.39833000000002,156.41602], [131.88573,156.21532000000002], [132.36183,155.98932000000002], [132.82533,155.73852], [133.27503000000002,155.46362], [133.70963,155.16542], [134.12783000000002,154.84472], [134.52863,154.50242], [134.91083,154.13952], [135.27343,153.75702], [135.61523,153.35592], [135.93553,152.93732], [136.23333,152.50242], [152.5,127.35], [152.5,60.8], [152.43845,60.017849999999996], [152.2553,59.2549], [151.95505,58.530049999999996], [151.5451,57.86105], [151.03555,57.26445], [150.43895,56.7549], [149.76995,56.34495], [149.0451,56.0447], [148.28215,55.861549999999994], [147.5,55.8], [48.4,55.8], [47.61785,55.861549999999994], [46.8549,56.0447], [46.13005,56.34495], [45.46105,56.7549], [44.86445,57.26445], [44.3549,57.86105], [43.94495,58.530049999999996], [43.6447,59.2549], [43.46155,60.017849999999996], [43.4,60.8], [43.4,127.35]]);
}

rotate([render == "lid" ? 180 : 0, 0, 0])
scale([1, -1, 1])
translate([-97.95, -106.43591, 0]) {
    pcb_top = floor_height + standoff_height + pcb_thickness;

    difference() {
        box(wall_thickness, floor_height, inner_height) {
            case_outline();
        }

    translate([143.4, 81.5, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([134.5, 74.5, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([60.15, 115, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([69.1, 122, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([134.55, 88.5, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([125.65, 81.5, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([69, 108, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([77.9, 115, inner_height])
        cylinder(floor_height+2, 1.75, 1.75);
    translate([57.960897, 79.3, inner_height])
        cylinder(floor_height+2, 8.139103144695977, 8.139103144695977);
    translate([97.85, 60.5125, inner_height+floor_height])
        cube([11.100000000000009, 9.824999999999996, floor_height + 2], center=true);
    translate([124.710897, 118, inner_height])
        cylinder(floor_height+2, 8.13910314469599, 8.13910314469599);
    }

    if (show_pcb && $preview) {
        translate([0, 0, floor_height + standoff_height])
            pcb();
    }

    if (render == "all" || render == "case") {
    }
}
