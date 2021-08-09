--[[
 * ReaScript Name: Freeze to stereo (adding a freeze Icon to Frozen Tracks
 * Author: IDDQD
 * Instruction: Find and place the freeze.png icon in your SWS Resources>Images>Slot 1
 * If your slot 1 is occupied, change the number in front of the action below (in pink) to the slot number your freeze icon is on
 * Version: 1.0
]]--
reaper.Main_OnCommand(41223,0)
reaper.Main_OnCommand(reaper.NamedCommandLookup("_S&M_SET_TRACK_ICON1"),0)
