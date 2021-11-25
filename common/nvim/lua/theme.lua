local theme = {
  base0      = '#1B2229';
  base1      = '#1c1f24';
  base2      = '#202328';
  base3      = '#23272e';
  base4      = '#3f444a';
  base5      = '#5B6268';
  base6      = '#73797e';
  base7      = '#9ca0a4';
  base8      = '#b1b1b1';

  bg = '#282a36';
  bg1 = '#504945';
  bg_popup = '#3E4556';
  bg_highlight  = '#2E323C';
  bg_visual = '#b3deef';

  fg = '#bbc2cf';
  fg_alt  = '#5B6268';

  red = '#e95678';

  redwine = '#d16d9e';
  orange = '#D98E48';
  yellow = '#f0c674';

  light_green = '#abcf84';
  green = '#afd700';
  dark_green = '#98be65';

  cyan = '#36d0e0';
  blue = '#61afef';
  violet = '#b294bb';
  magenta = '#c678dd',
  teal = '#1abc9c';
  grey = '#928374';
  brown = '#c78665';
  black = '#000000';

  bracket = '#80A0C2';
  currsor_bg = '#4f5b66';
  none = 'NONE';
}

function theme.terminal_color()
  vim.g.terminal_color_0 = theme.bg
  vim.g.terminal_color_1 = theme.red
  vim.g.terminal_color_2 = theme.green
  vim.g.terminal_color_3 = theme.yellow
  vim.g.terminal_color_4 = theme.blue
  vim.g.terminal_color_5 = theme.violet
  vim.g.terminal_color_6 = theme.cyan
  vim.g.terminal_color_7 = theme.bg1
  vim.g.terminal_color_8 = theme.brown
  vim.g.terminal_color_9 = theme.red
  vim.g.terminal_color_10 = theme.green
  vim.g.terminal_color_11 = theme.yellow
  vim.g.terminal_color_12 = theme.blue
  vim.g.terminal_color_13 = theme.violet
  vim.g.terminal_color_14 = theme.cyan
  vim.g.terminal_color_15 = theme.fg
end

function theme.highlight(group, color)
    local style = color.style and 'gui=' .. color.style or 'gui=NONE'
    local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
    local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
    local sp = color.sp and 'guisp=' .. color.sp or ''
    vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..
                             ' ' .. bg..' '..sp)
end


