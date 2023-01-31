local status_ok, trouble = pcall(require, 'trouble')
if not status_ok then
  return
end

local icons = require('user.icons')

trouble.setup {
  signs = {
    error = icons.diagnostics.Error,
    warning = icons.diagnostics.Warning,
    hint = icons.diagnostics.Hint,
    information = icons.diagnostics.Information,
    other = icons.diagnostics.Question
  }
}
