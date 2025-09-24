local fssm
if settings.startup["fssm-parent_name"] then
    fssm = require("__factorio-sync-sound-manager__/prototypes/api")
end

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

for _, soundpack in pairs(arrays) do
    for i = 1, 2 do
        table.insert(soundpack.array,
        {
            filename = "__factorio-USA-pumpjacks__/sound/pumpjack-"..tostring(i)..".ogg",
            volume = settings.startup[soundpack.setting].value/100
        })
    end
end
for name, pump in pairs(data.raw["mining-drill"]) do
    if string.find(name, "pumpjack") then
        pump.working_sound.sound = {
            variations = soundpack_work
        }
        pump.working_sound.idle_sound = {
            variations = soundpack_idle
        }
        if fssm then
            sound = pump.working_sound.sound
            sound.speaker_audible_distance_modifier = sound.audible_distance_modifier
            sound.audible_distance_modifier = 0
            fssm.registerPrototype(pump)
        end
    end
end