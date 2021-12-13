 function main()
    _,_,_,_,_,_,mouse_scroll  = reaper.get_action_context() 
    prev_mouse_scroll = mouse_scroll
    
    reaper.ShowConsoleMsg(mouse_scroll.."ms")
    reaper.ShowConsoleMsg("\n")
    reaper.ShowConsoleMsg(prev_mouse_scroll.."pms")
    reaper.ShowConsoleMsg("\n")
        
    if prev_mouse_scroll > 0 then 
      reaper.Main_OnCommand(40285,0)
     elseif prev_mouse_scroll < 0 then
      reaper.Main_OnCommand(40286,0)
    end
  end
  
  
  reaper.defer(main)

