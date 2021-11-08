--[[
    globals
]]--

size = 128
margin = 0

number_of_dots = 16
spacing = 10
radius = 8

color = {
    black = 0,
    dark_blue = 1,
    dark_purple = 2,
    dark_green = 3,
    brown = 4,
    dark_grey = 5,
    light_grey = 6,
    white = 7,
    red = 8,
    orange = 9,
    yellow = 10,
    green = 11,
    blue = 12,
    lavender = 13,
    pink = 14,
    light_peach = 15 
}

dot_colors = {
    color.white,
    color.red,
    color.orange,
    color.yellow,
    color.green,
    color.blue,
    color.pink
}

dots = {}

length = flr(size / number_of_dots)

origin_dot = nil
destination_dot = nil
last_dot = nil