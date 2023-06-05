local simple_theme_builder = require("themes.simple-theme-builder")
local hex = require("themes.utils").hex

-- INTERFACE
local bg_primary = '#2e3440'
-- local bg_primary = '#3b4252'
-- local bg_secondary = '#2e3440'
local fg_primary = hex.darken('#d8dee9', 10)
local fg_secondary = hex.darken('#e5e9f0', 25)
-- local bg_secondary = '#434c5e'
-- local bg_selection = '#3b4252'
local bg_secondary = '#3b4252'
local bg_selection = '#434c5e'

-- SYNTAX
local keyword = '#81a1c1'
-- local keyword = '#5e81ac'
local variable = '#8c8c8c'
local func = '#8fbcbb'
-- local comment = '#4c566a'
local comment = '#616e88'
local string = '#a3be8c'

local error = '#bf616a'
local warn = '#d08770'
local info = '#88c0d0'
local hint = '#8fbcbb'

simple_theme_builder.build({
  bg_primary = bg_primary,
  bg_secondary = bg_secondary,
  fg_primary = fg_primary,
  fg_secondary = fg_secondary,
  bg_selection = bg_selection,

  keyword = keyword,
  variable = fg_primary,
  func = func,
  string = string,
  boolean = fg_primary,
  comment = comment,

  error = error,
  warn = warn,
  info = info,
  hint = hint,

  sign_add = string,
  sign_delete = error,
  sign_change = keyword,
  sign_text = func,

  diff_add = hex.get_intermediate_colors(bg_primary, string, 20)[8],
  diff_delete = hex.get_intermediate_colors(bg_primary, error, 20)[8],
  diff_change = hex.get_intermediate_colors(bg_primary, '#5e81ac', 20)[8],
  diff_text = hex.get_intermediate_colors(bg_primary, func, 20)[8],
  -- diff_text = comment,

  mode_normal = keyword,
  mode_insert = string,
  mode_visual = func,
  mode_replace = warn,
})
