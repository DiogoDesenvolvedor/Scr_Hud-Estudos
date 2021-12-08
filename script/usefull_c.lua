--[[
    
.........................................................................
.........................................................................
.........................................................................
.........   ____    ___    ___     ____   _   _   ___   _   _   .........
.........  |  _ \  |_ _|  / _ \   / ___| | | | | |_ _| | \ | |  .........
.........  | | | |  | |  | | | | | |  _  | | | |  | |  |  \| |  .........
.........  | |_| |  | |  | |_| | | |_| | | |_| |  | |  | |\  |  .........
.........  |____/  |___|  \___/   \____|  \___/  |___| |_| \_|  .........
.........................................................................
.........................................................................
.........................................................................

--]]

local screenW, screenH = guiGetScreenSize()
local x, y = (screenW/1600), (screenH/900)

usefull = {}

usefull["dx:isCursorOnElement"] = function( x, y, w, h )
    local mx, my = getCursorPosition ()
    if mx and my then
        local fullx, fully = guiGetScreenSize ()
        local cursorx, cursory = mx*fullx, my*fully
        if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
            return true
        else
            return false
        end
    end
end

usefull["dx:createText"] = function(text, posx,posy,posw,posh, color, scale, font, h, v, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
	dxDrawText(text, x*posx,y*posy,x*posw,y*posh, color, scale, font, h, v, clip, wordBreak, postGUI, colorCoded, subPixelPositioning)
end

usefull["dx:createLine"] = function(posx,posy,posw,posh, color, scale, post)
	dxDrawLine(x*posx,y*posy,x*posw,y*posh, color, scale, post)
end

usefull["dx:createImage"] = function(posx,posy,posw,posh, diretory, rotx, roty, rotz, color, post)
	dxDrawImage(x*posx,y*posy,x*posw,y*posh, diretory, rotx, roty, rotz, color, post)
end

usefull["dx:createRectangle"] = function (posx,posy,posw,posh,color,postgui, color2)
    if color2 and usefull["dx:isCursorOnElement"](x*posx, y*posy, x*posw, y*posh) then
	    dxDrawRectangle(x*posx, y*posy, x*posw, y*posh, color2, postgui)
    else
	    dxDrawRectangle(x*posx, y*posy, x*posw, y*posh, color, postgui)
    end
end

usefull["dx:borderRectangle"] = function(x, y, w, h, borderColor, postGUI, color2)
    if (x and y and w and h) then
        if (not borderColor) then
            borderColor = tocolor(0, 0, 0, 200)
        end
        
        if postGUI == true then
            dxDrawRectangle(x, y, w, h, borderColor, postGUI, color2)
            dxDrawRectangle(x + 2, y - 1, w - 4, 1, borderColor, postGUI, color2) -- top
            dxDrawRectangle(x + 2, y + h, w - 4, 1, borderColor, postGUI, color2) -- bottom
            dxDrawRectangle(x - 1, y + 2, 1, h - 4, borderColor, postGUI, color2) -- left
            dxDrawRectangle(x + w, y + 2, 1, h - 4, borderColor, postGUI, color2) -- right
        else
            usefull["dx:createRectangle"](x, y, w, h, borderColor, postGUI, color2)
            usefull["dx:createRectangle"](x + 2, y - 1, w - 4, 1, borderColor, postGUI, color2) -- top
            usefull["dx:createRectangle"](x + 2, y + h, w - 4, 1, borderColor, postGUI, color2) -- bottom
            usefull["dx:createRectangle"](x - 1, y + 2, 1, h - 4, borderColor, postGUI, color2) -- left
            usefull["dx:createRectangle"](x + w, y + 2, 1, h - 4, borderColor, postGUI, color2) -- right
        end
    end
end
  
local number = 1
usefull["dx:convertNumber"] = function ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end