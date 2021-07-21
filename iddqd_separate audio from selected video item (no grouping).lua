--[[
 * ReaScript Name: Separate Video and Audio Tracks (No Grouping)
 * Author: IDDQD (with Thanks to Lokasenna)
 * Version: 1.0
 * Instructions: Select a video item. Run the action. the item will be copied and glued on a new track below current track
   the video item will be turned down to -inf. Ergo, separate video & audio tracks!!!
   !!!!Requires SWS Installed!!!!
]]--

  local function main()
    reaper.PreventUIRefresh(1)
    reaper.Main_OnCommand(40318, 0) --Item navigation: Move cursor left to edge of item
    reaper.Main_OnCommand(54589, 0) --SWS/BR: Save edit cursor position, slot 02
    reaper.Main_OnCommand(41295, 0) --Item: Duplicate items
    reaper.Main_OnCommand(40001, 0) --Track: Insert new track
    reaper.Main_OnCommand(54605, 0) --SWS/BR: Restore edit cursor Pos 2
    reaper.Main_OnCommand(55888, 0) --SWS/FNG: Move selected items to edit cursor
    reaper.Main_OnCommand(53951, 0) --???
    reaper.Main_OnCommand(40286, 0) --Track: Go to previous track
    reaper.Main_OnCommand(40419, 0) --Item navigation: Select and move to item in next track
    reaper.Main_OnCommand(42432, 0) --Item: Glue Items
    reaper.Main_OnCommand(40288, 0) --Go to previous track
    reaper.Main_OnCommand(40421, 0) --select all items in track
    VideoItem = reaper.GetSelectedMediaItem(0,0)
    reaper.SetMediaItemInfo_Value(VideoItem,"D_VOL",0)
    reaper.PreventUIRefresh(-1)
    reaper.UpdateArrange()
    reaper.UpdateTimeline()
  end

main()




