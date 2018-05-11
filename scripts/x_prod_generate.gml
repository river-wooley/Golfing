/// prod_generate()
// Creates a path of fairway from a green

// Generate land
maxpos = (room_width / GRID_SQUARE_SIZE) - 1;
startingpos = irandom_range(0, maxpos) * GRID_SQUARE_SIZE;

for(var i = 0; i < room_height; i+= GRID_SQUARE_SIZE) {
    startingpos = x_generate_row(startingpos, i);
}

// Generate player in the center
instance_create(startingpos + (GRID_SQUARE_SIZE / 2), room_height - (GRID_SQUARE_SIZE / 2), o_ball);

