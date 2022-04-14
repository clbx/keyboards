//Switch Board
$fn = 16;

//Lenth/Size of one switch
switch_size = 14;

//The amount of material around the swtich
switch_border = 2.5;

//The total size of each switch on the plate
switch_outside_size = switch_size + switch_border;

//How tall the plate is
switch_plate_height = 5;

//Number of switches in the X direction
num_switch_x = 4;

//Number of switches in the Y direction
num_switch_y = 4;

//Height of the switchboard
switchboard_x = num_switch_x * switch_outside_size;
switchboard_y = num_switch_y * switch_outside_size;

//Buffer Space - Distance between switchplate and PCB in Y direction
bufferspace = 3.0;



//Switch Plate
translate([0,0,switch_plate_height/2]){
    for(i = [1:num_switch_x]){
        for(j = [1:num_switch_y]){
            translate([i*switch_outside_size-switch_outside_size/2,j*switch_outside_size-switch_outside_size/2,0]){
                difference(){
                    //Switch Dimension
                    cube([switch_outside_size,switch_outside_size,5],center=true);
                    cube([switch_size,switch_size,12], center=true);
                }
            }
        }
    }
}


//Protoype Board

//Board Width (X)
board_x = 70;

//Board Height (Y)
board_y = 50;

//Board Width (Z)
board_z = 1.5;

//Standoff Radius
board_standoff_rad = 1;

//Standoff Distance
board_standoff_distance = 3;

//Y Board Offset
board_offset_y = num_switch_y * switch_outside_size + bufferspace;


//Prototyping Board Preview
translate([0, board_offset_y, switch_plate_height - board_z ]){
    if($preview){
        difference(){
            color("#008800") cube([board_x,board_y,board_z]);
            union(){
                for(i = [board_standoff_distance,board_x - board_standoff_distance]){
                    for(j = [board_standoff_distance,board_y - board_standoff_distance]){
                        translate([i,j,0]){
                            cylinder(board_standoff_distance,board_standoff_rad,center=true);
                        }
                    }
                }
            }
        }
    }
}

//Board Plate Thickness
board_plate_thickness = 2;



//Board Plate
translate([0, board_offset_y-bufferspace, 0 ]){
    //Board Plate
    color("#550000") cube([board_x,board_y+bufferspace,board_plate_thickness]);
    
    //Board Stems
    for(i = [bufferspace+board_standoff_distance,bufferspace+board_y-board_standoff_distance]){
        for(j = [board_standoff_distance,board_x-board_standoff_distance]){
            stem_height = switch_plate_height;
            translate([j,i,0]){
                cylinder(stem_height,r = board_standoff_rad-0.2);
            }
        }
    }
    
}








