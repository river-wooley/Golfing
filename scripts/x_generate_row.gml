/// generate_row(start, y)
// Procedurally generates a single row of land.
// @return The ending position of the fairway/green

startpos = argument0;
ypos = argument1;
b_firstrow = (ypos == 0);

// Generate first green/fairway
if (b_firstrow) {
    instance_create(startpos, ypos, o_the_green);
} else {
    instance_create(startpos, ypos, o_fairway);
}

// Generate remaining fairway
enum dir {left, right};
land_dir = irandom_range(0, 1);
max_fairway = irandom_range(1, (room_width / GRID_SQUARE_SIZE) - 1);
fairway_count =  0;
currentpos = startpos;

while (currentpos < room_width && currentpos > 0 && fairway_count < max_fairway) {
    // Account for the first pass
    if (place_free(currentpos, ypos)) {
        instance_create(currentpos, ypos, o_fairway);
        fairway_count++;   
    } 

    if (land_dir == dir.left) {
        currentpos -= GRID_SQUARE_SIZE;
    } else {
        currentpos += GRID_SQUARE_SIZE;
    }
}

// Generate all remaining spaces with either grass or sand
enum land {grass, sand};
for (var i = 0; i < room_width; i += GRID_SQUARE_SIZE) {
    if (!place_meeting(i, ypos, o_the_green) && !place_meeting(i, ypos, o_fairway)) {
        random_land = irandom_range(0, 1);
        if (random_land == land.grass) {
            instance_create(i, ypos, o_rough);
        } else {
            instance_create(i, ypos, o_bunker);
        }
    }
}

return currentpos;
