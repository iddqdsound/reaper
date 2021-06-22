local SelectedItemCount = reaper.CountSelectedMediaItems(0)
if SelectedItemCount == 0 then 
    reaper.MB("Please make an item selection!","Error",0) 
    return 
end 
for SelectedItemIndex = 0,SelectedItemCount-1 do
    local SelectedMediaItem = reaper.GetSelectedMediaItem(0, SelectedItemIndex) --returns the first selected item, 1st 0 is active project, --TODO--
    local ActiveTakeInItem = reaper.GetActiveTake(SelectedMediaItem) --Returns the active take in media item
    local SelectedTakeSource = reaper.GetMediaItemTake_Source(ActiveTakeInItem) --Returns the Source File of active take
    local SelectedTakeSourceName = reaper.GetMediaSourceFileName(SelectedTakeSource,"") --returns the full path of source file name
    local SourceBaseName = string.gsub(SelectedTakeSourceName,".*[/\\]","") --Removes the path name from the source file name
    local SourceBaseNameNoFormat = string.gsub(SourceBaseName,"%.[^.]*$","") --Removes the format from source file name
       reaper.GetSetMediaItemTakeInfo_String(ActiveTakeInItem,"P_NAME",SourceBaseNameNoFormat,true) --renames the active take name by the above variablereaper.GetSetMediaItemTakeInfo_String(ActiveTakeInItem,"P_NAME",SourceBaseName,true) --renames the active take name by the above variable

end   




