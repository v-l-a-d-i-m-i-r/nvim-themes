local utils = require('themes.utils')
local highlight = utils.highlight
local map_treesitter_key_to_legacy = utils.treesitter_map_to_legacy

-- local red          = "#cc5733" --base08  
local orange       = "#ce9178" --base09
local yellow       = "#cdcd9d" --base0A
local green        = "#41a490" --base0B
local cyan         = "#94cceb" --base0C
local blue         = "#5496d4" --base0D

local gui = {
  none = 'none',
  bold = 'bold',
  italic = 'italic',
}

local required_params = {
  'bg_primary',
  'bg_secondary',
  'bg_selection',
  'fg_comments',
  'fg_secondary',
  'fg_primary',
  'fg_tertiary',
  'bg_tertiary',

  'fg_function',
  'fg_keyword',
  'fg_property',
  'fg_string',
  'fg_number',
  'fg_boolean',
  'fg_variable',
  'fg_type',
  'fg_tag',
  'fg_operator',
  'fg_regex',
  'fg_text',
  'fg_pre_proc',
  'fg_conceal',
  'fg_macro',
  'fg_debug',

  'fg_sign_add',
  'fg_sign_change',
  'fg_sign_delete',

  'fg_error',
  'fg_warn',
  'fg_hint',
  'fg_info',

  'bg_diff_add',
  'bg_diff_delete',
  'bg_diff_change',
  'bg_diff_text',

  'fg_indent_guides',

  'bg_lualine_replace_a',
  'fg_lualine_replace_b',
}

function validate(params)
  for _, key in ipairs(required_params) do
    if params[key] == nil then
      error(key .. ' param is required')
    end
  end
end

local M = {}

