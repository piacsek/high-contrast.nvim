vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.o.background = "dark"
vim.g.colors_name = "high-contrast"

local colors = {
	-- Background colors
	bg = "#131314",
	bg_float = "#131314",
	bg_highlight = "#000066", -- caret row
	bg_popup = "#281A33",
	bg_search = "#006280", -- selection
	bg_sidebar = "#131314",
	bg_statusline = "#131314",
	bg_visual = "#006280",

	-- Foreground colors
	fg = "#ebebeb",
	fg_dark = "#999999", -- line numbers
	fg_gutter = "#999999",
	fg_sidebar = "#ebebeb",

	-- Accent colors
	black = "#000000",
	blue = "#33ccff",
	blue1 = "#1aabff",
	blue2 = "#4ff0ff",
	cyan = "#37cccc",
	grey = "#bcc2be",
	green = "#54b33e",
	green1 = "#62cc47",
	green2 = "#499936",
	magenta = "#ff96ff",
	orange = "#ed864a",
	purple = "#ed94ff",
	purple_dark = "#8547ff",
	red = "#fa3232",
	red1 = "#f2495a",
	teal = "#5be7f5",
	yellow = "#ffcf40",
	yellow1 = "#ffbf66",

	-- Git colors (gutter indicators)
	git_add = "#009924",
	git_change = "#1aabff",
	git_delete = "#ffa14f",

	-- Diagnostic colors
	error = "#ff0d25",
	warning = "#ffb300",
	info = "#b39500",
	hint = "#005380",

	-- Comment colors
	comment = "#7ec3e6",
	doc_comment = "#499936",
	doc_tag_value = "#a66e32",

	-- UI colors
	metadata = "#a9b837",
	todo = "#adcc00",
	match_brace = "#ffef28",
	indent = "#666666",
	indent_active = "#999999",
	link = "#00aaff",
	unused = "#b3b3b3",
	injected_bg = "#153811",
	color_column = "#808080",
	custom_tag = "#00deb8",

	-- Special
	none = "NONE",
}

local function hi(group, opts)
	local cmd = "hi " .. group
	if opts.fg then
		cmd = cmd .. " guifg=" .. opts.fg
	end
	if opts.bg then
		cmd = cmd .. " guibg=" .. opts.bg
	end
	if opts.sp then
		cmd = cmd .. " guisp=" .. opts.sp
	end
	local styles = {}
	if opts.bold then table.insert(styles, "bold") end
	if opts.italic then table.insert(styles, "italic") end
	if opts.underline then table.insert(styles, "underline") end
	if opts.undercurl then table.insert(styles, "undercurl") end
	if opts.strikethrough then table.insert(styles, "strikethrough") end
	if #styles > 0 then
		cmd = cmd .. " gui=" .. table.concat(styles, ",")
	end
	vim.cmd(cmd)
end

-- Editor
hi("Normal", { fg = colors.fg, bg = colors.bg })
hi("NormalFloat", { fg = colors.fg, bg = colors.bg_float })
hi("LineNr", { fg = colors.fg_dark })
hi("CursorLineNr", { fg = colors.fg, bold = true })
hi("CursorLine", { bg = colors.bg_highlight })
hi("Visual", { bg = colors.bg_visual })
hi("Search", { bg = colors.bg_search })
hi("IncSearch", { bg = colors.bg_search })
hi("MatchParen", { fg = colors.match_brace, bold = true })
hi("ColorColumn", { bg = colors.color_column })
hi("Whitespace", { fg = colors.fg })
hi("NonText", { fg = colors.fg })
hi("SpecialKey", { fg = colors.fg_dark })
hi("Todo", { fg = colors.todo, italic = true })
hi("Underlined", { fg = colors.link, underline = true })

-- Syntax highlighting
hi("Comment", { fg = colors.comment, italic = true })
hi("Constant", { fg = colors.purple, italic = true })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.blue, bold = true })
hi("Boolean", { fg = colors.purple, italic = true })
hi("Float", { fg = colors.blue, bold = true })

hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.yellow })

