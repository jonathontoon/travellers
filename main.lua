--[[
    main
]]--

function _init()
	make_dots()
end

function _update60()
	if origin_dot == nil and destination_dot == nil then
		select_dots() 
	else
		update_dots()
	end
end

function _draw()
	cls(color.black)
	draw_dots()
end