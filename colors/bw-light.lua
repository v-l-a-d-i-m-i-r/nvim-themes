local utils = require("themes.utils")
local highlight = utils.highlight
local map_treesitter_key_to_legacy = utils.treesitter_map_to_legacy

-- local bg_primary = utils.grayscale_to_hex_string(255)
local bg_primary = utils.grayscale_to_hex_string(222)
-- local bg_secondary = utils.grayscale_to_hex_string(240)
local bg_secondary = utils.grayscale_to_hex_string(170)
-- local bg_selection = utils.grayscale_to_hex_string(230)
local bg_selection = utils.grayscale_to_hex_string(150)
-- local fg_comments = utils.grayscale_to_hex_string(220)
local fg_comments = utils.grayscale_to_hex_string(120)
-- local fg_secondary = utils.grayscale_to_hex_string(30)
local fg_secondary = utils.grayscale_to_hex_string(100)
-- local fg_primary = utils.grayscale_to_hex_string(20)
local fg_primary = utils.grayscale_to_hex_string(85)
local fg_tertiary = utils.grayscale_to_hex_string(10)
local bg_tertiary = utils.grayscale_to_hex_string(0)
local red = "#cc5733" --base08
local orange = "#ce9178" -- base09
local yellow = "#cdcd9d" -- base0A
local green = "#41a490" -- base0B
local cyan = "#94cceb" -- base0C
local blue = "#5496d4" -- base0D
local purple = "#646696" -- base0E
local pink = "#bb81c5" -- base0F


local callable = {
  guifg = fg_secondary,
  gui = 'bold,italic'
}
local G = {
  Function = callable,
  Keyword = { guifg = utils.grayscale_to_hex_string(0), gui = 'bold' },
  Property = { guifg = fg_primary, gui = 'none' },
  String = { guifg = utils.grayscale_to_hex_string(100), gui = 'none' },
  Number = { guifg = fg_primary, gui = 'none' },
  Boolean = { guifg = fg_primary, gui = 'none' },
  Variable = { guifg = fg_primary, gui = 'none' },
  Type = { guifg = utils.grayscale_to_hex_string(100), gui = 'bold' },
  Tag = { guifg = fg_primary, gui = 'none' },
  Punctuation = { guifg = fg_secondary, gui = 'none' },
  SignAdd = { guifg = cyan, gui = 'none' },
  SignChange = { guifg = yellow, gui = 'none' },
  SignDelete = { guifg = red, gui = 'none' },
  Error = { guifg = red, gui = 'none', guibg = 'none' },
  Warn = { guifg = orange, gui = 'none' },
  Hint = { guifg = cyan, gui = 'none' },
  Info = { guifg = green, gui = 'none' },
  Comments = { guifg = fg_comments, gui = 'italic' },
  IndentGuides = { guifg = fg_comments, gui = 'nocombine' },
  Regex = { guifg = fg_primary, gui = 'none' },
  Text = { guifg = fg_primary, gui = 'none' },
  DiffAdd = { guifg = "none" , guibg = "#193119" },
  DiffDelete = { guifg = "none" , guibg = "#311919" },
  DiffChange = { guifg = "none" , guibg = "#191931" },
  DiffText = { guifg = "none" , guibg = "#0F0F83" },
  PreProc = { guifg = fg_primary, gui = 'none' }
}

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
  MatchParen   = { guifg = nil, guibg = fg_comments, gui = nil, guisp = nil },
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
  ["@label"] = { guifg = yellow, guibg = nil, gui = 'none', guisp = nil },
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
  -- NvimTreeCursorLine = { bg = bg_selection },
  -- NvimTreeEmptyFolderName = {fg = gray, style = "italic", },
  -- NvimTreeEndOfBuffer = {fg = tree_gray, },
  -- NvimTreeExecFile = {fg = "#9FBA89", },
  NvimTreeGitIgnored = { guifg = fg_comments },
  -- NvimTreeGitignoreIcon = {fg = "#E64A19", },
  -- NvimTreeImageFile = {fg = light_gray, },
  -- NvimTreeOpenedFolderName = {fg = folder_blue, style = "bold,italic", },
  -- NvimTreeSymlink = {fg = cyan, },
  -- NvimTreeVertSplit = {fg = alt_bg, bg = alt_bg, },
  NvimTreeExecFile = {guifg = fg_primary, gui = 'none'},
  NvimTreeFolderName = { guifg = fg_primary },
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
  NvimTreeFolderIcon = {guifg = fg_primary },
  NvimTreeOpenedFile = { guifg = fg_primary, gui = 'bold'},
})

highlight({
  TelescopeSelection = { guifg = fg_primary },
  TelescopeMatching = { guifg = fg_primary, gui = "bold" },
  TelescopeBorder = { guifg = fg_primary },
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
  LualineNormalA = { guifg = bg_primary, guibg = fg_primary, gui = 'none' },
  LualineNormalB = { guifg = fg_primary, guibg = bg_secondary },
  LualineNormalC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineVisualA = { guifg = bg_primary, guibg = fg_primary, gui = 'none' },
  LualineVisualB = { guifg = fg_primary, guibg = bg_secondary },
  LualineVisualC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineReplaceA = { guifg = bg_primary, guibg = fg_primary, gui = 'none' },
  LualineReplaceB = { guifg = fg_primary, guibg = bg_secondary },
  LualineReplaceC = { guifg = fg_secondary, guibg = bg_secondary },
  LualineInsertA = { guifg = bg_primary, guibg = fg_primary, gui = 'none' },
  LualineInsertB = { guifg = fg_primary, guibg = bg_secondary },
  LualineInsertC = { guifg = fg_secondary, guibg = bg_secondary },
})
