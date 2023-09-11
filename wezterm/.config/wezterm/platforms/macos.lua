local envHome = os.getenv("HOME")
local envAndroidHome = envHome .. "/Library/Android/sdk"
local envPath = envHome .. "/.cargo/bin:"
		.. envHome .. "/.jenv/bin:"
		.. envAndroidHome .. "/platform-tools:"
		.. "/usr/local/bin:" .. os.getenv("PATH")

---@class MacOSSystem : SystemConfig
local M = {
	fontSize = 16,
	shell = { "/usr/local/bin/fish", "-i" },
	env = {
		ANDROID_HOME = envAndroidHome,
		PATH = envPath
	}
}

return M
