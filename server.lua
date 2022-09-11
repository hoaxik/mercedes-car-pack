SetConvarServerInfo('tags', 'HOAX_CARS')
updatePath = "/hoaxik/marcedes-car-pack"
Citizen.CreateThread(function()
    if GetCurrentResourceName() ~= "HOAX_CARS" then
        print("-----------------------------------------------------")
        print("This pack is maid by HoaX#123, do not edit name of this file to avoid any problems.")
        print("-----------------------------------------------------")
    end
    if GetCurrentResourceName() == 'HOAX_CARS' then
        function checkVersion(_, responseText)
            curVersion = LoadResourceFile(GetCurrentResourceName(), "version")

            if curVersion ~= responseText and tonumber(curVersion) < tonumber(responseText) then
                print("     ####  ####║                     Hey! There is an update for my pack")
                print("    ####  ####║")
                print("   ##########║         Please download it below. There are some new vehicles or updates ;)")
                print("  ##########║")
                print(" ####  ####║          If you have any questions you can text me on the Discord: HoaX#1234")
                print("####  ####║ should be: "..responseText..",currently is: "..curVersion..". Please update it from https://github.com"..updatePath.."")
            end
        end
    end

    PerformHttpRequest("https://raw.githubusercontent.com"..updatePath.."/master/HOAX_CARS/version", checkVersion, "GET")
end)
