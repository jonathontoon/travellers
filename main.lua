--[[
    main
]]--

function _init()
	make_dots()
	mv_from, mv_to = get_open_dot() 
end

--function _update60()
--	mvng_dt=get_open_dot()
--end

function _draw()
	cls(0)
	--draw_dots()
	print(to_string(mv_from))
	print(to_string(mv_to))
end