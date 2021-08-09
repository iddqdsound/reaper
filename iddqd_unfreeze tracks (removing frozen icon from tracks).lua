--[[
 * ReaScript Name: Unfreeze Tracks (removing frozen icon)
 * Author: IDDQD
 * Instruction: Find and place the freeze.png icon in your SWS Resources>Images>Slot 1
 * This action only makes sense if you have the frozen track icon set up
 * Version: 1.0
]]--
local function main()
  reaper.PreventUIRefresh(1)
  reaper.Undo_BeginBlock()

  reaper.Main_OnCommand(41644,0)
  reaper.Main_OnCommand(40900,0)

  reaper.Undo_EndBlock('Freeze tracks to mono', 0)
  reaper.PreventUIRefresh(-1)
  reaper.UpdateArrange()
  reaper.UpdateTimeline()
end

main()
