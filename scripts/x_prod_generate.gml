/// prod_generate()
// Creates a path of fairway from a green

maxpos = (room_width / GRID_SQUARE_SIZE) - 1;
startingpos = irandom_range(0, maxpos) * GRID_SQUARE_SIZE;

max_y = room_height / GRID_SQUARE_SIZE;
for(var i = 1; i < max_y; i+= GRID_SQUARE_SIZE) {
    x_generate_row(startingpos, i);
}

