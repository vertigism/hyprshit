#!/usr/bin/luajit

-- Using a list because table keys are randomly sorted
-- It's also easier to add options or edit them this way
local options = {
    {
        name = "Lock",
        icon = "system-lock-screen",
        command = "hyprlock"
    },
    {
        name = "Shut down",
        icon = "system-shutdown",
        command = "systemctl poweroff"
    },
    {
        name = "Suspend",
        icon = "system-suspend",
        command = "systemctl suspend"
    },
    {
        name = "Reboot",
        icon = "system-reboot",
        command = "systemctl reboot"
    },
    {
        name = "Log out",
        icon = "system-log-out",
        command = "hyprctl dispatch exit"
    },
    {
        name = "Reboot to UEFI",
        icon = "preferences-system",
        command = "systemctl reboot --firmware-setup"
    }
}

for i, opt in ipairs(options) do
    if arg[1] then
        if opt.name == arg[1] then
            os.execute(opt.command)
        end
    else
        print(opt.name .. '\0icon\x1f' .. opt.icon)
    end
end
