local M = {}

local _OS_PATTERNS <const> = {
  ["windows"] = "Windows",
  ["linux"]   = "Linux",
  ["osx"]     = "Mac",
  ["mac"]     = "Mac",
  ["darwin"]  = "Mac",
  ["^mingw"]  = "Windows",
  ["^cygwin"] = "Windows",
  ["bsd$"]    = "BSD",
  ["sunos"]   = "Solaris",
}

local _ARCH_PATTERNS <const> = {
  ["^x86$"]           = "x86",
  ["i[%d]86"]         = "x86",
  ["amd64"]           = "x86_64",
  ["x86_64"]          = "x86_64",
  ["x64"]             = "x86_64",
  ["power macintosh"] = "powerpc",
  ["^arm"]            = "arm",
  ["^mips"]           = "mips",
  ["i86pc"]           = "x86",
}

--- Returns the current operating system name and architecture.
---@return string OS The returned OS name is one of "Windows", "Linux", "Mac", "BSD", or "Solaris".
---@return string ARCH The returned architecture name is one of "x86", "x86_64", "powerpc", "arm", or "mips".
function M:GetOSInfo()
  local rawOSName = ""
  local rawArchName = ""

  if package.config:sub(1, 1) == "\\" then
    local envOS = os.getenv("OS")
    local envARCH = os.getenv("PROCESSOR_ARCHITECTURE")
    if envOS and envARCH then
      rawOSName = envOS
      rawArchName = envARCH
    end
  else
    rawOSName = io.popen("uname -s", "r"):read("*l")
    rawArchName = io.popen("uname -m", "r"):read("*l")
  end

  rawOSName = rawOSName:lower()
  rawArchName = rawArchName:lower()

  local retOSName = ""
  local retArchName = ""

  for pattern, name in pairs(_OS_PATTERNS) do
    if rawOSName:match(pattern) then
      retOSName = name
      break
    end
  end

  for pattern, name in pairs(_ARCH_PATTERNS) do
    if rawArchName:match(pattern) then
      retArchName = name
      break
    end
  end

  return retOSName, retArchName
end

return M