hi("Statement", { fg = colors.orange })
hi("Conditional", { fg = colors.orange })
hi("Repeat", { fg = colors.orange })
hi("Label", { fg = colors.orange })
hi("Operator", { fg = colors.orange })
hi("Keyword", { fg = colors.orange })
hi("Exception", { fg = colors.orange })

hi("PreProc", { fg = colors.orange })
hi("Include", { fg = colors.orange })
hi("Define", { fg = colors.orange })
hi("Macro", { fg = colors.orange })
hi("PreCondit", { fg = colors.orange })

hi("Type", { fg = colors.fg })
hi("StorageClass", { fg = colors.orange })
hi("Structure", { fg = colors.orange })
hi("Typedef", { fg = colors.orange })

hi("Special", { fg = colors.orange })
hi("SpecialChar", { fg = colors.orange })
hi("Tag", { fg = colors.orange })
hi("Delimiter", { fg = colors.orange, bold = true })
hi("SpecialComment", { fg = colors.comment })
hi("Debug", { fg = colors.orange })

-- Git signs
hi("GitSignsAdd", { fg = colors.git_add })
hi("GitSignsChange", { fg = colors.git_change })
hi("GitSignsDelete", { fg = colors.git_delete })

-- Indent guides (indent-blankline.nvim)
hi("IblIndent", { fg = colors.indent })
hi("IblScope", { fg = colors.indent_active })
hi("IndentBlanklineChar", { fg = colors.indent })
hi("IndentBlanklineContextChar", { fg = colors.indent_active })

-- Diagnostics
hi("DiagnosticError", { fg = colors.error })
hi("DiagnosticWarn", { fg = colors.warning })
hi("DiagnosticInfo", { fg = colors.green1 })
hi("DiagnosticHint", { fg = colors.hint })
hi("DiagnosticUnnecessary", { fg = colors.unused, underline = true })

-- LSP
hi("LspReferenceText", { bg = "#3b0a" })
hi("LspReferenceRead", { bg = "#3b0a" })
hi("LspReferenceWrite", { bg = "#471747" })

-- Treesitter
hi("@variable", { fg = colors.purple_dark, bold = true })
hi("@variable.member", { fg = colors.purple })
hi("@boolean.elixir", { fg = colors.orange })
hi("@constant", { fg = colors.purple, italic = true })
hi("@constant.builtin", { fg = colors.purple, italic = true })
hi("@symbol", { fg = colors.purple, italic = true })
hi("@string.special.symbol", { fg = colors.purple })
hi("@string", { fg = colors.green })
hi("@string.escape", { fg = colors.orange })
hi("@number", { fg = colors.blue, bold = true })
hi("@boolean", { fg = colors.purple, italic = true })
hi("@function", { fg = colors.yellow })
hi("@function.builtin", { fg = colors.yellow })
hi("@function.call", { fg = colors.yellow })
hi("@function.call.elixir", { fg = colors.fg })
hi("@keyword", { fg = colors.orange })
hi("@keyword.function", { fg = colors.orange })
hi("@keyword.return", { fg = colors.orange })
hi("@type", { fg = colors.teal, bold = true })
hi("@namespace", { fg = colors.teal, bold = true })
hi("@module", { fg = colors.teal, bold = true })
hi("@type.builtin", { fg = colors.cyan, bold = true })
hi("@comment", { fg = colors.comment, italic = true })
hi("@comment.documentation", { fg = colors.doc_comment, italic = true })
hi("@comment.todo", { fg = colors.todo, italic = true })
hi("@attribute", { fg = colors.metadata })
hi("@lsp.mod.deprecated", { strikethrough = true, sp = colors.error })
hi("@punctuation.special", { fg = colors.blue, bold = true })
hi("@punctuation.delimiter", { fg = colors.orange, bold = true })
hi("@punctuation.bracket", { fg = colors.blue, bold = true })
hi("@constructor", { fg = colors.blue, bold = true })
hi("@type.qualifier", { fg = colors.blue, bold = true })
hi("@operator", { fg = colors.green1, bold = true })
hi("@tag.attribute.heex", { fg = colors.fg })
hi("@string.special.elixir", { fg = colors.green })
hi("@markup.raw.block.markdown", { fg = colors.grey })

