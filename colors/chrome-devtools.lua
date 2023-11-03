local utils = require("themes.utils")
local highlight = utils.highlight
local map_treesitter_key_to_legacy = utils.treesitter_map_to_legacy

-- #f5f5f5
-- #f1f3f4
-- #202124
-- #333333
-- #303942
-- #808080
-- #6e6e6e
-- #cacdd1
-- #4285f4
-- #1a73e8
-- #4f9eee
-- #4f8ac4
-- #007500
-- #00a846
-- #1a1aa8
-- #3200ff
-- #6240bf
-- #f29900
-- #d93025
-- #f5f5f5
-- #221199
local bg_primary = "#ffffff" -- base00
-- local bg_primary = "#f5f5f5" -- base00
-- local bg_primary = "#f2f3f3" -- base00 wp-kama
-- local bg_secondary = "#f1f3f4" -- base01
local bg_secondary = "#eaebeb" -- base01 wp-kama
local bg_selection = "#cfe8fc" -- base02
-- local fg_comments = "#c0c0c0" -- base03
local fg_comments = "#8b8d87" -- base03 wp-kama
-- local fg_secondary = "#333333" -- base04
local fg_secondary = "#202124" -- base04
-- local fg_primary = "#5f6368" -- base05
local fg_primary = "#333333" -- base05
local fg_tertiary = "#c4cccf" -- base06
local bg_tertiary = "#dbdfe1" -- base07
local red = "#c80000" --base08
local orange = "#994500" -- base09
local yellow = "#d9b526" -- base0A
local green = "#008877" -- base0B
-- local cyan = "#7aaef2" -- base0C
-- local cyan = "#4f8ac4" -- base0D
local cyan = "#1a73e8" -- base0D
-- local blue = "#4f8ac4" -- base0D
-- local blue = "#1a73e8" -- base0D
local blue = "#221199" -- base0D
local purple = "#881280" -- base0E
local pink = "#ab0d90" -- base0F

local G = {
  Function = { guifg = "#1a1aa8", gui = 'none' },
  -- Function = { guifg = blue, gui = 'none' },
  Keyword = { guifg = purple, gui = 'none' },
  Property = { guifg = fg_primary, gui = 'none' },
  String = { guifg = orange, gui = 'none' },
  Number = { guifg = pink, gui = 'none' },
  Boolean = { guifg = blue, gui = 'none' },
  -- Variable = { guifg = "#221199", gui = 'none' },
  Variable = { guifg = cyan, gui = 'none' },
  Type = { guifg = green, gui = 'none' },
  Tag = { guifg = blue, gui = 'none' },
  Punctuation = { guifg = fg_primary, guibg = 'none', gui = 'none' },
  SignAdd = { guifg = cyan, gui = 'none' },
  SignChange = { guifg = yellow, gui = 'none' },
  SignDelete = { guifg = red, gui = 'none' },
  Error = { guifg = red, gui = 'none', guibg = 'none' },
  Warn = { guifg = orange, gui = 'none' },
  Hint = { guifg = cyan, gui = 'none' },
  Info = { guifg = green, gui = 'none' },
  Comments = { guifg = fg_comments, gui = 'none' },
  IndentGuides = { guifg = bg_secondary, gui = 'none' },
  Regex = { guifg = green, gui = 'none' },
  Text = { guifg = fg_primary, gui = 'none' },
  DiffAdd = { guifg = "none" , guibg = "#e6ffec" },
  DiffDelete = { guifg = "none" , guibg = "#ffebe9" },
  DiffChange = { guifg = "none" , guibg = "#ddf4ff" },
  DiffText = { guifg = "none" , guibg = "#bbdfff" },
  PreProc = { guifg = purple, gui = 'none' }
}

vim.cmd('hi clear')
if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end
vim.cmd('set termguicolors')