function theme.load_syntax()
  local syntax = {
    Normal = {fg = theme.fg,bg=theme.bg};
    Terminal = {fg = theme.fg,bg=theme.bg};
    SignColumn = {fg=theme.fg,bg=theme.bg};
    FoldColumn = {fg=theme.fg_alt,bg=theme.black};
    VertSplit = {fg=theme.black,bg=theme.bg};
    Folded = {fg=theme.grey,bg=theme.bg_highlight};
    EndOfBuffer = {fg=theme.bg,bg=theme.none};
    IncSearch = {fg=theme.bg1,bg=theme.orange,style=theme.none};
    Search = {fg=theme.bg,bg=theme.orange};
    ColorColumn = {fg=theme.none,bg=theme.bg_highlight};
    Conceal = {fg=theme.grey,bg=theme.none};
    Cursor = {fg=theme.none,bg=theme.none,style='reverse'};
    vCursor = {fg=theme.none,bg=theme.none,style='reverse'};
    iCursor = {fg=theme.none,bg=theme.none,style='reverse'};
    lCursor = {fg=theme.none,bg=theme.none,style='reverse'};
    CursorIM = {fg=theme.none,bg=theme.none,style='reverse'};
    CursorColumn = {fg=theme.none,bg=theme.bg_highlight};
    CursorLine = {fg=theme.none,bg=theme.bg_highlight};
    LineNr = {fg=theme.base4};
    qfLineNr = {fg=theme.cyan};
    CursorLineNr = {fg=theme.blue};
    DiffAdd = {fg=theme.black,bg=theme.dark_green};
    DiffChange = {fg=theme.black,bg=theme.yellow};
    DiffDelete = {fg=theme.black,bg=theme.red};
    DiffText = {fg=theme.black,bg=theme.fg};
    Directory = {fg=theme.blue,bg=theme.none};
    ErrorMsg = {fg=theme.red,bg=theme.none,style='bold'};
    WarningMsg = {fg=theme.yellow,bg=theme.none,style='bold'};
    ModeMsg = {fg=theme.fg,bg=theme.none,style='bold'};
    MatchParen = {fg=theme.red,bg=theme.none};
    NonText = {fg=theme.bg1};
    Whitespace = {fg=theme.base4};
    SpecialKey = {fg=theme.bg1};
    Pmenu = {fg=theme.fg,bg=theme.bg_popup};
    PmenuSel = {fg=theme.base0,bg=theme.blue};
    PmenuSelBold = {fg=theme.base0,g=theme.blue};
    PmenuSbar = {fg=theme.none,bg=theme.base4};
    PmenuThumb = {fg=theme.violet,bg=theme.light_green};
    WildMenu = {fg=theme.fg,bg=theme.green};
    Question = {fg=theme.yellow};
    NormalFloat = {fg=theme.base8,bg=theme.bg_highlight};
    Tabline = {fg=theme.base6,bg=theme.base2};
    TabLineFill = {style=theme.none};
    TabLineSel = {fg=theme.fg,bg=theme.blue};
    StatusLine = {fg=theme.base8,bg=theme.base2,style=theme.none};
    StatusLineNC = {fg=theme.grey,bg=theme.base2,style=theme.none};
    SpellBad = {fg=theme.red,bg=theme.none,style='undercurl'};
    SpellCap = {fg=theme.blue,bg=theme.none,style='undercurl'};
    SpellLocal = {fg=theme.cyan,bg=theme.none,style='undercurl'};
    SpellRare = {fg=theme.violet,bg=theme.none,style = 'undercurl'};
    Visual = {fg=theme.black,bg=theme.bg_visual};
    VisualNOS = {fg=theme.black,bg=theme.bg_visual};
    QuickFixLine = {fg=theme.violet,style='bold'};
    Debug = {fg=theme.orange};
    debugBreakpoint = {fg=theme.bg,bg=theme.red};

    Boolean = {fg=theme.orange};
    Number = {fg=theme.brown};
    Float = {fg=theme.brown};
    PreProc = {fg=theme.violet};
    PreCondit = {fg=theme.violet};
    Include = {fg=theme.violet};
    Define = {fg=theme.violet};
    Conditional = {fg=theme.magenta};
    Repeat = {fg=theme.magenta};
    Keyword = {fg=theme.green};
    Typedef = {fg=theme.red};
    Exception = {fg=theme.red};
    Statement = {fg=theme.red};
    Error = {fg=theme.red};
    StorageClass = {fg=theme.orange};
    Tag = {fg=theme.orange};
    Label = {fg=theme.orange};
    Structure = {fg=theme.orange};
    Operator = {fg=theme.redwine};
    Title = {fg=theme.orange,style='bold'};
    Special = {fg=theme.yellow};
    SpecialChar = {fg=theme.yellow};
    Type = {fg=theme.teal};
    Function = {fg=theme.yellow};
    String = {fg=theme.light_green};
    Character = {fg=theme.green};
    Constant = {fg=theme.cyan};
    Macro = {fg=theme.cyan};
    Identifier = {fg=theme.blue};

    Comment = {fg=theme.base6};
    SpecialComment = {fg=theme.grey};
    Todo = {fg=theme.violet};
    Delimiter = {fg=theme.fg};
    Ignore = {fg=theme.grey};
    Underlined = {fg=theme.none,style='underline'};

    DashboardShortCut = {fg=theme.magenta};
    DashboardHeader = {fg=theme.orange};
    DashboardCenter = {fg=theme.cyan};
    DashboardFooter = {fg=theme.yellow,style='bold'};
  }
  return syntax
end

