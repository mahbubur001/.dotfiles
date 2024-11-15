local wezterm = require("wezterm")
local  config = wezterm.config_builder()


-- config.force_reverse_video_cursor = true
config.font_size = 14
config.font = wezterm.font('JetBrains Mono')
config.automatically_reload_config = true
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.adjust_window_size_when_changing_font_size = false
config.harfbuzz_features = { "calt=0" }
config.max_fps = 120
config.enable_kitty_graphics = true
-- config.window_close_confirmation = "NeverPrompt"
config.window_background_opacity = 1
-- config.macos_window_background_blur = 50

config.window_padding = {
	left = 3,
	right = 3,
	top = 0,
	bottom = 0
}

-- Add Custom Color Scheme
-- config.color_scheme = "Gruvbox dark, medium (base16)"

config.colors = {
	background = '#272727',
	foreground = '#e8dbb6',
	selection_fg = '#645c54',
	selection_bg = '#e8dbb6',
	cursor_bg = '#e8dbb6',
	cursor_fg = '#272727',
	cursor_border = '#e8dbb6',
}
-- Key bindings for zoom and delete word
config.keys = {
	{
		key = "+",
		mods = "CMD",
		action = wezterm.action.IncreaseFontSize,
	},
	{
		key = "-",
		mods = "CMD",
		action = wezterm.action.DecreaseFontSize,
	},
	{
		key = "LeftArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bb" }),
	},
	{
		key = "RightArrow",
		mods = "OPT",
		action = wezterm.action({ SendString = "\x1bf" }),
	},

   {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'CMD',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },
  {
    key = 'w',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  }

}

-- Matches: a URL in parens: (URL)
config.hyperlink_rules = {
            {
         regex = '\\((\\w+://\\S+)\\)',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in brackets: [URL]
      {
         regex = '\\[(\\w+://\\S+)\\]',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in curly braces: {URL}
      {
         regex = '\\{(\\w+://\\S+)\\}',
         format = '$1',
         highlight = 1,
      },
      -- Matches: a URL in angle brackets: <URL>
      {
         regex = '<(\\w+://\\S+)>',
         format = '$1',
         highlight = 1,
      },
      -- Then handle URLs not wrapped in brackets
      {
         regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
         format = '$0',
      },
      -- implicit mailto link
      {
         regex = '\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b',
         format = 'mailto:$0',
      },
   }

return config