-- YAML
hi("yamlBlockMappingKey", { fg = colors.blue1 })
hi("yamlMappingKey", { fg = colors.blue1 })
hi("yamlFlowMappingKey", { fg = colors.blue1 })
hi("yamlString", { fg = colors.green })
hi("yamlFlowString", { fg = colors.green })
hi("yamlInteger", { fg = colors.blue, bold = true })
hi("yamlFloat", { fg = colors.blue, bold = true })
hi("yamlTimestamp", { fg = colors.blue, bold = true })
hi("yamlBool", { fg = colors.purple, italic = true })
hi("yamlNull", { fg = colors.purple, italic = true })
hi("yamlConstant", { fg = colors.purple, italic = true })
hi("yamlKeyValueDelimiter", { fg = colors.orange, bold = true })
hi("yamlBlockCollectionItemStart", { fg = colors.orange, bold = true }) -- -
hi("yamlBlockMappingDelimiter", { fg = colors.orange, bold = true }) -- :
hi("yamlAnchor", { fg = colors.yellow })
hi("yamlAlias", { fg = colors.yellow })
hi("yamlNodeTag", { fg = colors.teal })
hi("yamlDocumentStart", { fg = colors.orange }) -- ---
hi("yamlDocumentEnd", { fg = colors.orange }) -- ...
hi("yamlComment", { fg = colors.comment, italic = true })
hi("yamlEscape", { fg = colors.orange })

-- Telescope
hi("TelescopeNormal", { fg = colors.fg, bg = colors.bg_float })
hi("TelescopeBorder", { fg = colors.fg_dark, bg = colors.bg_float })
hi("TelescopeSelection", { bg = colors.bg_visual })

-- Status line
hi("StatusLine", { fg = colors.fg, bg = colors.bg_statusline })
hi("StatusLineNC", { fg = colors.fg_dark, bg = colors.bg_statusline })

-- Tab line
hi("TabLine", { fg = colors.fg_dark, bg = colors.bg_statusline })
hi("TabLineFill", { bg = colors.bg_statusline })
hi("TabLineSel", { fg = colors.fg, bg = colors.bg_highlight })

-- Popup menu
hi("Pmenu", { fg = colors.fg, bg = colors.bg_popup })
hi("PmenuSel", { fg = colors.fg, bg = colors.bg_visual })
hi("PmenuSbar", { bg = colors.bg_popup })
hi("PmenuThumb", { bg = colors.fg_dark })

-- Folding
hi("Folded", { fg = colors.fg, bg = colors.none })
hi("FoldColumn", { fg = colors.fg_dark, bg = colors.bg })

-- Diff
hi("DiffAdd", { bg = "#400f" })
hi("DiffChange", { bg = "#99" })
hi("DiffDelete", { bg = "#4d2e08" })
hi("DiffText", { bg = "#661300" })

-- HTML
hi("htmlTag", { fg = colors.orange })
hi("htmlEndTag", { fg = colors.orange })
hi("htmlTagName", { fg = colors.orange })
hi("htmlSpecialTagName", { fg = colors.orange })
hi("htmlArg", { fg = colors.fg })
hi("htmlString", { fg = colors.green })
hi("htmlSpecialChar", { fg = colors.link, bold = true })
hi("htmlH1", { fg = colors.fg, bold = true })
hi("htmlH2", { fg = colors.fg, bold = true })
hi("htmlH3", { fg = colors.fg, bold = true })
hi("@tag", { fg = colors.orange })
hi("@tag.builtin", { fg = colors.orange })
hi("@tag.delimiter", { fg = colors.orange })
hi("@tag.attribute", { fg = colors.fg })
hi("@tag.html", { fg = colors.orange })
hi("@tag.custom", { fg = colors.custom_tag })

-- XML
hi("xmlTag", { fg = colors.orange })
hi("xmlEndTag", { fg = colors.orange })
hi("xmlTagName", { fg = colors.orange })
hi("xmlAttrib", { fg = colors.fg })
hi("xmlString", { fg = colors.green })
hi("xmlEntity", { fg = colors.link, bold = true })

-- Injected language
hi("InjectedLanguage", { bg = colors.injected_bg })
