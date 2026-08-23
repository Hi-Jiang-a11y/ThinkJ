-- swayimg/config/init.lua
-- @author nate zhou
-- @since 2026

swayimg.mode = "viewer"
swayimg.imagelist.order = "none"

swayimg.on_window_resize(function()
  if swayimg.mode == "viewer" then
    swayimg.viewer.set_fix_scale("optimal")
  elseif swayimg.mode == "slideshow" then
    swayimg.slideshow.set_fix_scale("optimal")
  end
end)
