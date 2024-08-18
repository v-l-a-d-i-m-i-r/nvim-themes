local hex = require("themes.utils").hex
local Builder = require("themes.builder")

local required_params = {
  "bg_primary",
  "bg_secondary",
  "fg_primary",
  "fg_secondary",
  "bg_selection",

  "keyword",
  "variable",
  "func",
  "string",
  "boolean",
  "comment",

  "error",
  "warn",
  "info",
  "hint",

  "sign_add",
  "sign_delete",
  "sign_change",
  "sign_text",

  "diff_add",
  "diff_delete",
  "diff_change",
  "diff_text",

  "mode_normal",
  "mode_insert",
  "mode_visual",
  "mode_replace",
}

local function validate(params)
  for _, key in ipairs(required_params) do
    if params[key] == nil then
      error(key .. ' param is required')
    end
  end
end

local function build(params)
  validate(params)
  -- INTERFACE
  local bg_primary = params.bg_primary
  local bg_secondary = params.bg_secondary
  local fg_primary = params.fg_primary
  local fg_secondary = params.fg_secondary
  local bg_selection = params.bg_selection

  -- SYNTAX
  local keyword = params.keyword
  local variable = params.variable
  local func = params.func
  local string = params.string
  local boolean = params.boolean
  local comment = params.comment

  local error = params.error
  local warn = params.warn
  local info = params.info
  local hint = params.hint

  local sign_add = params.sign_add
  local sign_delete = params.sign_delete
  local sign_change = params.sign_change
  local sign_text = params.sign_text

  local diff_add = params.diff_add
  local diff_delete = params.diff_delete
  local diff_change = params.diff_change
  local diff_text = params.diff_text

  local mode_normal = params.mode_normal
  local mode_insert = params.mode_insert
  local mode_visual = params.mode_visual
  local mode_replace = params.mode_replace

  local bg_bufferline_fill = bg_selection
  local fg_bufferline_separator = comment
  local bg_bufferline_tab = bg_bufferline_fill
  local bg_bufferline_tab_active = bg_primary
  local bg_bufferline_tab_visible = bg_primary
  local fg_bufferline_tab = fg_secondary
  local fg_bufferline_tab_active = fg_primary
  local fg_bufferline_tab_visible = fg_secondary

  local G = {
    Text = { guifg = fg_primary, guibg = 'none', gui = 'none', guisp = 'none' },
    TextSecondary = { guifg = fg_secondary, guibg = 'none', gui = 'none', guisp = 'none' },
    Keyword = { guifg = keyword, guibg = 'none', gui = 'none', guisp = 'none' },
    Variable = { guifg = variable, guibg = 'none', gui = 'none', guisp = 'none' },
    Function = { guifg = func, guibg = 'none', gui = 'none', guisp = 'none' },
    String = { guifg = string, guibg = 'none', gui = 'none', guisp = 'none' },
    Boolean = { guifg = boolean, guibg = 'none', gui = 'none', guisp = 'none' },
    Comment = { guifg = comment, guibg = 'none', gui = 'none', guisp = 'none' },

    Error = { guifg = error, guibg = 'none', gui = 'none', guisp = 'none' },
    Warn = { guifg = warn, guibg = 'none', gui = 'none', guisp = 'none' },
    Info = { guifg = info, guibg = 'none', gui = 'none', guisp = 'none' },
    Hint = { guifg = hint, guibg = 'none', gui = 'none', guisp = 'none' },

    Delimiter = { guifg = fg_primary, guibg = 'none', gui = 'none', guisp = 'none' },

    SignAdd = { guifg = sign_add, guibg = 'none', gui = 'none', guisp = 'none' },
    SignDelete = { guifg = sign_delete, guibg = 'none', gui = 'none', guisp = 'none' },
    SignChange = { guifg = sign_change, guibg = 'none', gui = 'none', guisp = 'none' },

    DiffAdd = { guifg = 'none', guibg = diff_add, gui = 'none', guisp = 'none' },
    DiffDelete = { guifg = 'none', guibg = diff_delete, gui = 'none', guisp = 'none' },
    DiffChange = { guifg = 'none', guibg = diff_change, gui = 'none', guisp = 'none' },
    DiffText = { guifg = 'none', guibg = diff_text, gui = 'none', guisp = 'none' },

    IndentGuides = { guifg = comment, guibg = 'none', gui = 'none', guisp = 'none' },
  }


  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.cmd('set termguicolors')