M.setup = function (c)
  validate(c)

  local G = {
    Function = { guifg = c.fg_function, gui = 'none' },
    Keyword = { guifg = c.fg_keyword, gui = 'none' },
    Property = { guifg = c.fg_property, gui = 'none' },
    String = { guifg = c.fg_string, gui = 'none' },
    Number = { guifg = c.fg_number, gui = 'none' },
    Boolean = { guifg = c.fg_boolean, gui = 'none' },
    Variable = { guifg = c.fg_variable, gui = 'none' },
    Type = { guifg = c.fg_type, gui = 'none' },
    Tag = { guifg = c.fg_tag, gui = 'none' },
    Punctuation = { guifg = c.fg_operator, gui = 'none' },
    SignAdd = { guifg = c.fg_sign_add, gui = 'none' },
    SignChange = { guifg = c.fg_sign_change, gui = 'none' },
    SignDelete = { guifg = c.fg_sign_delete, gui = 'none' },
    Error = { guifg = c.fg_error, gui = 'none', guibg = 'none' },
    Warn = { guifg = c.fg_warn, gui = 'none' },
    Hint = { guifg = c.fg_hint, gui = 'none' },
    Info = { guifg = c.fg_info, gui = 'none' },
    Comments = { guifg = c.fg_comments, gui = 'none' },
    IndentGuides = { guifg = c.fg_indent_guides, gui = 'none' },
    Regex = { guifg = c.fg_regex, gui = 'none' },
    Text = { guifg = c.fg_text, gui = 'none' },
    DiffAdd = { guifg = "none" , guibg = c.bg_diff_add },
    DiffDelete = { guifg = "none" , guibg = c.bg_diff_delete },
    DiffChange = { guifg = "none" , guibg = c.bg_diff_change },
    DiffText = { guifg = "none" , guibg = c.bg_diff_text },
    PreProc = { guifg = c.fg_pre_proc, gui = 'none' }
  }

  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.cmd('set termguicolors')

  highlight({
    -- TabLineSel = {fg = white, c.bg = alt_bg, },
    -- TooLong      = { guifg = red, guibg = nil, gui = nil, guisp = nil },
    -- VisualNOS    = { guifg = red, guibg = nil, gui = nil, guisp = nil },
    Bold         = { guifg = nil, guibg = nil, gui = 'bold', guisp = nil },
    ColorColumn  = { guifg = nil, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    Conceal      = { guifg = c.fg_conceal, guibg = c.bg_primary, gui = nil, guisp = nil },
    Cursor       = { guifg = c.bg_primary, guibg = c.fg_primary, gui = nil, guisp = nil },
    CursorColumn = { guifg = nil, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    CursorLine   = { guifg = nil, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    CursorLineNr = { guifg = yellow, guibg = c.bg_secondary, gui = nil, guisp = nil },
    Directory    = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
    -- ErrorMsg     = { guifg = red, guibg = c.bg_primary, gui = nil, guisp = nil },
    ErrorMsg = G.Error,
    Exception    = G.Error,
    FoldColumn   = { guifg = cyan, guibg = c.bg_primary, gui = nil, guisp = nil },
    Folded       = { guifg = c.fg_comments, guibg = c.bg_secondary, gui = nil, guisp = nil },
    IncSearch    = { guifg = c.bg_primary, guibg = yellow, gui = 'none', guisp = nil },
    Italic       = { guifg = nil, guibg = nil, gui = 'italic', guisp = nil },
    LineNr       = { guifg = c.fg_secondary, guibg = c.bg_primary, gui = nil, guisp = nil },
    Macro        = { guifg = c.fg_macro, guibg = nil, gui = nil, guisp = nil },
    MatchParen   = { guifg = nil, guibg = c.fg_comments, gui = nil, guisp = nil },
    ModeMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
    MoreMsg      = { guifg = green, guibg = nil, gui = nil, guisp = nil },
    NonText      = { guifg = c.bg_primary, guibg = nil, gui = nil, guisp = nil },
    Normal       = { guifg = c.fg_primary, guibg = c.bg_primary, gui = nil, guisp = nil },
    PMenu        = { guifg = c.fg_primary, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    PMenuSel     = { guifg = c.bg_secondary, guibg = c.fg_primary, gui = nil, guisp = nil },
    Question     = { guifg = blue, guibg = nil, gui = nil, guisp = nil },
    QuickFixLine = { guifg = nil, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    Search       = { guifg = c.bg_primary, guibg = yellow, gui = nil, guisp = nil },
    SignColumn   = { guifg = c.fg_secondary, guibg = c.bg_primary, gui = nil, guisp = nil },
    SpecialKey   = { guifg = c.fg_comments, guibg = nil, gui = nil, guisp = nil },
    StatusLine   = { guifg = c.fg_primary, guibg = c.bg_selection, gui = 'none', guisp = nil },
    StatusLineNC = { guifg = c.fg_secondary, guibg = c.bg_secondary, gui = 'none', guisp = nil },
    Substitute   = { guifg = c.bg_secondary, guibg = yellow, gui = 'none', guisp = nil },
    TabLine      = { guifg = c.fg_secondary, guibg = c.bg_selection, gui = 'none', guisp = nil },
    TabLineFill  = { guifg = nil, guibg = c.bg_selection, gui = 'none', guisp = nil },
    TabLineSel   = { guifg = c.fg_primary, guibg = c.bg_primary, gui = 'none', guisp = nil },
    Title        = { guifg = blue, guibg = nil, gui = 'none', guisp = nil },
    VertSplit    = { guifg = c.fg_primary, guibg = c.bg_primary, gui = 'none', guisp = nil },
    Visual       = { guifg = nil, guibg = c.bg_selection, gui = nil, guisp = nil },
    WarningMsg   = { guifg = G.Warn.guifg, guibg = nil, gui = nil, guisp = nil },
    WildMenu     = { guifg = red, guibg = yellow, gui = nil, guisp = nil },
    WinBar       = { guifg = c.fg_primary, guibg = nil, gui = 'none', guisp = nil },
    WinBarNC     = { guifg = c.fg_secondary, guibg = nil, gui = 'none', guisp = nil },
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
    SpecialChar  = { guifg = c.fg_tertiary, guibg = nil, gui = nil, guisp = nil },
    Tag          = G.Tag,
    Delimiter    = G.Punctuation,
    -- SpecialComment = {fg = gray, },
    Debug        = { guifg = c.fg_debug, guibg = nil, gui = nil, guisp = nil },

    -- [ *Underlined ]
    Underlined   = { guifg = nil, guibg = nil, gui = 'underline', guisp = nil },

    -- [ *Ignore ]
    -- Ignore = {fg = cyan, c.bg = c.bg, style = "bold", },

    -- [ *Error ]
    Error        = G.Error,

    -- [ *Todo ]
    Todo         = { guifg = blue, guibg = c.bg_secondary, gui = nil, guisp = nil },
    -- Variable = G.Variable,
  })

  local treesitter_higlights = {
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
  }
  highlight(treesitter_higlights)
  highlight(map_treesitter_key_to_legacy(treesitter_higlights))

  highlight({
    SignAdd = G.SignAdd,
    SignChange = G.SignChange,
    SignDelete = G.SignDelete,
    GitSignsAdd = G.SignAdd,
    GitSignsChange = G.SignChange,
    GitSignsDelete = G.SignDelete,
  })

  highlight({
    -- NvimTreeCursorLine = { c.bg = c.bg_selection },
    -- NvimTreeEmptyFolderName = {fg = gray, style = "italic", },
    -- NvimTreeEndOfBuffer = {fg = tree_gray, },
    -- NvimTreeExecFile = {fg = "#9FBA89", },
    -- NvimTreeGitIgnored = {fg = gray, style = "italic", },
    -- NvimTreeGitignoreIcon = {fg = "#E64A19", },
    -- NvimTreeImageFile = {fg = light_gray, },
    -- NvimTreeOpenedFolderName = {fg = folder_blue, style = "bold,italic", },
    -- NvimTreeSymlink = {fg = cyan, },
    -- NvimTreeVertSplit = {fg = alt_bg, c.bg = alt_bg, },
    NvimTreeExecFile = {guifg = c.fg_primary, gui = 'none'},
    NvimTreeFolderName = {guifg = blue},
    NvimTreeGitDeleted = G.SignDelete,
    NvimTreeGitDirty = G.SignChange,
    NvimTreeGitMerge = G.SignChange,
    NvimTreeGitNew = G.SignAdd,
    NvimTreeGitRenamed = G.SignAdd,
    NvimTreeGitStaged = G.SignAdd,
    NvimTreeImageFile = {guifg = c.fg_primary, gui = 'none'},
    NvimTreeIndentMarker = G.IndentGuides,
    NvimTreeNormal = {guifg = c.fg_primary},
    NvimTreeRootFolder = {guifg = c.fg_primary},
    NvimTreeSpecialFile = {guifg = c.fg_primary, gui = 'none'},
    NvimTreeFolderIcon = {guifg = blue },
    NvimTreeOpenedFile = { guifg = orange},
  })

  highlight({
    TelescopeSelection = { guifg = blue },
    TelescopeMatching = { guifg = yellow, gui = "bold" },
    TelescopeBorder = { guifg = blue },
  })

  highlight({
    IndentBlanklineChar        = G.IndentGuides,
    IndentBlanklineContextChar = { guifg = c.fg_secondary, gui = 'none',},
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
    LualineNormalA = { guifg = c.bg_primary, guibg = blue, gui = 'bold' },
    LualineNormalB = { guifg = blue, guibg = c.bg_secondary },
    LualineNormalC = { guifg = c.fg_secondary, guibg = c.bg_secondary },
    LualineVisualA = { guifg = c.bg_primary, guibg = orange, gui = 'bold' },
    LualineVisualB = { guifg = orange, guibg = c.bg_secondary },
    LualineVisualC = { guifg = c.fg_secondary, guibg = c.bg_secondary },
    LualineReplaceA = { guifg = c.bg_primary, guibg = c.bg_lualine_replace_a, gui = 'bold' },
    LualineReplaceB = { guifg = c.fg_lualine_replace_b, guibg = c.bg_secondary },
    LualineReplaceC = { guifg = c.fg_secondary, guibg = c.bg_secondary },
    LualineInsertA = { guifg = c.bg_primary, guibg = green, gui = 'bold' },
    LualineInsertB = { guifg = green, guibg = c.bg_secondary },
    LualineInsertC = { guifg = c.fg_secondary, guibg = c.bg_secondary },
  })
end

return M
