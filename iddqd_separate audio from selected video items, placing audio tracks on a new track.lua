--[[
 * ReaScript Name: Separate Audio From Selected Video Items
 * Author: IDDQD (with Thanks to Lokasenna/cfillion/Aaron Cendan & co)
 * Version: 1.0
 * Instructions: It's recommended that you have all your video items on one track with nothing else on that track
  Select video items. Run the action. items will be copied and glued on a new track below current track
   the video item will be turned down to -inf. Ergo, separate video & audio tracks!!!
]]--
reaper.Undo_BeginBlock();
reaper.PreventUIRefresh(1)
CurPos = reaper.GetCursorPosition()
  local SelectedItemCount = reaper.CountSelectedMediaItems(0)
  if SelectedItemCount == 0 then 
      reaper.MB("Please Select a Video Item!","Error",0) 
  return
end
FirstSelectedItem = reaper.GetSelectedMediaItem(0,0)
VideoTrack = reaper.GetMediaItemTrack(FirstSelectedItem)
reaper.SetTrackSelected(VideoTrack,1)
reaper.Main_OnCommand(40062,0) --Track: Duplicate tracks
AudioTrack = reaper.GetSelectedTrack(0,0)
reaper.GetSetMediaTrackInfo_String(AudioTrack,"P_NAME","Audio Track",1)
reaper.Main_OnCommand(40289,0) --Item: Unselect all items

 
for SelectedItemIndex = 0,SelectedItemCount-1 do
  local SelectedMediaItem = reaper.GetTrackMediaItem(AudioTrack,SelectedItemIndex)
  reaper.SetMediaItemSelected(SelectedMediaItem,1)
  reaper.Main_OnCommand(40362,0) --Item: Glue items
  reaper.Main_OnCommand(40289,0) --Item: Unselect all items
end

--AudioTrackNum = reaper.GetMediaTrackInfo_Value(AudioTrack,"IP_TRACKNUMBER",1)
reaper.Main_OnCommand(40418,0) --Select Previous Track
OriginalTrack = reaper.GetSelectedTrack(0,0)
reaper.Main_OnCommand(40421,0) --Item: Select all items on track
VideoItemCount = reaper.CountSelectedMediaItems(0)
reaper.Main_OnCommand(40289,0) --Item: Unselect all items
for SelectedVidItemIndex = 0,VideoItemCount-1 do
  local SelectedVideoItem = reaper.GetTrackMediaItem(OriginalTrack,SelectedVidItemIndex)
  reaper.SetMediaItemSelected(SelectedVideoItem,1)
  ItemToTurnDown=reaper.GetSelectedMediaItem(0,SelectedVidItemIndex)
 -- SelectedVideoItemTake =  reaper.GetActiveTake(SelectedVideoItem)
  reaper.SetMediaItemInfo_Value(ItemToTurnDown,"D_VOL",0)
  
 -- reaper.GetSetMediaItemTakeInfo_String(SelectedVideoItemTake,"..ignoreAudioSetting..",true)
--reaper.Main_OnCommand(40421,0) --Select all items on track "<SOURCE VIDEO\n",
end
reaper.SetEditCurPos(CurPos,0,0)
reaper.PreventUIRefresh(-1)
reaper.UpdateArrange()
reaper.UpdateTimeline()
reaper.Undo_EndBlock("Separate Audio from Video Tracks", 0);