local builder = Builder()

builder
  .highlight('Bold', { guifg = nil, guibg = nil, gui = 'bold', guisp = nil })
  .highlight('ColorColumn', { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil })
  -- highlight('Conceal', { guifg = c.fg_conceal, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('CurSearch', { guifg = bg_primary, guibg = error, gui = nil, guisp = nil })
  .highlight('Cursor', { guifg = bg_primary, guibg = fg_primary, gui = nil, guisp = nil })
  .highlight('CursorColumn', { guifg = nil, guibg = bg_selection, gui = 'none', guisp = nil })
  .highlight('CursorLine', { guifg = nil, guibg = bg_selection, gui = 'none', guisp = nil })
  .highlight('CursorLineNr', { guifg = fg_secondary, guibg = 'none', gui = nil, guisp = nil })
  .highlight('Directory', { guifg = fg_primary, guibg = nil, gui = nil, guisp = nil })
  -- .highlight('ErrorMsg', { guifg = error, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('ErrorMsg', G.Error)
  .link('Exception', 'ErrorMsg')
  .highlight('FoldColumn', { guifg = fg_primary, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('Folded', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('IncSearch', { guifg = bg_primary, guibg = warn, gui = 'none', guisp = nil })
  .highlight('Italic', { guifg = nil, guibg = nil, gui = 'italic', guisp = nil })
  .highlight('LineNr', { guifg = comment, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('Macro', { guifg = bg_primary, guibg = nil, gui = nil, guisp = nil })
  .highlight('MatchParen', { guifg = nil, guibg = comment, gui = nil, guisp = nil })
  .highlight('ModeMsg', { guifg = info, guibg = nil, gui = nil, guisp = nil })
  .highlight('MoreMsg', { guifg = info, guibg = nil, gui = nil, guisp = nil })
  .highlight('NonText', { guifg = bg_primary, guibg = 'none', gui = 'none', guisp = 'none' })
  .highlight('Normal', { guifg = fg_primary, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('NormalFloat', { guifg = 'none', guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('PMenu', { guifg = fg_primary, guibg = bg_secondary, gui = 'none', guisp = nil })
  .highlight('PMenuSel', { guifg = bg_secondary, guibg = fg_primary, gui = nil, guisp = nil })
  .highlight('Question', { guifg = info, guibg = nil, gui = nil, guisp = nil })
  .highlight('QuickFixLine', { guifg = nil, guibg = bg_secondary, gui = 'none', guisp = nil })
  .highlight('Search', { guifg = bg_primary, guibg = warn, gui = nil, guisp = nil })
  .highlight('SignColumn', { guifg = fg_secondary, guibg = bg_primary, gui = nil, guisp = nil })
  .highlight('SpecialKey', { guifg = comment, guibg = nil, gui = nil, guisp = nil })
  .highlight('StatusLine', { guifg = fg_primary, guibg = bg_selection, gui = 'none', guisp = nil })
  .highlight('StatusLineNC', { guifg = fg_secondary, guibg = bg_secondary, gui = 'none', guisp = nil })
  .highlight('Substitute', { guifg = bg_secondary, guibg = warn, gui = 'none', guisp = nil })
  .highlight('TabLine', { guifg = fg_bufferline_tab, guibg = bg_bufferline_tab, gui = 'none', guisp = nil })
  .highlight('TabLineFill', { guifg = 'none', guibg = bg_bufferline_fill, gui = 'none', guisp = nil })
  .highlight('TabLineSel', { guifg = fg_bufferline_tab_active, guibg = bg_bufferline_tab_active, gui = 'none', guisp = nil })
  .highlight('Title', { guifg = info, guibg = nil, gui = 'none', guisp = nil })
  .highlight('VertSplit', { guifg = fg_primary, guibg = bg_primary, gui = 'none', guisp = nil })
  .highlight('Visual', { guifg = nil, guibg = bg_selection, gui = nil, guisp = nil })
  .highlight('WarningMsg', { guifg = warn, guibg = nil, gui = nil, guisp = nil })
  .highlight('WildMenu', { guifg = error, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('WinBar', { guifg = fg_primary, guibg = nil, gui = 'none', guisp = nil })
  .highlight('WinBarNC', { guifg = fg_secondary, guibg = nil, gui = 'none', guisp = nil })
  .highlight('DiffAdd', G.DiffAdd)
  .highlight('DiffDelete', G.DiffDelete)
  .highlight('DiffChange', G.DiffChange)
  .highlight('DiffText', G.DiffText)
  .link('DiagnosticError', 'Error')
  .highlight('DiagnosticWarn', G.Warn)
  .highlight('DiagnosticHint', G.Hint)
  .highlight('DiagnosticInfo', G.Info)

  -- [ *Comment ]
  .highlight('Comment', G.Comment)

  -- [ *Constant ]
  .highlight('Constant', G.Text)
  .highlight('String', G.String)
  .link('Character', 'String')
  .highlight('Number', G.Text)
  .link('Boolean', 'Keyword')
  .link('Float', 'Number')

  -- [ *Identifier ]
  .highlight('Identifier', G.Text)
  .highlight('Function', G.Function)

  -- [ *Statement ]
  .link('Statement', 'Keyword')
  .link('Conditional', 'Keyword')
  .link('Repeat', 'Keyword')
  .link('Label', 'Keyword')
  .link('Operator', 'Keyword')
  .highlight('Keyword', G.Keyword)
  .link('Exception', 'Keyword')

  -- [ *PreProc ]
  .link('PreProc', 'Keyword')
  .link('Include', 'Keyword')
  .link('Define', 'Keyword')
  .link('Macro', 'Keyword')
  .link('PreCondit', 'Keyword')

  -- [ *Type ]
  .link('Type', 'Function')
  .link('StorageClass', 'Function')
  .link('Structure', 'Function')
  .link('Typedef', 'Function')

  -- [ *Special ]
  .link('Special', 'Keyword')
  .link('SpecialChar', 'Keyword')
  .link('Tag', 'Keyword')
  .highlight('Delimiter', G.Delimiter)
  .link('SpecialComment', 'Comment')
  .highlight('Debug', { guifg = error, guibg = nil, gui = nil, guisp = nil })

  -- [ *Underlined ]
  .highlight('Underlined', { gui = 'underline' })

  -- [ *Ignore ]
  .link('Ignore', 'Underlined')

  -- [ *Error ]
  .highlight('Error', G.Error)

  -- [ *Todo ]
  .highlight('Todo', { guifg = info, guibg = nil, gui = nil, guisp = nil })
  .highlight('Variable', G.Variable)

  --
  -- TREESITTER
  --

  -- Misc
  .link('@comment', 'Comment')               -- line and block comments
  .link('@comment.documentation', 'Comment') -- comments documenting code
  .link('@error', 'Error')                 -- syntax/parser errors
  .highlight('@none', G.Text)                  -- completely disable the highlight
  .link('@preproc', 'PreProc')               -- various preprocessor directives & shebangs
  .link('@define', 'Define')                -- preprocessor definition directives
  .link('@operator', 'Operator')              -- symbolic operators (e.g. `+` / `*`)

  -- Punctuation
  .link('@punctuation.delimiter', 'Delimiter') -- delimiters (e.g. `;` / `.` / `,`)
  .link('@punctuation.bracket', 'Delimiter')   -- brackets (e.g. `()` / `{}` / `[]`)
  .highlight('@punctuation.special', G.Text)    -- special symbols (e.g. `{}` in string interpolation)

  -- Literals
  .link('@string', 'String')               -- string literals
  .link('@string.documentation', 'String') -- string documenting code (e.g. Python docstrings)
  .link('@string.regex', 'String')         -- regular expressions
  .link('@string.escape', 'String')        -- escape sequences
  .link('@string.special', 'String')       -- other special strings (e.g. dates)

  .link('@character', 'Character')            -- character literals
  .link('@character.special', 'SpecialChar')    -- special characters (e.g. wildcards)

  .link('@boolean', 'Boolean')              -- boolean literals
  .link('@number', 'Number')               -- numeric literals
  .link('@float', 'Float')                -- floating-point number literals

  -- Functions
  .link('@function', 'Function')         -- function definitions
  .link('@function.builtin', 'Function') -- built-in functions
  .link('@function.call', 'Function')    -- function calls
  .link('@function.macro', 'Makro')   -- preprocessor macros

  .link('@method', 'Function')           -- method definitions
  .link('@method.call', 'Function')      -- method calls

  .link('@constructor', 'Function')      -- constructor calls and definitions
  .link('@parameter', 'Variable')        -- parameters of a function

  -- Keywords
  .link('@keyword', 'Keyword')             -- various keywords
  .link('@keyword.coroutine', 'Keyword')   -- keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
  .link('@keyword.function', 'Keyword')    -- keywords that define a function (e.g. `func` in Go, `def` in Python)
  .link('@keyword.operator', 'Keyword')    -- operators that are English words (e.g. `and` / `or`)
  .link('@keyword.return', 'Keyword')      -- keywords like `return` and `yield`

  .link('@conditional', 'Conditional')         -- keywords related to conditionals (e.g. `if` / `else`)
  .link('@conditional.ternary', 'Keyword') -- ternary operator (e.g. `?` / `:`)

  .link('@repeat', 'Repeat')              -- keywords related to loops (e.g. `for` / `while`)
  .link('@debug', 'Debug')               -- keywords related to debugging
  .link('@label', 'Label')              -- GOTO and other labels (e.g. `label:` in C)
  .link('@include', 'Include')             -- keywords for including modules (e.g. `import` / `from` in Python)
  .link('@exception', 'Exception')           -- keywords related to exceptions (e.g. `throw` / `catch`)

  -- Types
  .link('@type', 'Type')            -- type or class definitions and annotations
  .link('@type.builtin', 'Type')    -- built-in types
  .link('@type.definition', 'Typedef') -- type definitions (e.g. `typedef` in C)
  .link('@type.qualifier', 'keyword')  -- type qualifiers (e.g. `const`) (public, static abstract, tested with typescript)

  .link('@storageclass', 'StorageClass')    -- modifiers that affect storage in memory or life-time
  .highlight('@attribute', G.Function)       -- attribute annotations (e.g. Python decorators)
  .highlight('@field', G.Text)           -- object and struct fields
  .highlight('@property', G.Text)        -- similar to `@field`

  -- Identifiers
  .link('@variable', 'Variable')         -- various variable names
  .link('@variable.builtin', 'Keyword') -- built-in variable names (e.g. `this`)

  .link('@constant', 'Constant')         -- constant identifiers
  .link('@constant.builtin', 'Constant') -- built-in constant values
  .link('@constant.macro', 'Constant')   -- constants defined by the preprocessor

  .link('@namespace', 'Variable')        -- modules or namespaces
  .link('@symbol', 'Variable')           -- symbols or atoms

  -- Text
  -- Mainly for markup languages.
  --
  -- @text                  ; non-structured text
  -- @text.strong           ; bold text
  -- @text.emphasis         ; text with emphasis
  -- @text.underline        ; underlined text
  -- @text.strike           ; strikethrough text
  -- @text.title            ; text that is part of a title
  -- @text.quote            ; text quotations
  -- @text.uri              ; URIs (e.g. hyperlinks)
  -- @text.math             ; math environments (e.g. `$ ... $` in LaTeX)
  -- @text.environment      ; text environments of markup languages
  -- @text.environment.name ; text indicating the type of an environment
  -- @text.reference        ; text references, footnotes, citations, etc.
  --
  -- @text.literal          ; literal or verbatim text (e.g., inline code)
  -- @text.literal.block    ; literal or verbatim text as a stand-alone block
  --                        ; (use priority 90 for blocks with injections)
  --
  -- @text.todo             ; todo notes
  -- @text.note             ; info notes
  -- @text.warning          ; warning notes
  -- @text.danger           ; danger/error notes
  --
  -- @text.diff.add         ; added text (for diff files)
  -- @text.diff.delete      ; deleted text (for diff files)

  -- Tags
  -- Used for XML-like tags.
  --
  -- @tag           ; XML tag names
  -- @tag.attribute ; XML tag attributes
  -- @tag.delimiter ; XML tag delimiters

  -- Conceal
  -- @conceal ; for captures that are only used for concealing
  -- @conceal must be followed by (#set! conceal "").

  -- Spell
  -- @spell   ; for defining regions to be spellchecked
  -- @nospell ; for defining regions that should NOT be spellchecked
  -- Priority
  -- Captures can be assigned a priority to control precedence of highlights via the #set! "priority" <number> directive (see :h treesitter-highlight-priority). The default priority for treesitter highlights is 100; queries should only set priorities between 90 and 120, to avoid conflict with other sources of highlighting (such as diagnostics or LSP semantic tokens).
  --
  -- Locals
  -- Note: pay specific attention to the captures here as they are a bit different to those listed in the upstream Local Variables docs. Some of these docs didn't exist when nvim-treesitter was created and the upstream captures are more limiting than what we have here.
  --
  .link('@definition', 'Variable')            -- various definitions
  .link('@definition.constant', 'Variable')   -- constants
  .link('@definition.function', 'Variable')   -- functions
  .link('@definition.method', 'Variable')     -- methods
  .link('@definition.var', 'Variable')        -- variables
  .link('@definition.parameter', 'Variable')  -- parameters
  .link('@definition.macro', 'Variable')      -- preprocessor macros
  .link('@definition.type', 'Variable')       -- types or classes
  .link('@definition.field', 'Variable')      -- fields or properties
  .link('@definition.enum', 'Variable')       -- enumerations
  .link('@definition.namespace', 'Variable')  -- modules or namespaces
  .link('@definition.import', 'Variable')     -- imported names
  .link('@definition.associated', 'Type') -- the associated type of a variable
  --
  -- @scope                 ; scope block
  -- @reference             ; identifier reference
  -- Definition Scope
  -- You can set the scope of a definition by setting the scope property on the definition.
  --
  -- For example, a JavaScript function declaration creates a scope. The function name is captured as the definition. This means that the function definition would only be available WITHIN the scope of the function, which is not the case. The definition can be used in the scope the function was defined in.
  --
  -- function doSomething() {}
  --
  -- doSomething(); // Should point to the declaration as the definition
  -- (function_declaration
  --   ((identifier) @definition.var)
  --    (#set! "definition.var.scope" "parent"))
  -- Possible scope values are:
  --
  -- parent: The definition is valid in the containing scope and one more scope above that scope
  -- global: The definition is valid in the root scope
  -- local: The definition is valid in the containing scope. This is the default behavior
  -- Folds
  -- You can define folds for a given language by adding a folds.scm query :
  -- @fold -- fold this node
  -- If the folds.scm query is not present, this will fall back to the @scope captures in the locals query.

  -- Injections
  -- Some captures are related to language injection (like markdown code blocks). They are used in injections.scm. You can directly use the name of the language that you want to inject (e.g. @html to inject html).
  --
  -- If you want to dynamically detect the language (e.g. for Markdown blocks) use the @language to capture the node describing the language and @content to describe the injection region.
  --
  -- @{lang}   ; e.g. @html to describe a html region
  --
  -- @language ; dynamic detection of the injection language (i.e. the text of the captured node describes the language)
  -- @content  ; region for the dynamically detected language
  -- @combined ; combine all matches of a pattern as one single block of content
  -- Indents
  -- @indent.begin       ; indent children when matching this node
  -- @indent.end         ; marks the end of indented block
  -- @indent.align       ; behaves like python aligned/hanging indent
  -- @indent.dedent      ; dedent children when matching this node
  -- @indent.branch      ; dedent itself when matching this node
  -- @indent.ignore      ; do not indent in this node
  -- @indent.auto        ; behaves like 'autoindent' buffer option
  -- @indent.zero        ; sets this node at position 0 (no indent)
  .link('@html.text.title', 'Normal')

  .unhighlight('@lsp.type.class') -- Structure
  .unhighlight('@lsp.type.decorator') -- Function
  .unhighlight('@lsp.type.enum') -- Structure
  .unhighlight('@lsp.type.enumMember') -- Constant
  .unhighlight('@lsp.type.function') -- Function
  .unhighlight('@lsp.type.interface') -- Structure
  .unhighlight('@lsp.type.macro') -- Macro
  .unhighlight('@lsp.type.method') -- Function
  .unhighlight('@lsp.type.namespace') -- Structure
  .unhighlight('@lsp.type.parameter') -- Identifier
  .unhighlight('@lsp.type.property') -- Identifier
  .unhighlight('@lsp.type.struct') -- Structure
  .unhighlight('@lsp.type.type') -- Type
  .unhighlight('@lsp.type.typeParameter') -- TypeDef
  .unhighlight('@lsp.type.variable') -- Identifier

  -- TELESCOPE
  .highlight('TelescopeSelection', { guifg = fg_primary, guibg = bg_selection, guisp = nil, gui = nil })
  .highlight('TelescopeMatching', { guifg = warn, guibg = nil, guisp = nil, gui = nil })
  .highlight('TelescopeBorder', { guifg = fg_primary, guibg = bg_primary, guisp = nil, gui = nil})
  .highlight('TelescopePromptCounter', { guifg = comment, guibg = bg_primary, guisp = nil, gui = nil})

  -- LUALINE
  .highlight('LualineNormalA', { guifg = bg_primary, guibg = mode_normal, gui = nil, guisp = nil })
  .highlight('LualineNormalB', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineNormalC', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineVisualA', { guifg = bg_primary, guibg = mode_visual, gui = nil, guisp = nil })
  .highlight('LualineVisualB', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineVisualC', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineReplaceA', { guifg = bg_primary, guibg = mode_replace, gui = nil, guisp = nil })
  .highlight('LualineReplaceB', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineReplaceC', { guifg = fg_secondary, guibg = bg_secondary })
  .highlight('LualineInsertA', { guifg = bg_primary, guibg = mode_insert, gui = nil, guisp = nil })
  .highlight('LualineInsertB', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })
  .highlight('LualineInsertC', { guifg = fg_secondary, guibg = bg_secondary, gui = nil, guisp = nil })

  -- .highlight('SignAdd', G.SignAdd)
  -- .highlight('SignDelete', G.SignDelete)
  -- .highlight('SignChange', G.SignChange)

  -- GITSIGN
  .highlight('GitSignsAdd', G.SignAdd)
  .highlight('GitSignsDelete', G.SignDelete)
  .highlight('GitSignsChange', G.SignChange)

  .highlight('IndentBlanklineChar', G.IndentGuides)
  .highlight('IndentBlanklineContextChar', G.TextSecondary)

  -- NVIM TREE --
  .highlight('NvimTreeNormal', { guifg = fg_primary, guibg = 'none', gui = 'none', guisp = 'none'})
  .highlight('NvimTreeIndentMarker', G.IndentGuides)
  .link('NvimTreeCursorLine', 'CursorLine')
  .link('NvimTreeCursorLineNr', 'CursorLineNr')
  .link('NvimTreeFolderIcon', 'Keyword')
  .link('NvimTreeSpecialFile', 'NvimTreeNormal')
  .link('NvimTreeExecFile', 'NvimTreeNormal')
  .link('NvimTreeFolderName', 'NvimTreeNormal')

  -- TREESITTER CONTEXT
  .highlight('TreesitterContext', { guifg = 'none', guibg = bg_secondary, gui = 'none', guisp = 'none' })
  .highlight('TreesitterContextLineNumber', G.TextSecondary)

  -- TROUBLE
  .highlight('TroubleIndent', G.IndentGuides)

  -- AERIAL
  .link('AerialLine', 'CursorLine')
  .link('AerialLineNr', 'CursorLineNr')

  -- DIFFVIEW
  .highlight('DiffviewDiffAddAsDelete', { guifg = comment, guibg = diff_delete, gui = 'none', guisp = 'none' })
  -- .highlight('DiffviewDiffDelete', { guifg = comment, guibg = 'none', gui = 'none', guisp = 'none' })
  -- .highlight('DiffviewDiffNormal', { guifg = comment, guibg = 'none', gui = 'none', guisp = 'none' })

  -- CMP
  .link('CmpItemKind', 'PmenuKind')

  if pcall(require, "nvim-web-devicons") then
    local nvim_dev_icons = require("nvim-web-devicons")
    local icons_colors_set = {}

    for param_name, color in pairs(params) do
      if param_name == 'comment' then
        goto continue
      end

      table.insert(icons_colors_set, color)
      ::continue::
    end

    for icon_name, icon_definition in pairs(nvim_dev_icons.get_icons()) do
      local closer_color = hex.find_closer_color(icon_definition.color, icons_colors_set)

      nvim_dev_icons.set_icon({
        [icon_name] = {
          name = icon_definition.name,
          icon = icon_definition.icon,
          color = closer_color,
          cterm_color = icon_definition.cterm_color,
        },
      })
    end
  end

  builder.build()
end

return {
  build = build,
}
