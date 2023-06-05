if vim.fn.exists('syntax_on') then
  vim.cmd('syntax reset')
end

vim.cmd('set termguicolors')

local highlight_groups_enum = {
  -- TabLineSel = {fg = white, bg = alt_bg, },
  -- TooLong      = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  -- VisualNOS    = { guifg = red, guibg = nil, gui = nil, guisp = nil },
  Bold = 'Bold',
  ColorColumn = 'ColorColumn',
  Conceal = 'Conceal',
  Cursor = 'Cursor',
  CursorColumn = 'CursorColumn',
  CursorLine   = 'CursorLine',
  CursorLineNr = 'CursorLineNr',
  Directory = 'Directory',
  ErrorMsg = 'ErrorMsg',
  FoldColumn   = 'FoldColumn',
  Folded       = 'Folded',
  IncSearch    = 'IncSearch',
  Italic       = 'Italic',
  LineNr       = 'LineNr',
  MatchParen   = 'MatchParen',
  ModeMsg      = 'ModeMsg',
  MoreMsg      = 'MoreMsg',
  NonText      = 'NonText',
  Normal       = 'Normal',
  PMenu        = 'PMenu',
  PMenuSel     = 'PMenuSel',
  Question     = 'Question',
  QuickFixLine = 'QuickFixLine',
  Search       = 'Search',
  SignColumn   = 'SignColumn',
  SpecialKey   = 'SpecialKey',
  StatusLine   = 'StatusLine',
  StatusLineNC = 'StatusLineNC',
  Substitute   = 'Substitute',
  TabLine      = 'TabLine',
  TabLineFill  = 'TabLineFill',
  TabLineSel   = 'TabLineSel',
  Title        = 'Title',
  VertSplit    = 'VertSplit',
  Visual       = 'Visual',
  WarningMsg   = 'WarningMsg',
  WildMenu     = 'WildMenu',
  WinBar       = 'WinBar',
  WinBarNC     = 'WinBarNC',

  -- SYNTAX --
  -- [ *Comment ]
  Comment = 'Comment',

  -- [ *Constant ]
  Constant = 'Constant',
  String = 'String',
  Character = 'Character',
  Number = 'Number',
  Boolean = 'Boolean',
  Float = 'Float',

  -- [ *Identifier ]
  Identifier = 'Identifier',
  Function = 'Function',

  -- [ *Statement ]
  Statement    = 'Statement',
  Conditional  = 'Conditional',
  Repeat       = 'Repeat',
  Label        = 'Label',
  Operator     = 'Oprator',
  Keyword      = 'Keyword',
  Exception    = 'Exception',

  -- [ *PreProc ]
  PreProc      = 'PreProc',
  Include      = 'Include',
  Define       = 'Define',
  Macro        = 'Macro',
  PreCondit    = 'PreCondit',

  -- [ *Type ]
  Type         = 'Type',
  StorageClass = 'StorageClass',
  Structure    = 'Structure',
  Typedef      = 'Typedef',

  -- [ *Special ]
  Special      = 'Special',
  SpecialChar  = 'SpecialChar',
  Tag          = 'Tag',
  Delimiter    = 'Delimiter',
  -- SpecialComment = {fg = gray, },
  Debug        = 'Debug',

  -- [ *Underlined ]
  Underlined   = 'Underlined',

  -- [ *Ignore ]
  -- Ignore = {fg = cyan, bg = bg, style = "bold", },

  -- [ *Error ]
  Error        = 'Error',

  -- [ *Todo ]
  Todo         = 'Todo',
  Variable = 'Variable',

  -- TREESITTER --
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
  ["@boolean"] = '@boolean',
  ["@comment"] = '@comment',
  ["@conditional"] = '@conditional',
  ["@conditional.ternary"] = '@conditional.ternary',
  ["@constant"] = '@constant',
  ["@constant.builtin"] = '@constant.builtin',
  ["@constant.macro"] = '@constant.macro',
  ["@constructor"] = '@constructor',
  ["@debug"] = '@debug',
  ["@definition"] = '@definition',
  ["@definition.associated"] = '@definition.associated',
  ["@definition.enum"] = '@definition.enum',
  ["@definition.field"] = '@definition.field',
  ["@definition.function"] = '@definition.function',
  ["@definition.import"] = '@definition.import',
  ["@definition.macro"] = '@definition.macro',
  ["@definition.method"] = '@definition.method',
  ["@definition.namespace"] = '@definition.namespace',
  ["@definition.parameter"] = '@definition.parameter',
  ["@definition.type"] = '@definition.type',
  ["@definition.var"] = '@definition.var',
  ["@error"] = '@error',
  ["@exception"] = '@keyword',
  ["@field"] = '@field',
  ["@float"] = '@float',
  ["@function"] = '@function',
  ["@function.builtin"] = '@function.builtin',
  ["@function.call"] = '@function.call',
  ["@function.macro"] = '@function.macro',
  ["@include"] = '@include',
  ["@keyword"] = '@keyword',
  ["@keyword.function"] = '@keyword.function',
  ["@keyword.operator"] = '@keyword.operator',
  ["@keyword.return"] = '@keyword.return',
  ["@label"] = '@label',
  ["@method"] = '@method',
  ["@method.call"] = '@method.call',
  ["@namespace"] = '@namespace',
  ["@number"] = '@number',
  ["@operator"] = '@operator',
  ["@parameter"] = '@parameter',
  ["@preproc"] = '@preproc',
  ["@property"] = '@property',
  ["@punctuation.bracket"] = '@punctuation.bracket',
  ["@punctuation.delimiter"] = '@punctuation.delimiter',
  ["@punctuation.special"] = '@punctuation.special',
  ["@repeat"] = '@repeat',
  ["@string"] = '@string',
  ["@string.escape"] = '@string.escape',
  ["@string.regex"] = '@string.regex',
  ["@string.special"] = '@string.special',
  ["@tag"] = '@tag',
  ["@tag.attribute"] = '@tag.delimiter',
  ["@tag.delimiter"] = '@tag.delimiter',
  ["@text"] = '@text',
  ["@type"] = '@type',
  ["@type.builtin"] = '@type.builtin',
  ["@type.definition"] = '@type.definition',
  ["@type.qualifier"] = '@type.qualifier',
  ["@variable"] = '@variable',
  ["@variable.builtin"] = '@variable.builtin',

  -- SIGNS --
  SignAdd = 'SignAdd',
  SignChange = 'SignChange',
  SignDelete = 'SignDelete',
  GitSignsAdd = 'GitSignsAdd',
  GitSignsChange = 'GitSignsChange',
  GitSignsDelete = 'GitSignsDelete',

  -- NVIM TREE --
  -- NvimTreeCursorLine = { bg = bg_selection },
  -- NvimTreeEmptyFolderName = {fg = gray, style = "italic", },
  -- NvimTreeEndOfBuffer = {fg = tree_gray, },
  -- NvimTreeExecFile = {fg = "#9FBA89", },
  -- NvimTreeGitIgnored = {fg = gray, style = "italic", },
  -- NvimTreeGitignoreIcon = {fg = "#E64A19", },
  -- NvimTreeImageFile = {fg = light_gray, },
  -- NvimTreeOpenedFolderName = {fg = folder_blue, style = "bold,italic", },
  -- NvimTreeSymlink = {fg = cyan, },
  -- NvimTreeVertSplit = {fg = alt_bg, bg = alt_bg, },
  NvimTreeExecFile = 'NvimTreeExecFile',
  NvimTreeFolderName = 'NvimTreeFolderName',
  NvimTreeGitDeleted = 'NvimTreeGitDeleted',
  NvimTreeGitDirty = 'NvimTreeGitDirty',
  NvimTreeGitMerge = 'NvimTreeGitMerge',
  NvimTreeGitNew = 'NvimTreeGitNew',
  NvimTreeGitRenamed = 'NvimTreeGitRenamed',
  NvimTreeGitStaged = 'NvimTreeGitStaged',
  NvimTreeImageFile = 'NvimTreeImageFile',
  NvimTreeIndentMarker = 'NvimTreeIndentMarker',
  NvimTreeNormal = 'NvimTreeNormal',
  NvimTreeRootFolder = 'NvimTreeRootFolder',
  NvimTreeSpecialFile = 'NvimTreeSpecialFile',
  NvimTreeFolderIcon = 'NvimTreeFolderIcon',
  NvimTreeOpenedFile = 'NvimTreeOpenedFile',
}

