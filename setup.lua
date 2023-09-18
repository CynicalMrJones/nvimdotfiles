
local home = os.getenv("HOME")
local nvim = home .. "/.config/nvim"

local function mkdir()
    os.execute("mkdir " .. nvim)
    os.execute("mkdir " .. nvim .. "/after")
    os.execute("mkdir " .. nvim .. "/lua")
    os.execute("mkdir " .. nvim .. "/plugin")
end

local function copy()
    os.execute("cp -rv after/* " .. nvim .. "/after")
    os.execute("cp -rv lua/* " .. nvim .. "/lua")
    os.execute("cp -rv plugin/* " .. nvim .. "/plugin")
    os.execute("cp -v init.lua " .. nvim)
end
local function fullsetup()
    mkdir()
    copy()
    os.execute("cd && git clone --depth 1 https://github.com/wbthomason/packer.nvim\
    ~/.local/share/nvim/site/pack/packer/start/packer.nvim")
end

function Menu()
    print("Would you like to run the...")
    print("1) Full setup?")
    print("2) Move files from nvimdotfiles to config")
    local answer = io.read()

    if  answer == "1" then
        fullsetup()
    elseif answer == "2" then
        copy()
    else
        os.execute("exit")
    end
end
Menu()
