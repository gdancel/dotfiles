local setup, elixir = pcall(require, "elixir")
local elixirls = require("elixir.elixirls")

if not setup then
  return
end

elixir.setup({
  elixirls = {
    tag = "v0.12.0"
  }
})