function theme.load_plugin_syntax()
  local plugin_syntax = {
    TSFunction = {fg=theme.cyan};
    TSMethod = {fg=theme.cyan};
    TSKeywordFunction = {fg=theme.red};
    TSProperty = {fg=theme.yellow};
    TSType = {fg=theme.teal};
    TSVariable = {fg=theme.blue};
    TSPunctBracket = {fg=theme.bracket};

    vimCommentTitle = {fg=theme.grey,style='bold'};
    vimLet = {fg=theme.orange};
    vimVar = {fg=theme.cyan};
    vimFunction = {fg=theme.redwine};
    vimIsCommand = {fg=theme.fg};
    vimCommand = {fg=theme.blue};
    vimNotFunc = {fg=theme.violet,style='bold'};
    vimUserFunc = {fg=theme.yellow,style='bold'};
    vimFuncName= {fg=theme.yellow,style='bold'};

    diffAdded = {fg = theme.dark_green};
    diffRemoved = {fg =theme.red};
    diffChanged = {fg = theme.blue};
    diffOldFile = {fg = theme.yellow};
    diffNewFile = {fg = theme.orange};
    diffFile    = {fg = theme.aqua};
    diffLine    = {fg = theme.grey};
    diffIndexLine = {fg = theme.violet};

    gitcommitSummary = {fg = theme.red};
    gitcommitUntracked = {fg = theme.grey};
    gitcommitDiscarded = {fg = theme.grey};
    gitcommitSelected = { fg=theme.grey};
    gitcommitUnmerged = { fg=theme.grey};
    gitcommitOnBranch = { fg=theme.grey};
    gitcommitArrow  = {fg = theme.grey};
    gitcommitFile  = {fg = theme.dark_green};

    VistaBracket = {fg=theme.grey};
    VistaChildrenNr = {fg=theme.orange};
    VistaKind = {fg=theme.purpl};
    VistaScope = {fg=theme.red};
    VistaScopeKind = {fg=theme.blue};
    VistaTag = {fg=theme.magenta,style='bold'};
    VistaPrefix = {fg=theme.grey};
    VistaColon = {fg=theme.magenta};
    VistaIcon = {fg=theme.yellow};
    VistaLineNr = {fg=theme.fg};

    GitGutterAdd = {fg=theme.dark_green};
    GitGutterChange = {fg=theme.blue};
    GitGutterDelete = {fg=theme.red};
    GitGutterChangeDelete = {fg=theme.violet};

    GitSignsAdd = {fg=theme.dark_green};
    GitSignsChange = {fg=theme.blue};
    GitSignsDelete = {fg=theme.red};
    GitSignsAddNr = {fg=theme.dark_green};
    GitSignsChangeNr = {fg=theme.blue};
    GitSignsDeleteNr = {fg=theme.red};
    GitSignsAddLn = {bg=theme.bg_popup};
    GitSignsChangeLn = {bg=theme.bg_highlight};
    GitSignsDeleteLn = {bg=theme.bg1};

    SignifySignAdd = {fg=theme.dark_green};
    SignifySignChange = {fg=theme.blue};
    SignifySignDelete = {fg=theme.red};

    dbui_tables = {fg=theme.blue};

    LspDiagnosticsSignError = {fg=theme.red};
    LspDiagnosticsSignWarning = {fg=theme.yellow};
    LspDiagnosticsSignInformation = {fg=theme.blue};
    LspDiagnosticsSignHint = {fg=theme.cyan};

    LspDiagnosticsVirtualTextError = {fg=theme.red};
    LspDiagnosticsVirtualTextWarning= {fg=theme.yellow};
    LspDiagnosticsVirtualTextInformation = {fg=theme.blue};
    LspDiagnosticsVirtualTextHint = {fg=theme.cyan};

    LspDiagnosticsUnderlineError = {style="undercurl",sp=theme.red};
    LspDiagnosticsUnderlineWarning = {style="undercurl",sp=theme.yellow};
    LspDiagnosticsUnderlineInformation = {style="undercurl",sp=theme.blue};
    LspDiagnosticsUnderlineHint = {style="undercurl",sp=theme.cyan};

    CursorWord0 = {bg=theme.currsor_bg};
    CursorWord1 = {bg=theme.currsor_bg};

    NvimTreeFolderName = {fg=theme.blue};
    NvimTreeRootFolder = {fg=theme.red,style='bold'};
    NvimTreeSpecialFile = {fg=theme.fg,bg=theme.none,stryle='NONE'};

    TelescopeBorder = {fg=theme.teal};
    TelescopePromptBorder = {fg=theme.blue};
    TelescopeMatching = {fg=theme.teal};
    TelescopeSelection = {fg=theme.yellow,bg=theme.bg_highlight,style= 'bold'};
    TelescopeSelectionCaret = {fg=theme.yellow};
    TelescopeMultiSelection = {fg=theme.teal};
  }
  return plugin_syntax
end

local async_load_plugin

async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
  theme.terminal_color()
  local syntax = theme.load_plugin_syntax()
  for group,colors in pairs(syntax) do
    theme.highlight(group,colors)
  end
  async_load_plugin:close()
end))

function theme.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'theme'
  local syntax = theme.load_syntax()
  for group,colors in pairs(syntax) do
    theme.highlight(group,colors)
  end
  async_load_plugin:send()
end

theme.colorscheme()

return theme
