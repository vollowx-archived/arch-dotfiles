local status_ok, notify = pcall(require, 'notify')
if not status_ok then
  return
end

local icons = require('user.icons')

notify.setup {
  stages = 'fade_in_slide_out',
  on_open = nil,
  on_close = nil,
  render = 'default',
  fps = 30,
  timeout = 2000,
  background_colour = 'Normal',
  minimum_width = 10,

  icons = {
    ERROR = icons.diagnostics.Error,
    WARN = icons.diagnostics.Warning,
    INFO = icons.diagnostics.Information,
    DEBUG = icons.ui.Bug,
    TRACE = icons.ui.Pencil,
  }
}

vim.notify = notify
