--[[
 * ReaScript Name: Split 2.1 mp4 into 1 video, 1 stereo wav (ch1-2) and 1 mono wav (ch3).lua
 * Author: IDDQD (with Thanks to Lokasenna) / Mixing with Paulie
 * Version: 1.0
 * Description: This is a very specific custom script made for exploding a 3 channel video item into 3 separate tracks.
                after selecting a 3-channel video file, running this action will generate 3 items & two new tracks.
                First item is just the video 
                Second item is just channel 3 as a mono wav file on first new track (VO)
                third item is just channels 1&2 as a stereo wav file on second new track(DAW Audio)
                A lot of Audio tutorial makers will record three channels of audio in OBS, with the DAW audio 
                printed on channels 1& 2 and VoiceOver printed on Channel 3.
                Upon importing to REAPER, this action can split the video and extract its audio in this way for editing!
 * Instructions: Select a video item. Run the action! Done!
   Requires SWS Installed
]]--

  local function main()
    reaper.PreventUIRefresh(1)
    reaper.Main_OnCommand(40318, 0) --Item navigation: Move cursor left to edge of item
    reaper.Main_OnCommand(54589, 0) --SWS/BR: Save edit cursor position, slot 02
    reaper.Main_OnCommand(41295, 0) --Item: Duplicate items
    reaper.Main_OnCommand(40001, 0) --Track: Insert new track
    VOTrack=reaper.GetSelectedTrack(0,0)
    reaper.GetSetMediaTrackInfo_String(VOTrack,"P_NAME","VO",1)
    reaper.Main_OnCommand(54605, 0) --SWS/BR: Restore edit cursor Pos 2
    reaper.Main_OnCommand(55888, 0) --SWS/FNG: Move selected items to edit cursor
    reaper.Main_OnCommand(53951, 0) --???
    reaper.Main_OnCommand(41295, 0) --Item: Duplicate items
    reaper.Main_OnCommand(40001, 0) --Track: Insert new track
    DAWTrack=reaper.GetSelectedTrack(0,0)
    reaper.GetSetMediaTrackInfo_String(DAWTrack,"P_NAME","DAW Audio",1)
    reaper.Main_OnCommand(54605, 0) --SWS/BR: Restore edit cursor Pos 2
    reaper.Main_OnCommand(55888, 0) --SWS/FNG: Move selected items to edit cursor
    reaper.Main_OnCommand(53951, 0) --???
    reaper.Main_OnCommand(40418, 0) --Item navigation: Select and move to item in previous track
    VOItem=reaper.GetSelectedMediaItem(0,0)
    VOTake=reaper.GetActiveTake(VOItem)
    reaper.SetMediaItemTakeInfo_Value(VOTake, "I_CHANMODE", 5)
    reaper.Main_OnCommand(40419, 0) --Item navigation: Select and move to item in next track
    DAWItem=reaper.GetSelectedMediaItem(0,0)
    DAWTake=reaper.GetActiveTake(DAWItem)
    reaper.SetMediaItemTakeInfo_Value(DAWTake, "I_CHANMODE", 67)
    --reaper.Main_OnCommand(40419, 0) --Item navigation: Select and move to item in next track
    --reaper.Main_OnCommand(42432, 0) --Item: Glue Items
    reaper.Main_OnCommand(40288, 0) --Go to previous track
    reaper.Main_OnCommand(40418, 0) --Item navigation: Select and move to item in previous track
    VideoItem = reaper.GetSelectedMediaItem(0,0)
    reaper.SetMediaItemInfo_Value(VideoItem,"D_VOL",0)
    reaper.Main_OnCommand(40419, 0) --Item navigation: Select and move to item in next track
    reaper.Main_OnCommand(40287, 0) --Item navigation: Select and move to item in next track
    reaper.Main_OnCommand(40421, 0) --Item: Select all items in track
    reaper.Main_OnCommand(42432, 0) --Items: Glue
    reaper.PreventUIRefresh(-1)
    reaper.UpdateArrange()
    reaper.UpdateTimeline()
  end

main()




