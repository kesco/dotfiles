local envHome = os.getenv("HOME")
local envAndroidHome = envHome .. "/Library/Android/sdk"
local envPath = envHome .. "/.cargo/bin:"
		.. envHome .. "/.jenv/bin:"
		.. envAndroidHome .. "/platform-tools:"
		.. os.getenv("PATH")

---@class MacOSSystem : SystemConfig
local M = {
	fontSize = 16,
	env = {
		ANDROID_HOME = envAndroidHome,
		PATH = envPath
	}
}

function M:Init(arch)
	if "arm" == arch then
		self.shell = { "/opt/homebrew/bin/fish", "-i" }
	else
		self.shell = { "/usr/local/bin/fish", "-i" }
	end
end

return M
