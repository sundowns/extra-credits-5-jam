function love.conf(t)
  t.window.title = "Extra Credits Jam"
  t.window.width = 1280
  t.window.height = 720
  t.window.msaa = 4

  t.releases = {
    title = "grim gamers extra credits jam", -- The project title (string)
    package = nil, -- The project command and package name (string)
    loveVersion = 11.2, -- The project LÖVE version
    version = "0.1", -- The project version
    author = "Tom Smallridge", -- Your name (string)
    email = "tom@smallridge.com.au", -- Your email (string)
    description = "we gamer", -- The project description (string)
    homepage = "https://example.com", -- The project homepage (string)
    identifier = "grim.gamers.extra.credits", -- The project Uniform Type Identifier (string)
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
