library test initializer init_function
    local integer int
    local trigger tri
    local unit t
    local trigger gg_tri_a

    private function Clear_Variable takes string array arr, integer length, boolean flag returns nothing
        local integer num = 0
        loop 
            if arr[num] ==  "int" or flag then
                set int = 0
            endif
            if arr[num] == "tri" or flag then
                set tri = null
            endif
            if arr[num] == "t" or flag then
                set t = null 
            endif
            if arr[num] == "gg_tri_a" or flag then
                set gg_tri_a = null
            endif
            exitwhen num > length
            set num = num + 1
        endloop
    endfunction

    private function Kill_Unit takes nothing returns nothing
        // 杀死该单位
        call KillUnit(GetTriggerUnit())
    endfunction
    private function init_function takes nothing returns nothing
        set gg_tri_a = CreateTrigger()
        // 单位进入可用区域
        call TriggerRegisterEnterRectSimple(gg_tri_a, GetPlayableMapRect())
        call TriggerAddAction(gg_tri_a, function Kill_Unit)
        Clear_Variable(["gg_tri_a"], 1)
    endfunction
endlibrary
