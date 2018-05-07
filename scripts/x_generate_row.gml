/// generate_row(start, y)
// Procedurally generates a single row of land.
// @return The ending position of the fairway/green

startpos = argument[0];
ypos = argument[1];
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
max_fairway = irandom_range(0, (room_width / GRID_SQUARE_SIZE) - 2);
fairway_count =  0;
currentpos = startpos;
lastpos = currentpos;

while (currentpos < room_width && currentpos >= 0 && fairway_count < max_fairway) {
    // Account for the first pass
    if (!position_meeting(currentpos + 1, ypos, all) || !position_meeting(currentpos - 1, ypos, all)) {
        instance_create(currentpos, ypos, o_fairway);
        fairway_count++;   
    }

    if (land_dir == dir.left) {
        lastpos = currentpos;
        currentpos -= GRID_SQUARE_SIZE;
    } else {
        lastpos = currentpos;
        currentpos += GRID_SQUARE_SIZE;
    }
}

// Generate all remaining spaces with either grass or sand
for (i = 0; i < room_width; i += GRID_SQUARE_SIZE) {
    if (!position_meeting(i + 1, ypos, all)) {
        random_land = irandom_range(1, 3);
        if (random_land <= 2) {
            instance_create(i, ypos, o_rough);
        } else {
            instance_create(i, ypos, o_bunker);
        }
    }
}

return lastpos;
