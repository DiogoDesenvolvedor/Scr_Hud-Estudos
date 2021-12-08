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

local resource = {}
resource["functions"] = {}
resource["variaveis"] = {}
resource["variaveis"]["vida"] = 0
resource["variaveis"]["colete"] = 0

resource["functions"]["ui"] = function ()
    if math.floor(resource["variaveis"]["vida"]) ~= math.floor(x*272/100*getElementHealth ( localPlayer )) then
        if resource["variaveis"]["vida"] > x*272/100*getElementHealth ( localPlayer ) then 
            resource["variaveis"]["vida"] = resource["variaveis"]["vida"] - 1
        elseif resource["variaveis"]["vida"] < x*272/100*getElementHealth ( localPlayer ) then 
            resource["variaveis"]["vida"] = resource["variaveis"]["vida"] + 1 
        end
    end

    if math.floor(resource["variaveis"]["colete"]) ~= math.floor(x*272/100*getPedArmor ( localPlayer )) then
        if resource["variaveis"]["colete"] > x*272/100*getPedArmor ( localPlayer ) then 
            resource["variaveis"]["colete"] = resource["variaveis"]["colete"] - 1
        elseif resource["variaveis"]["colete"] < x*272/100*getPedArmor ( localPlayer ) then 
            resource["variaveis"]["colete"] = resource["variaveis"]["colete"] + 1 
        end
    end


    usefull["dx:createRectangle"](1546, 353, 40, 272, tocolor(0, 0, 0, 141), false)
    usefull["dx:createRectangle"](1502, 353, 40, 272, tocolor(0, 0, 0, 141), false)
    usefull["dx:createRectangle"](1546, 353, 40, resource["variaveis"]["vida"], tocolor(235, 0, 0, 255), false)

    usefull["dx:createRectangle"](1502, 353, 40, resource["variaveis"]["colete"], tocolor(33, 152, 201, 255), false)

end
addEventHandler("onClientRender", getRootElement(), resource["functions"]["ui"])