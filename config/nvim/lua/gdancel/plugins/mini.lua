local trailspace_setup, trailspace = pcall(require, "mini.trailspace")
if not trailspace_setup then
  return
end

trailspace.setup()
