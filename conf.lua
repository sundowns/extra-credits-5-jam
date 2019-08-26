function love.conf(t)
  t.window.title = "Guide - Extra Credits Jam #5"
  t.window.width = 1280
  t.window.height = 720

  t.releases = {
    title = "Guide", -- The project title (string)
    package = nil, -- The project command and package name (string)
    loveVersion = 11.2, -- The project LÖVE version
    version = "0.1", -- The project version
    author = "Tom Smallridge", -- Your name (string)
    email = "tom@smallridge.com.au", -- Your email (string)
    description = "we gamer", -- The project description (string)
    homepage = "https://example.com", -- The project homepage (string)
    identifier = "guide.extra.credits", -- The project Uniform Type Identifier (string)
    excludeFileList = {
      ".git",
      ".luacheckrc",
      "README.md",
      ".vscode",
      ".circleci",
      ".gitignore",
      "tmp",
      "*.tmx"
    },
    releaseDirectory = "dist" -- Where to store the project releases (string)
  }
end
