// Under board 
cube([13,30,3]);

// Arm
translate([0,30,0]){
  color([0,1,0]) cube([76,4,3]);  
}

// Vertical
translate([40,30,3]){
    color([1,0,0]) cube ([36,4,22.5]);
}

//OLED Holder
translate([40,25,25]){
  rotate([-45,0,0]){
      //OLED  
      //color([0,0,1]) cube([38,3,11.8]);
      
        
      //Back
      translate([0,3,-2]) color([0,1,0]) cube([36,3,16]);
      //Top
      translate([0,-1,12]) color([1,0,0]) cube([36,4,2]);   
      //Bottom
      translate([0,-1,-2]) color([1,0,0]) cube([36,4,2]);
  } 
}