--[[
	SCRIPTER: DGVaniX [ DGVaniX#0096 ] 
	WEBSITE: http://vanix.market
	
	THIS RESOURCE WAS RELEASED FOR FREE!
--]]

local Tunnel = module("vrp", "lib/Tunnel")
local Proxy = module("vrp", "lib/Proxy")

vRP = Proxy.getInterface("vRP")
-------------------GROUPS---------------------
copGroups = {"State Trooper", "Police Captain", "Police Lieutenant", "Police Detective", "Police Sergeant", "Sheriff", "Deputy Sheriff", "Police Officer", "Cader", "SWAT"}
emsGroups = {"EMS Chief", "EMS Lieutenant", "EMS Search and Rescue", "EMS Paramedic"}
UberGroups = {"UBER"}
mechanicGroups = {"Mechanic"}

------------------Dummys---------------------
local function dummyCopList(player, choice)
	return
end

local function dummyEMSList(player, choice)
	return
end
local function dummyUberList(player, choice)
	return
end
local function dummyMechanicList(player, choice)
	return
end
-------------------ORDER----------------------
function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end
-------------------FUNCTIONS-------------------
local function showCopsList(player,choice)--COPS ONLINE
	vRP.closeMenu({player})
	SetTimeout(350, function()
		vRP.buildMenu({"Cops Online", {player = player}, function(menu)
			menu.name = "Cops Online"
			menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
			menu.onclose = function(player) vRP.closeMenu({player}) end
			local users = vRP.getUsers({})
			onlineCops = 0
			for i, v in pairs(users) do
				user_id = i
				thePlayer = v
				for k, p in pairs(copGroups) do
					theGroup = p
					if(vRP.hasGroup({user_id, theGroup}))then
						onlineCops  = onlineCops + 1
						menu[GetPlayerName(thePlayer)] = {dummyCopList,"<br>Job: <font color=\"yellow\">"..firstToUpper(theGroup).."</font>"}
					end
				end
			end
			if(onlineCops == 0)then
				menu["0 Cops Online"] = {dummyCopList, "<font color=\"red\">0 Police Members Online</font>"}
			end
			vRP.openMenu({player,menu})
		end})
	end)
end

local function showEMSList(player,choice)--EMS ONLINE
	vRP.closeMenu({player})
	SetTimeout(350, function()
		vRP.buildMenu({"EMS Online", {player = player}, function(menu)
			menu.name = "EMS Online"
			menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
			menu.onclose = function(player) vRP.closeMenu({player}) end
			local users = vRP.getUsers({})
			onlineEMS = 0
			for i, v in pairs(users) do
				user_id = i
				thePlayer = v
				for k, p in pairs(emsGroups) do
					theGroup = p
					if(vRP.hasGroup({user_id, theGroup}))then
						onlineEMS  = onlineEMS + 1
						menu[GetPlayerName(thePlayer)] = {dummyEMSList,"<br>Job: <font color=\"yellow\">"..firstToUpper(theGroup).."</font>"}
					end
				end
			end
			if(onlineEMS == 0)then
				menu["0 EMS Online"] = {dummyEMSList, "<font color=\"red\">0 EMS Members Online!</font>"}
			end
			vRP.openMenu({player,menu})
		end})
	end)
end

local function showUBERList(player,choice)--UBER ONLINE
	vRP.closeMenu({player})
	SetTimeout(350, function()
		vRP.buildMenu({"UBER Online", {player = player}, function(menu)
			menu.name = "UBER Online"
			menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
			menu.onclose = function(player) vRP.closeMenu({player}) end
			local users = vRP.getUsers({})
			onlineUBER = 0
			for i, v in pairs(users) do
				user_id = i
				thePlayer = v
				for k, p in pairs(UberGroups) do
					theGroup = p
					if(vRP.hasGroup({user_id, theGroup}))then
						onlineUBER  = onlineUBER + 1
						menu[GetPlayerName(thePlayer)] = {dummyUberList,"<br>Job: <font color=\"yellow\">"..firstToUpper(theGroup).."</font>"}
					end
				end
			end
			if(onlineUBER == 0)then
				menu["0 UBERS ON"] = {dummyUberList, "<font color=\"red\">0 UBERS Online!</font>"}
			end
			vRP.openMenu({player,menu})
		end})
	end)
end

local function showMechanicList(player,choice)--Mechanic ONLINE
	vRP.closeMenu({player})
	SetTimeout(350, function()
		vRP.buildMenu({"Mechanic Online", {player = player}, function(menu)
			menu.name = "Mechanic Online"
			menu.css={top="75px",header_color="rgba(200,0,0,0.75)"}
			menu.onclose = function(player) vRP.closeMenu({player}) end
			local users = vRP.getUsers({})
			onlineMechanics = 0
			for i, v in pairs(users) do
				user_id = i
				thePlayer = v
				for k, p in pairs(mechanicGroups) do
					theGroup = p
					if(vRP.hasGroup({user_id, theGroup}))then
						onlineMechanics  = onlineMechanics + 1
						menu[GetPlayerName(thePlayer)] = {dummyMechanicList,"<br>Job: <font color=\"yellow\">"..firstToUpper(theGroup).."</font>"}
					end
				end
			end
			if(onlineMechanics == 0)then
				menu["0 Mechanics ON"] = {dummyMechanicList, "<font color=\"red\">0 Mechanics Online!</font>"}
			end
			vRP.openMenu({player,menu})
		end})
	end)
end



-------------------MENU CHOICES-------------------------

vRP.registerMenuBuilder({"phone", function(add) -- phone menu is created on server start, so it has no permissions.
    local choices = {} -- Comment the choices you want to disable by adding -- in front of them.
	
		choices["🚓Cops Online"] = {showCopsList, "Police Members Online!"}
		choices["🚑EMS Online"] = {showEMSList, "EMS Members Online!"}
		choices["🚕UBER Online"] = {showUBERList, "UBER Members Online!"}
		choices["🔧Mechanics Online"] = {showMechanicList, "Mechanic Members Online!"}
	
    add(choices)
end})


--OLD FUNCTIONS- IGNORE
--[[vRP.registerMenuBuilder({"ðŸ¤´Jogador", function(add, data)--Police 
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Polícias Online"] = {showCopsList, "Membros da Polícia Online!"}
		add(choices)
	end
end})
vRP.registerMenuBuilder({"admin", function(add, data)---EMS
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Socorristas Online"] = {showEMSList, "Membros dos Socorristas Online!"}
		add(choices)
	end
end})
vRP.registerMenuBuilder({"admin", function(add, data)---UBER
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Transporte Online"] = {showUBERList, "Membros dos Taxistas/UBER Online!"}
		add(choices)
	end
end})

vRP.registerMenuBuilder({"admin", function(add, data)--Mechanic 
	local user_id = vRP.getUserId({data.player})
	if user_id ~= nil then
		local choices = {}
		choices["Mecânicos Online"] = {showMechanicList, "Membros dos Mecânicos Online!"}
		add(choices)
	end
end})]]