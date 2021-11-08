--[[
    dots
]]--

function make_dot(r, c, clr)
    local x = c * (radius + spacing) + margin
    local y = r * (radius + spacing) + margin
    local clr = clr or dot_colors[flr(rnd(#dot_colors)) + 1]
    return { row = r, column = c, x = x, y = y, dx = 0, dy = 0, rad = radius, clr = clr, moving = false }
end

function make_dots()
	for row = 0, length - 1, 1 do
		dots[row] = {}
		for column = 0, length - 1, 1 do
            local active = flr(rnd(2))
            if active == 0 then
                dots[row][column] = make_dot(row, column, color.black)
            else
                dots[row][column] = make_dot(row, column)
            end
		end 
	end
end

function open_neighbors(row, column)
	local neighbors = {}
	
	local row_start = max(row - 1, 0)
	local row_finish = min(row + 1, length - 1)
	local column_start = max(column - 1, 0)
	local column_finish = min(column + 1, length - 1)

	for current_row = row_start, row_finish, 1 do
		for current_column = column_start, column_finish, 1 do
			if dots[current_row][current_column].clr == color.black then
				add(neighbors, dots[current_row][current_column])
			end
		end
	end

	return neighbors
end

function find_open_dots()
	local open_dots = {}
	
	for row = 0, length - 1, 1 do
		for column = 0, length - 1, 1 do
			
			local neighbors = open_neighbors(row, column)
			local picked_neighbor = neighbors[flr(rnd(#neighbors)) + 1]

            if dots[row][column].clr != color.black and picked_neighbor != nil then
				add(open_dots, { origin = dots[row][column], destination = picked_neighbor })
			end
			
		end 
	end
	
	return open_dots
end

function select_dots()
	local open_dots_pair = find_open_dots()
	local selected_pair = open_dots_pair[flr(rnd(#open_dots_pair)) + 1]
    
    if selected_pair.origin == last_dot then
        selected_pair = open_dots_pair[flr(rnd(#open_dots_pair)) + 1]
    end

    origin_dot = selected_pair.origin
    destination_dot = selected_pair.destination

    dots[origin_dot.row][origin_dot.column].moving = true
    dots[origin_dot.row][origin_dot.column].dx = destination_dot.x
    dots[origin_dot.row][origin_dot.column].dy = destination_dot.y
end

function update_dots()
    for row = 0, length - 1, 1 do
		for column = 0, length - 1, 1 do
            if dots[row][column].moving then
                if dots[row][column].x < dots[row][column].dx then
                    dots[row][column].x += 2
                elseif dots[row][column].x > dots[row][column].dx then
                    dots[row][column].x -= 2
                end

                if dots[row][column].y < dots[row][column].dy then
                    dots[row][column].y += 2
                elseif dots[row][column].y > dots[row][column].dy then
                    dots[row][column].y -= 2
                end

                if dots[row][column].x == dots[row][column].dx
                and dots[row][column].y == dots[row][column].dy then
                    dots[row][column].moving = false
                    dots[row][column].dx = 0
                    dots[row][column].dy = 0

                    dots[destination_dot.row][destination_dot.column] = make_dot(destination_dot.row, destination_dot.column, dots[row][column].clr)
                    dots[row][column] = make_dot(row, column, color.black)
                    
                    last_dot = dots[destination_dot.row][destination_dot.column]

                    origin_dot = nil
                    destination_dot = nil
                end
            end
		end 
	end
end

function drawable_dots()
    local drawable_dots = {}
    for row = 0, length - 1, 1 do
		for column = 0, length - 1, 1 do
            if dots[row][column].clr != color.black then
                add(drawable_dots, dots[row][column])
            end
		end 
	end

    return drawable_dots
end

function draw_dots()
	for dot in all(drawable_dots()) do
        circfill(dot.x, dot.y, dot.rad, dot.clr)
        circ(dot.x, dot.y, dot.rad, color.black)
	end
end