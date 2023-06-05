-- https://earl-grey.halt.wtf/

local utils = require("themes.utils")
local map_treesitter_key_to_legacy = utils.treesitter_map_to_legacy
local function highlight(groups)
  for group, props in pairs(groups) do
    if (type(props) == 'string') then
      local cmd = table.concat({
        "highlight", "link", group, props
      }, " ")
      -- vim.cmd(('hi! link %s %s'):format(group, args))
      return
    end

    local guibg = props.guibg == nil and "" or "guibg=" .. props.guibg
    local guifg = props.guifg == nil and "" or "guifg=" .. props.guifg
    local gui = props.gui == nil and "" or "gui=" .. props.gui
    local guisp = props.guisp == nil and "" or "guisp=" .. props.guisp

    -- local guibg = props.guibg and "guibg=none" or "guibg=" .. props.guibg
    -- local guifg = props.guifg and "guifg=none" or "guifg=" .. props.guifg
    -- local gui = props.gui and "gui=none" or "gui=" .. props.gui
    -- local guisp = props.guisp and "guisp=none" or "guisp=" .. props.guisp

    local cmd = table.concat({
      "highlight", group, guifg, guibg, gui, guisp
    }, " ")

    vim.api.nvim_command(cmd)
  end
end

local foreground = "#605A52"
local foreground_alt = "#5A544C"
local background = "#FCFBF9"
local background_alt = "#F7F3EE"
local purple = "#83577D"
local blue = "#556995"
local teal = "#477A7B"
local orange = "#886A44"
local green = "#747B4D"
local red = "#8F5652"
local comment = "#9E9A95"
local berry = "#AA5087"