-- highlight({
--   TelescopeSelection = { guifg = blue },
--   TelescopeMatching = { guifg = yellow, gui = "bold" },
--   TelescopeBorder = { guifg = blue },
-- })
--
-- highlight({
--   IndentBlanklineChar        = G.IndentGuides,
--   IndentBlanklineContextChar = { guifg = fg_secondary, gui = 'none',},
-- })
--
-- highlight({
--   DiagnosticError = G.Error,
--   DiagnosticWarn = G.Warn,
--   DiagnosticHint = G.Hint,
--   DiagnosticInfo = G.Info,
-- })
--
-- highlight({
--   DiffAdd = G.DiffAdd,
--   DiffDelete = G.DiffDelete,
--   DiffChange = G.DiffChange,
--   DiffText = G.DiffText,
-- })
--
-- highlight({
--   LualineNormalA = { guifg = bg_primary, guibg = blue, gui = 'bold' },
--   LualineNormalB = { guifg = blue, guibg = bg_secondary },
--   LualineNormalC = { guifg = fg_secondary, guibg = bg_secondary },
--   LualineVisualA = { guifg = bg_primary, guibg = orange, gui = 'bold' },
--   LualineVisualB = { guifg = orange, guibg = bg_secondary },
--   LualineVisualC = { guifg = fg_secondary, guibg = bg_secondary },
--   LualineReplaceA = { guifg = bg_primary, guibg = red, gui = 'bold' },
--   LualineReplaceB = { guifg = red, guibg = bg_secondary },
--   LualineReplaceC = { guifg = fg_secondary, guibg = bg_secondary },
--   LualineInsertA = { guifg = bg_primary, guibg = green, gui = 'bold' },
--   LualineInsertB = { guifg = green, guibg = bg_secondary },
--   LualineInsertC = { guifg = fg_secondary, guibg = bg_secondary },
-- })
--
--

