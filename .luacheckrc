std = {
  globals = {
    -- these globals can only be accessed.
    -- Standard Lua library
    "math",
    "pairs",
    "ipairs",
    "string",
    "require",
    "table",
    "assert",
    "tostring",
    "print",
    "setfenv",
    "type",
    "loadstring",
    "match",
    "package",
    "tonumber",
    -- Third party libraries
    "love",
    "resources",
    "Vector",
    "Timer",
    "ECS",
    "Entity",
    "Component",
    "System",
    "Instance",
    "_util",
    "luassert",
    -- Our globals
    "_constants",
    "_components",
    "_entities",
    "_systems"
  },
  read_globals = {}
}

max_line_length = 140

codes = true

exclude_files = {"src/shaders/**/*.lua", "tests/**/*.lua"}
