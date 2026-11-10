local M = {}

--- Collect all modules directly under lua/<namespace>/ (files and dirs with init.lua)
local function discover(namespace)
    local dir = vim.fn.stdpath("config") .. "/lua/" .. namespace:gsub("%.", "/")
    local mods = {}
    for name, kind in vim.fs.dir(dir) do
        if kind == "file" and name:match("%.lua$") then
            table.insert(mods, namespace .. "." .. (name:gsub("%.lua$", "")))
        elseif kind == "directory" and vim.uv.fs_stat(dir .. "/" .. name .. "/init.lua") then
            table.insert(mods, namespace .. "." .. name)
        end
    end
    table.sort(mods) -- deterministic order
    return mods
end

function M.import(namespace)
    local specs, packs = {}, {}

    for _, mod in ipairs(discover(namespace)) do
        local ok, spec = pcall(require, mod)

        if ok and type(spec) == "table" then
            table.insert(specs, spec)
            vim.list_extend(packs, spec.pack or {})
        else
            vim.notify("Failed to load " .. mod .. ":\n" .. tostring(spec), vim.log.levels.ERROR)
        end
    end

    vim.pack.add(packs)

    -- TODO: add `keys` key to automatically create keymaps
    for _, spec in ipairs(specs) do
        if spec.config then
            local ok, err = pcall(spec.config)

            if not ok then
                vim.notify("Plugin config error:\n" .. tostring(err), vim.log.levels.ERROR)
            end
        end
    end
end

return M
