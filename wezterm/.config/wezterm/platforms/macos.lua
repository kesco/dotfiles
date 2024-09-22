local envHome = os.getenv("HOME")
local envAndroidHome = envHome .. "/Library/Android/sdk"
local envVoltaHome = envHome .. "/.volta"
local envPath = envHome .. "/.cargo/bin:"
		.. envHome .. "/.jenv/bin:"
		.. envAndroidHome .. "/platform-tools:"
		.. envVoltaHome .. "/bin:"
		.. os.getenv("PATH")

---@class MacOSSystem : SystemConfig
local M = {
	fontSize = 16,
	env = {
		ANDROID_HOME = envAndroidHome,
		VOLTA_HOME = envVoltaHome,
		PATH = envPath
	}
}

function M:Init(arch)
	if "arm" == arch then
		self.shell = { "/opt/homebrew/bin/fish", "-l" }
	else
		self.shell = { "/usr/local/bin/fish", "-l" }
	end
end

return M
