--[[
Description: When an FX Window is in focus, Action will select only the track it belongs to
Instructions: 
Screenshot: 
Version: 1.0
Author: IDDQD
--]]


v1,SelectedTrackNumber=reaper.GetFocusedFX()
TrackWhoseFXisFocused=reaper.GetTrack(0,SelectedTrackNumber-1)
reaper.SetOnlyTrackSelected(TrackWhoseFXisFocused,1)