local G = {
  Boolean = { guifg = teal, gui = 'none' },
  Comments = { guifg = comment, gui = 'italic' },
  DiffAdd = { guifg = "none" , guibg = "#193119" },
  DiffChange = { guifg = "none" , guibg = "#191931" },
  DiffDelete = { guifg = "none" , guibg = "#311919" },
  DiffText = { guifg = "none" , guibg = "#0F0F83" },
  Error = { guifg = red, gui = 'none', guibg = 'none' },
  Function = { guifg = foreground, gui = 'italic' },
  Hint = { guifg = blue, gui = 'none' },
  IndentGuides = { guifg = comment, gui = 'nocombine' },
  Info = { guifg = teal, gui = 'none' },
  Keyword = { guifg = purple, gui = 'none' },
  Number = { guifg = teal, gui = 'none' },
  PreProc = { guifg = foreground, gui = 'none' },
  Property = { guifg = foreground, gui = 'none' },
  Punctuation = { guifg = foreground, gui = 'none' },
  Regex = { guifg = teal, gui = 'none' },
  SignAdd = { guifg = teal, gui = 'none' },
  SignChange = { guifg = orange, gui = 'none' },
  SignDelete = { guifg = red, gui = 'none' },
  String = { guifg = green, gui = 'none' },
  Tag = { guifg = foreground, gui = 'none' },
  Text = { guifg = foreground, gui = 'none' },
  Type = { guifg = foreground, gui = 'italic' },
  Variable = { guifg = blue, gui = 'none' },
  Warn = { guifg = orange, gui = 'none' },
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
  ColorColumn  = { guifg = nil, guibg = background_alt, gui = 'none', guisp = nil },
  Conceal      = { guifg = blue, guibg = background, gui = nil, guisp = nil },
  Cursor       = { guifg = background, guibg = foreground, gui = nil, guisp = nil },
  CursorColumn = { guifg = nil, guibg = background_alt, gui = 'none', guisp = nil },
  CursorLine   = { guifg = nil, guibg = background_alt, gui = 'none', guisp = nil },
  -- CursorLineNr = { guifg = yellow, guibg = background_alt, gui = nil, guisp = nil },
  Directory    = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
  -- Error        = { guifg = background, guibg = red, gui = nil, guisp = nil },
  -- ErrorMsg     = { guifg = red, guibg = background, gui = nil, guisp = nil },
  Error = G.Error,
  ErrorMsg = G.Error,
  Exception    = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  -- FoldColumn   = { guifg = cyan, guibg = background, gui = nil, guisp = nil },
  Folded       = { guifg = comment, guibg = background_alt, gui = nil, guisp = nil },
  IncSearch    = { guifg = background, guibg = berry, gui = 'none', guisp = nil },
  Italic       = { guifg = nil, guibg = nil, gui = 'italic', guisp = nil },
  LineNr       = { guifg = foreground_alt, guibg = background, gui = nil, guisp = nil },
  Macro        = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  MatchParen   = { guifg = nil, guibg = comment, gui = nil, guisp = nil },
  ModeMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
  MoreMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
  NonText      = { guifg = background, guibg = nil, gui = nil, guisp = nil },
  Normal       = { guifg = foreground, guibg = background, gui = nil, guisp = nil },
  PMenu        = { guifg = foreground, guibg = background_alt, gui = 'none', guisp = nil },
  PMenuSel     = { guifg = background_alt, guibg = foreground, gui = nil, guisp = nil },
  Question     = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
  QuickFixLine = { guifg = nil, guibg = background_alt, gui = 'none', guisp = nil },
  Search       = { guifg = background, guibg = berry, gui = nil, guisp = nil },
  SignColumn   = { guifg = foreground_alt, guibg = background, gui = nil, guisp = nil },
  SpecialKey   = { guifg = comment, guibg = nil, gui = nil, guisp = nil },
  StatusLine   = { guifg = foreground, guibg = background_alt, gui = 'none', guisp = nil },
  StatusLineNC = { guifg = foreground_alt, guibg = background_alt, gui = 'none', guisp = nil },
  Substitute   = { guifg = background_alt, guibg = berry, gui = 'none', guisp = nil },
  TabLine      = { guifg = comment, guibg = background_alt, gui = 'none', guisp = nil },
  TabLineFill  = { guifg = comment, guibg = background_alt, gui = 'none', guisp = nil },
  TabLineSel   = { guifg = green, guibg = background_alt, gui = 'none', guisp = nil },
  Title        = { guifg = blue, guibg = nil, gui = 'none', guisp = nil },
  VertSplit    = { guifg = foreground, guibg = background, gui = 'none', guisp = nil },
  Visual       = { guifg = nil, guibg = background_alt, gui = nil, guisp = nil },
  WarningMsg   = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  WildMenu     = { guifg = red, guibg = berry, gui = nil, guisp = nil },
  WinBar       = { guifg = foreground, guibg = nil, gui = 'none', guisp = nil },
  WinBarNC     = { guifg = foreground_alt, guibg = nil, gui = 'none', guisp = nil },
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
  SpecialChar  = { guifg = orange, guibg = nil, gui = nil, guisp = nil },
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
  Todo         = { guifg = blue, guibg = background_alt, gui = nil, guisp = nil },
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
  ["@label"] = { guifg = berry, guibg = nil, gui = 'none', guisp = nil },
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
  -- NvimTreeCursorLine = { bg = background_alt },
  -- NvimTreeEmptyFolderName = {fg = gray, style = "italic", },
  -- NvimTreeEndOfBuffer = {fg = tree_gray, },
  -- NvimTreeExecFile = {fg = "#9FBA89", },
  NvimTreeGitIgnored = { guifg = comment },
  -- NvimTreeGitignoreIcon = {fg = "#E64A19", },
  -- NvimTreeImageFile = {fg = light_gray, },
  -- NvimTreeOpenedFolderName = {fg = folder_blue, style = "bold,italic", },
  -- NvimTreeSymlink = {fg = cyan, },
  -- NvimTreeVertSplit = {fg = alt_bg, bg = alt_bg, },
  NvimTreeExecFile = {guifg = foreground, gui = 'none'},
  NvimTreeFolderName = { guifg = foreground },
  NvimTreeGitDeleted = G.SignDelete,
  NvimTreeGitDirty = G.SignChange,
  NvimTreeGitMerge = G.SignChange,
  NvimTreeGitNew = G.SignAdd,
  NvimTreeGitRenamed = G.SignAdd,
  NvimTreeGitStaged = G.SignAdd,
  NvimTreeImageFile = {guifg = foreground, gui = 'none'},
  NvimTreeIndentMarker = G.IndentGuides,
  NvimTreeNormal = {guifg = foreground},
  NvimTreeRootFolder = {guifg = foreground},
  NvimTreeSpecialFile = {guifg = foreground, gui = 'none'},
  NvimTreeFolderIcon = {guifg = foreground },
  NvimTreeOpenedFile = { guifg = foreground, gui = 'bold'},
})

highlight({
  TelescopeSelection = { guifg = foreground },
  TelescopeMatching = { guifg = foreground, gui = "bold" },
  TelescopeBorder = { guifg = foreground },
})

highlight({
  IndentBlanklineChar        = G.IndentGuides,
  IndentBlanklineContextChar = { guifg = foreground, gui = 'nocombine' },
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
  LualineNormalA = { guifg = background, guibg = foreground, gui = 'none' },
  LualineNormalB = { guifg = foreground, guibg = background_alt },
  LualineNormalC = { guifg = foreground_alt, guibg = background_alt },
  LualineVisualA = { guifg = background, guibg = foreground, gui = 'none' },
  LualineVisualB = { guifg = foreground, guibg = background_alt },
  LualineVisualC = { guifg = foreground_alt, guibg = background_alt },
  LualineReplaceA = { guifg = background, guibg = foreground, gui = 'none' },
  LualineReplaceB = { guifg = foreground, guibg = background_alt },
  LualineReplaceC = { guifg = foreground_alt, guibg = background_alt },
  LualineInsertA = { guifg = background, guibg = foreground, gui = 'none' },
  LualineInsertB = { guifg = foreground, guibg = background_alt },
  LualineInsertC = { guifg = foreground_alt, guibg = background_alt },
})