local create_theme_builder = function ()
  local this = {}
  this.hash_table = {}

  function set_color_property(property_name, color, higlight_groups_names)
    for _, higlight_group_name in ipairs(higlight_groups_names) do
      local highlight_group_definition = this.hash_table[higlight_group_name] or {}
      highlight_group_definition[property_name] = color
      this.hash_table[higlight_group_name] = highlight_group_definition
    end
  end

  this.set_guifg_color = function(color, higlight_groups_names)
    set_color_property('guifg', color, higlight_groups_names)
  end

  this.set_guibg_color = function(color, higlight_groups_names)
    set_color_property('guifg', color, higlight_groups_names)
  end

  this.set_gui = function (gui, higlight_groups_names)
    for _, higlight_group_name in ipairs(higlight_groups_names) do
      local highlight_group_definition = this.hash_table[higlight_group_name] or {}
      local highlight_group_gui = highlight_group_definition.gui or {}

      table.insert(highlight_group_gui, gui)
      highlight_group_definition.gui = highlight_group_gui

      this.hash_table[higlight_group_name] = highlight_group_definition
    end
  end

  this.higlight = function ()
    P(this.hash_table)
  end

  -- this.link(higlig)

  return this
end

return {
  create_theme_builder = create_theme_builder,
  highlight_groups_enum = highlight_groups_enum
}
