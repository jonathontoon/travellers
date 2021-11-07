--[[
    dots
]]--

function make_dots()
	for r=0,len-1,1 do
		dts[r]={}
		for c=0,len-1,1 do
			dts[r][c]=
				clrs[flr(rnd(2))+1]
		end 
	end
end

function open_neighbors(r,c,len)
	local nghbrs={}
	
	local rstrt=max(r-1,0)
	local rfnsh=min(r+1,len-1)
	local cstrt=max(c-1,0)
	local cfnsh=min(c+1,len-1)

	for cr=rstrt,rfnsh,1 do
		for cc=cstrt,cfnsh,1 do
			if dts[cr][cc]==0 then
				add(nghbrs,{
					r=cr,
					c=cc
				})
			end
		end
	end

	return nghbrs
end

function find_open_dots()
	local opn_dts={}
	
	for r=0,len-1,1 do
		for c=0,len-1,1 do
			
			local nghbrs=
				open_neighbors(r,c,len-1)
	
			local nghbr=
				nghbrs[flr(rnd(#nghbrs))]
	
			if dts[r][c]==7
			and nghbr then
				add(opn_dts,{
					{r=cr,c=cc},
					nghbr
				})
			end
			
		end 
	end
	
	return opn_dts
end

function get_open_dot()
	local opn_dts=
		find_open_dots()
	local opn_dt=
		opn_dts[flr(rnd(#opn_dts))]	
	return opn_dt[1],opn_dt[2]
end

function draw_dots()
	for r=0,len-1,1 do
		for c=0,len-1,1 do
			local x=c*(rad+spc)+mrg
			local y=r*(rad+spc)+mrg
			local c=dts[r][c]
			circ(x,y,rad,c)
		end 
	end
end