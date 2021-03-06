--===================================================================================================================================================
-- VARGAS TRAIT FUNCTIONS
-- BasicDummyBuildingScript
--==================================================================================================================================================
-- INCLUDES
--==========================================================================================================================
include("Civ6Common.lua")
include("AdjacencyBonusSupport.lua")
print("Israelite Beth Din scripts running")
--==========================================================================================================================
-- Variables
--==========================================================================================================================

local BaseBuilding = GameInfo.Buildings["BUILDING_LEU_BETH_DIN"].Index;
local EvolveBuilding = GameInfo.Buildings["BUILDING_LEU_SANHEDRIN"].Index;
local ReqCitizens = 10;
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
--==========================================================================================================================
-- Building Evolver
--==========================================================================================================================

function BuildingEvolveCheck( ePlayer:number, bFirstTimeThisTurn:boolean )
	local player = Players[ePlayer];
	local playerConfig:table = PlayerConfigurations[ePlayer]
	local playerCities = player:GetCities()

			--print(0)
			for i, pCity in playerCities:Members() do
				--print(1)
				if pCity ~= nil then
					--print(2)
					local pCityBuildings = pCity:GetBuildings();
					if pCityBuildings ~= nil then
						--print(3)
						if pCityBuildings:HasBuilding(BaseBuilding) == true then
							--print(4)
							if pCity:GetPopulation() >= ReqCitizens then
								local plotIndex:number = Map.GetPlot(pCity:GetX(), pCity:GetY()):GetIndex();
								pCityBuildings:RemoveBuilding(BaseBuilding)
								pCity:GetBuildQueue():CreateIncompleteBuilding(EvolveBuilding, plotIndex, 100);
								print("Evolving Building")
							end
						end
					end
				end
			end

end

Events.PlayerTurnActivated.Add(BuildingEvolveCheck);

--==============================================================================================================================
--==============================================================================================================================