highlight({
  -- TabLineSel = {fg = white, bg = alt_bg, },
  -- TooLong      = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  -- VisualNOS    = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  Bold         = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil },
  ColorColumn  = { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil },
  Conceal      = { guifg = blue, guibg = bg_primary, gui = nil, guisp = nil },
  Cursor       = { guifg = bg_primary, guibg = fg_primary, gui = nil, guisp = nil },
  CursorColumn = { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil },
  CursorLine   = { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil },
  CursorLineNr = { guifg = yellow, guibg = bg_secondary, gui = nil, guisp = nil },
  Directory    = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
  -- Error        = { guifg = bg_primary, guibg = red, gui = nil, guisp = nil },
  -- ErrorMsg     = { guifg = red, guibg = bg_primary, gui = nil, guisp = nil },
  Error = G.Error,
  ErrorMsg = G.Error,
  Exception    = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  FoldColumn   = { guifg = cyan, guibg = bg_primary, gui = nil, guisp = nil },
  Folded       = { guifg = fg_comments, guibg = bg_secondary, gui = nil, guisp = nil },
  IncSearch    = { guifg = bg_primary, guibg = yellow, gui = 'none', guisp = nil },
  Italic       = { guifg = nil, guibg = nil, gui = 'italic', guisp = nil },
  LineNr       = { guifg = fg_secondary, guibg = bg_primary, gui = nil, guisp = nil },
  Macro        = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  MatchParen   = { guifg = nil, guibg = bg_tertiary, gui = nil, guisp = nil },
  ModeMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
  MoreMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
  NonText      = { guifg = bg_primary, guibg = nil, gui = nil, guisp = nil },
  Normal       = { guifg = fg_primary, guibg = bg_primary, gui = nil, guisp = nil },
  PMenu        = { guifg = fg_primary, guibg = bg_secondary, gui = 'none', guisp = nil },
  PMenuSel     = { guifg = bg_secondary, guibg = fg_primary, gui = nil, guisp = nil },
  Question     = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
  QuickFixLine = { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil },
  Search       = { guifg = bg_primary, guibg = yellow, gui = nil, guisp = nil },
  SignColumn   = { guifg = fg_secondary, guibg = bg_primary, gui = nil, guisp = nil },
  SpecialKey   = { guifg = fg_comments, guibg = nil, gui = nil, guisp = nil },
  StatusLine   = { guifg = fg_primary, guibg = bg_selection, gui = 'none', guisp = nil },
  StatusLineNC = { guifg = fg_secondary, guibg = bg_secondary, gui = 'none', guisp = nil },
  Substitute   = { guifg = bg_secondary, guibg = yellow, gui = 'none', guisp = nil },
  TabLine      = { guifg = fg_comments, guibg = bg_secondary, gui = 'none', guisp = nil },
  TabLineFill  = { guifg = fg_comments, guibg = bg_secondary, gui = 'none', guisp = nil },
  TabLineSel   = { guifg = green, guibg = bg_secondary, gui = 'none', guisp = nil },
  Title        = { guifg = blue, guibg = nil, gui = 'none', guisp = nil },
  VertSplit    = { guifg = fg_primary, guibg = bg_primary, gui = 'none', guisp = nil },
  Visual       = { guifg = nil, guibg = bg_selection, gui = nil, guisp = nil },
  WarningMsg   = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  WildMenu     = { guifg = red, guibg = yellow, gui = nil, guisp = nil },
  WinBar       = { guifg = fg_primary, guibg = nil, gui = 'none', guisp = nil },
  WinBarNC     = { guifg = fg_secondary, guibg = nil, gui = 'none', guisp = nil },
})

highlight({
  -- [ *Comment ]
  Comment      = G.Comments,

  -- [ *Constant ]
  Constant     = G.Variable,
  String       = G.String,
  Character    = G.String,
  Number       = G.Number,
  Boolean      = G.Boolean,
  Float        = G.Number,

  -- [ *Identifier ]
  -- Identifier   = G.Keyword,
  Identifier   = G.Variable,
  Function     = G.Function,

  -- [ *Statement ]
  Statement    = G.Keyword,
  Conditional  = G.Keyword,
  Repeat       = G.Keyword,
  Label        = G.Keyword,
  Operator     = G.Punctuation,
  Keyword      = G.Keyword,
  Exception    = G.Keyword,

  -- [ *PreProc ]
  PreProc      = G.PreProc,
  Include      = G.PreProc,
  Define       = G.PreProc,
  Macro        = G.PreProc,
  PreCondit    = G.PreProc,

  -- [ *Type ]
  Type         = G.Type,
  StorageClass = G.Type,
  Structure    = G.Type,
  Typedef      = G.Type,

  -- [ *Special ]
  Special      = { guifg = orange, guibg = nil, gui = nil, guisp = nil },
  SpecialChar  = { guifg = fg_tertiary, guibg = nil, gui = nil, guisp = nil },
  Tag          = G.Tag,
  Delimiter    = G.Punctuation,
  -- SpecialComment = {fg = gray, },
  Debug        = { guifg = red, guibg = nil, gui = nil, guisp = nil },

  -- [ *Underlined ]
  Underlined   = { gui = 'underline' },

  -- [ *Ignore ]
  -- Ignore = {fg = cyan, bg = bg, style = "bold", },

  -- [ *Error ]
  Error        = G.Error,

  -- [ *Todo ]
  Todo         = { guifg = blue, guibg = bg_secondary, gui = nil, guisp = nil },
  -- Variable = G.Variable,
})

