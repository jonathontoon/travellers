--[[
    main
]]--

function _init()
	make_dots()
end

function _update60()
	if origin_dot == nil and destination_dot == nil then
		select_dots() 
	end
	update_dots()
end

function _draw()
	cls(color.dark_blue)
	draw_dots()
end