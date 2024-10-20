local defaults = {work = 40, idle = 10}

if data.raw and data.raw["string-setting"] and data.raw["string-setting"]["fssm-parent_name"] then
    defaults.work = 100
end

data:extend({
    {
        type = "int-setting",
        name = "fUSAp-work-volume",
        setting_type = "startup",
        default_value = defaults.work,
        minimum_value = 0,
        maximum_value = 100,
        order = "aa"
    },
    {
        type = "int-setting",
        name = "fUSAp-idle-volume",
        setting_type = "startup",
        default_value = defaults.idle,
        minimum_value = 0,
        maximum_value = 100,
        order = "ab"
    }
})