highlight(map_treesitter_key_to_legacy({
  -- @attribute             ; attribute annotations (e.g. Python decorators)
  -- @character         ; character literals
  -- @character.special ; special characters (e.g. wildcards)
  -- @conceal ; for captures that are only used for concealing
  -- @conceal must be followed by (#set! conceal "").
  -- @define   ; preprocessor definition directives
  -- @none     ; completely disable the highlight
  -- @nospell ; for defining regions that should NOT be spellchecked
  -- @reference             ; identifier reference
  -- @scope                 ; scope block
  -- @spell   ; for defining regions to be spellchecked
  -- @storageclass          ; visibility/life-time modifiers
  -- @symbol           ; symbols or atoms
  -- @text.danger           ; danger/error notes
  -- @text.diff.add         ; added text (for diff files)
  -- @text.diff.delete      ; deleted text (for diff files)
  -- @text.emphasis         ; text with emphasis
  -- @text.environment      ; text environments of markup languages
  -- @text.environment.name ; text indicating the type of an environment
  -- @text.literal          ; literal or verbatim text
  -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
  -- @text.note             ; info notes
  -- @text.reference        ; text references, footnotes, citations, etc.
  -- @text.strike           ; strikethrough text
  -- @text.strong           ; bold text
  -- @text.title            ; text that is part of a title
  -- @text.todo             ; todo notes
  -- @text.underline        ; underlined text
  -- @text.uri              ; URIs (e.g. hyperlinks)
  -- @text.warning          ; warning notes
  ["@boolean"] = G.Boolean,
  ["@comment"] = G.Comments,
  ["@conditional"] = G.Keyword,
  ["@conditional.ternary"] = G.Punctuation,
  ["@constant"] = G.Variable,
  ["@constant.builtin"] = G.Variable,
  ["@constant.macro"] = G.Variable,
  ["@constructor"] = G.Type,
  ["@debug"] = G.Keyword,
  ["@definition"] = G.Keyword,
  ["@definition.associated"] = G.Keyword,
  ["@definition.enum"] = G.Keyword,
  ["@definition.field"] = G.Keyword,
  ["@definition.function"] = G.Keyword,
  ["@definition.import"] = G.Keyword,
  ["@definition.macro"] = G.Keyword,
  ["@definition.method"] = G.Keyword,
  ["@definition.namespace"] = G.Keyword,
  ["@definition.parameter"] = G.Keyword,
  ["@definition.type"] = G.Keyword,
  ["@definition.var"] = G.Keyword,
  ["@error"] = G.Error,
  ["@exception"] = G.Keyword,
  ["@field"] = G.Property,
  ["@float"] = G.Number,
  ["@function"] = G.Function,
  ["@function.builtin"] = G.Function,
  ["@function.call"] = G.Function,
  ["@function.macro"] = G.Function,
  ["@include"] = G.Keyword,
  ["@keyword"] = G.Keyword,
  ["@keyword.function"] = G.Keyword,
  ["@keyword.operator"] = G.Keyword,
  ["@keyword.return"] = G.Keyword,
  ["@label"] = { guifg = blue, guibg = nil, gui = 'none', guisp = nil },
  ["@method"] = G.Function,
  ["@method.call"] = G.Function,
  ["@namespace"] = G.Type,
  ["@number"] = G.Number,
  ["@operator"] = G.Punctuation,
  ["@parameter"] = G.Variable,
  ["@preproc"] = G.Comments,
  ["@property"] = G.Property,
  ["@punctuation.bracket"] = G.Punctuation,
  ["@punctuation.delimiter"] = G.Punctuation,
  ["@punctuation.special"] = G.Punctuation,
  ["@repeat"] = G.Keyword,
  ["@string"] = G.String,
  ["@string.escape"] = G.Number,
  ["@string.regex"] = G.Regex,
  ["@string.special"] = G.String,
  ["@tag"] = G.Tag,
  ["@tag.attribute"] = G.Property,
  ["@tag.delimiter"] = G.Punctuation,
  ["@text"] = G.Text,
  ["@type"] = G.Type,
  ["@type.builtin"] = G.Type,
  ["@type.definition"] = G.Type,
  ["@type.qualifier"] = G.Type,
  ["@variable"] = G.Variable,
  ["@variable.builtin"] = G.Type,
}))

highlight({
  SignAdd = G.SignAdd,
  SignChange = G.SignChange,
  SignDelete = G.SignDelete,
  GitSignsAdd = G.SignAdd,
  GitSignsChange = G.SignChange,
  GitSignsDelete = G.SignDelete,
})

highlight({
  -- NvimTreeCursorLine = { bg = bg_secondary },
  -- NvimTreeEmptyFolderName = {fg = gray, style = "italic", },
  -- NvimTreeEndOfBuffer = {fg = tree_gray, },
  -- NvimTreeExecFile = {fg = "#9FBA89", },
  -- NvimTreeGitIgnored = {fg = gray, style = "italic", },
  -- NvimTreeGitignoreIcon = {fg = "#E64A19", },
  -- NvimTreeImageFile = {fg = light_gray, },
  -- NvimTreeOpenedFolderName = {fg = folder_blue, style = "bold,italic", },
  -- NvimTreeSymlink = {fg = cyan, },
  -- NvimTreeVertSplit = {fg = alt_bg, bg = alt_bg, },
  NvimTreeExecFile = {guifg = fg_primary, gui = 'none'},
  NvimTreeFolderName = {guifg = blue},
  NvimTreeGitDeleted = G.SignDelete,
  NvimTreeGitDirty = G.SignChange,
  NvimTreeGitMerge = G.SignChange,
  NvimTreeGitNew = G.SignAdd,
  NvimTreeGitRenamed = G.SignAdd,
  NvimTreeGitStaged = G.SignAdd,
  NvimTreeImageFile = {guifg = fg_primary, gui = 'none'},
  NvimTreeIndentMarker = G.IndentGuides,
  NvimTreeNormal = {guifg = fg_primary},
  NvimTreeRootFolder = {guifg = fg_primary},
  NvimTreeSpecialFile = {guifg = fg_primary, gui = 'none'},
  NvimTreeFolderIcon = {guifg = blue },
  NvimTreeOpenedFile = { guifg = orange},
})

highlight({
  TelescopeSelection = { guifg = blue },
  TelescopeMatching = { guibg = bg_selection, guifg = fg_primary, gui = "bold" },
  TelescopeBorder = { guifg = blue },
})

highlight({
  IndentBlanklineChar        = G.IndentGuides,
  IndentBlanklineContextChar = { guifg = fg_primary, gui = 'nocombine' },
  IndentBlanklineContextStart = { gui = 'underline' },
  IndentBlanklineSpaceChar   = G.IndentGuides,
  IndentBlanklineSpaceCharBlankline = G.IndentGuides,
})

highlight({
  DiagnosticError = G.Error,
  DiagnosticWarn = G.Warn,
  DiagnosticHint = G.Hint,
  DiagnosticInfo = G.Info,
})

highlight({
  DiffAdd = G.DiffAdd,
  DiffDelete = G.DiffDelete,
  DiffChange = G.DiffChange,
  DiffText = G.DiffText,
})

highlight({
  LualineNormalA = { guifg = bg_primary, guibg = blue, gui = 'bold' },
  LualineNormalB = { guifg = blue, guibg = bg_secondary },
  LualineNormalC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineVisualA = { guifg = bg_primary, guibg = orange, gui = 'bold' },
  LualineVisualB = { guifg = orange, guibg = bg_secondary },
  LualineVisualC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineReplaceA = { guifg = bg_primary, guibg = red, gui = 'bold' },
  LualineReplaceB = { guifg = red, guibg = bg_secondary },
  LualineReplaceC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineInsertA = { guifg = bg_primary, guibg = green, gui = 'bold' },
  LualineInsertB = { guifg = green, guibg = bg_secondary },
  LualineInsertC = { guifg = fg_secondary, guibg = bg_secondary },
})
