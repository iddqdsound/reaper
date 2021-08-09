--[[
 * ReaScript Name: Freeze to multichannel (adding a freeze Icon to Frozen Tracks
 * Author: IDDQD
 * Instruction: Find and place the freeze.png icon in your SWS Resources>Images>Slot 1
 * If your slot 1 is occupied, change the number in front of the action below (in pink) to the slot number your freeze icon is on
 * Version: 1.0
]]--

local function main()
  reaper.PreventUIRefresh(1)
  reaper.Undo_BeginBlock()

  reaper.Main_OnCommand(40877,0)
  reaper.Main_OnCommand(reaper.NamedCommandLookup("_S&M_SET_TRACK_ICON1"),0)

  reaper.Undo_EndBlock('Freeze tracks to multichannel', 0)
  reaper.PreventUIRefresh(-1)
  reaper.UpdateArrange()
  reaper.UpdateTimeline()
end

main()

