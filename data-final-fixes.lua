local soundpack_work = {}
local soundpack_idle = {}
local arrays = {
    {
        setting = "fUSAp-work-volume",
        array = soundpack_work
    },
    {
        setting = "fUSAp-idle-volume",
        array = soundpack_idle
    }
}

for _, value in pairs(arrays) do
    for i = 1, 2 do
        table.insert(value.array,
        {
            filename = "__factorio-USA-pumpjacks__/sound/pumpjack-"..tostring(i)..".ogg",
            volume = settings.startup[value.setting].value/100
        })
    end
end
for key, value in pairs(data.raw["mining-drill"]) do
    if string.find(key, "pumpjack") then
        value.working_sound.sound = {
            variations = soundpack_work
        }
        value.working_sound.idle_sound = {
            variations = soundpack_idle
        }
    end
end