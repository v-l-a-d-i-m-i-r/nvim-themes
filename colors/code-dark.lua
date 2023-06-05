local theme_builder = require('themes.theme-builder')

local bg_primary   = "#22282a" --base00
local bg_secondary = "#2c3335" --base01
local bg_selection = "#384145" --base02
local fg_comments  = "#505d62" --base03
local fg_secondary = "#97a5aa" --base04
local fg_primary   = "#b9c2c6" --base05
local fg_tertiary  = "#c4cccf" --base06
local bg_tertiary  = "#dbdfe1" --base07
local red          = "#cc5733" --base08
local orange       = "#ce9178" --base09
local yellow       = "#cdcd9d" --base0A
local green        = "#41a490" --base0B
local cyan         = "#94cceb" --base0C
local blue         = "#5496d4" --base0D
local purple       = "#646696" --base0E
local pink         = "#bb81c5" --base0F

local bg_diff_add    = '#193119'
local bg_diff_delete = '#311919'
local bg_diff_change = '#191931'
local bg_diff_text   = '#0F0F83'

theme_builder.setup({
  bg_primary   = bg_primary,
  bg_secondary = bg_secondary,
  bg_selection = bg_selection,
  fg_comments  = fg_comments,
  fg_secondary = fg_secondary,
  fg_primary   = fg_primary,
  fg_tertiary  = fg_tertiary,
  bg_tertiary  = bg_tertiary,

  fg_function = yellow,
  fg_keyword  = blue,
  fg_property = cyan,
  fg_string   = orange,
  fg_number   = pink,
  fg_boolean  = blue,
  fg_variable = cyan,
  fg_type     = green,
  fg_tag      = blue,
  fg_operator = fg_primary,
  fg_regex    = green,
  fg_text     = fg_primary,
  fg_pre_proc = purple,
  fg_conceal  = blue,
  fg_macro    = red,
  fg_debug    = red,

  fg_sign_add    = cyan,
  fg_sign_change = yellow,
  fg_sign_delete = red,

  fg_error = red,
  fg_warn  = orange,
  fg_hint  = cyan,
  fg_info  = green,

  bg_diff_add    = bg_diff_add,
  bg_diff_delete = bg_diff_delete,
  bg_diff_change = bg_diff_change,
  bg_diff_text   = bg_diff_text,

  fg_indent_guides = fg_comments,

  bg_lualine_replace_a = red,
  fg_lualine_replace_b = red,
})
