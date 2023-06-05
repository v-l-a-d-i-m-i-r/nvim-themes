local HEX_DIGITS = {
  ['0'] = 0,
  ['1'] = 1,
  ['2'] = 2,
  ['3'] = 3,
  ['4'] = 4,
  ['5'] = 5,
  ['6'] = 6,
  ['7'] = 7,
  ['8'] = 8,
  ['9'] = 9,
  ['a'] = 10,
  ['b'] = 11,
  ['c'] = 12,
  ['d'] = 13,
  ['e'] = 14,
  ['f'] = 15,
  ['A'] = 10,
  ['B'] = 11,
  ['C'] = 12,
  ['D'] = 13,
  ['E'] = 14,
  ['F'] = 15,
}

local function hex_to_rgb(hex)
  local red = HEX_DIGITS[string.sub(hex, 1, 1)] * 16 + HEX_DIGITS[string.sub(hex, 2, 2)]
  local green = HEX_DIGITS[string.sub(hex, 3, 3)] * 16 + HEX_DIGITS[string.sub(hex, 4, 4)]
  local blue = HEX_DIGITS[string.sub(hex, 5, 5)] * 16 + HEX_DIGITS[string.sub(hex, 6, 6)]

  -- return red, green, blue
  return {
    r = red,
    g = green,
    b = blue,
  }
end

local function hex_string_to_rgb(hex_string)
  return hex_to_rgb(string.sub(hex_string, 2, 7))
end

local function rgb_to_hex(r, g, b)
  return bit.tohex(bit.bor(bit.lshift(r, 16), bit.lshift(g, 8), b), 6)
end

local function hsl_to_rgb(h, s, l, a)
  h = h / 360
  s = s / 100
  l = l / 100

  local r, g, b;

  if s == 0 then
    r, g, b = l, l, l; -- achromatic
  else
    local function hue2rgb(p, q, t)
      if t < 0 then t = t + 1 end
      if t > 1 then t = t - 1 end
      if t < 1 / 6 then return p + (q - p) * 6 * t end
      if t < 1 / 2 then return q end
      if t < 2 / 3 then return p + (q - p) * (2 / 3 - t) * 6 end
      return p;
    end

    local q = l < 0.5 and l * (1 + s) or l + s - l * s;
    local p = 2 * l - q;
    r = hue2rgb(p, q, h + 1 / 3);
    g = hue2rgb(p, q, h);
    b = hue2rgb(p, q, h - 1 / 3);
  end

  if not a then a = 1 end

  return r * 255, g * 255, b * 255, a * 255
end

local function hex_to_hex_string(hex)
  return "#" .. hex
end

local function hsl_to_hex_string(h, s, l)
  return "#" .. rgb_to_hex(hsl_to_rgb(h, s, l, 100))
end

local function rgb_to_hex_string(rgb_color)
  return hex_to_hex_string(rgb_to_hex(rgb_color.r, rgb_color.g, rgb_color.b))
end

local function grayscale_to_hex_string(chan)
  return "#" .. rgb_to_hex(chan, chan, chan)
end

local function capitalize(s)
	return string.upper(string.sub(s, 1, 1)) .. string.sub(s, 2)
end

function get_distance(hex_color1, hex_color2)
  local red1, green1, blue1 = tonumber(hex_color1:sub(1, 2), 16), tonumber(hex_color1:sub(3, 4), 16), tonumber(hex_color1:sub(5, 6), 16)
  local red2, green2, blue2 = tonumber(hex_color2:sub(1, 2), 16), tonumber(hex_color2:sub(3, 4), 16), tonumber(hex_color2:sub(5, 6), 16)

  local distance = (red1 - red2)^2 + (green1 - green2)^2 + (blue1 - blue2)^2

  return distance
end

-- https://github.com/folke/tokyonight.nvim/blob/v1.0.0/lua/tokyonight/treesitter.lua
local function map_treesitter_key_to_legacy(key)
  local hashMap = {
    ["@constant.builtin"] = "TSConstBuiltin",
    ["@constant.macro"] = "TSConstMacro",
    ["@function.builtin"] = "TSFuncBuiltin",
    ["@function.macro"] = "TSFuncMacro",
    ["@preproc"] = "TSPreProc",
    ["@punctuation.bracket"] = "TSPunctBracket",
    ["@punctuation.delimiter"] = "TSPunctDelimiter",
    ["@punctuation.special"] = "TSPunctSpecial",
    ["@storageclass"] = "TSStorageClass",
    ["@text.danger"] = "TSDanger",
    ["@text.emphasis"] = "TSEmphasis",
    ["@text.environment"] = "TSEnvironment",
    ["@text.environment.name"] = "TSEnvironmentName",
    ["@text.literal"] = "TSLiteral",
    ["@text.math"] = "TSMath",
    ["@text.note"] = "TSNote",
    ["@text.reference"] = "TSTextReference",
    ["@text.strike"] = "TSStrike",
    ["@text.strong"] = "TSStrong",
    ["@text.title"] = "TSTitle",
    ["@text.underline"] = "TSUnderline",
    ["@text.uri"] = "TSURI",
    ["@text.warning"] = "TSWarning",
  }

  if hashMap[key] ~= nil then
    return hashMap[key]
  end

	return "TS" .. (string.gsub(key, ".(%w+)" , capitalize))
end

local function treesitter_map_to_legacy(higlights)
  local result = {}

  for key, value in pairs(higlights) do
    local legacyKey = map_treesitter_key_to_legacy(key)
    result[legacyKey] = value
  end
  -- P(result)
  return result
end

local function highlight(groups)
  for group, props in pairs(groups) do
    if (type(props) == 'string') then
      local cmd = table.concat({
        "highlight", "link", group, props
      }, " ")
      vim.cmd(('hi! link %s %s'):format(group, args))
      return
    end

    local guibg = props.guibg == nil and "" or "guibg=" .. props.guibg
    local guifg = props.guifg == nil and "" or "guifg=" .. props.guifg
    local gui = props.gui == nil and "" or "gui=" .. props.gui
    local guisp = props.guisp == nil and "" or "guisp=" .. props.guisp

    local cmd = table.concat({
      "highlight", group, guifg, guibg, gui, guisp
    }, " ")

    vim.api.nvim_command(cmd)
  end
end

local rgb = {
  get_intermediate_colors = function(rgb_color_1, rgb_color_2, n)
    local r_color_1 = rgb_color_1.r
    local g_color_1 = rgb_color_1.g
    local b_color_1 = rgb_color_1.b

    local r_color_2 = rgb_color_2.r
    local g_color_2 = rgb_color_2.g
    local b_color_2 = rgb_color_2.b

    local delta_r = (r_color_2 - r_color_1) / (n + 1)
    local delta_g = (g_color_2 - g_color_1) / (n + 1)
    local delta_b = (b_color_2 - b_color_1) / (n + 1)

    local intermediate_colors = {}

    for i = 1, n do
      local r = math.floor(r_color_1 + delta_r * i + 0.5)
      local g = math.floor(g_color_1 + delta_g * i + 0.5)
      local b = math.floor(b_color_1 + delta_b * i + 0.5)

      table.insert(intermediate_colors, {
        r = r,
        g = g,
        b = b,
      })
    end

    return intermediate_colors
  end,
  darken = function(rgb_color, percentage)
    local r = rgb_color.r
    local g = rgb_color.g
    local b = rgb_color.b

    -- local darker_r = math.max(math.floor(r * (1 - percentage / 100)), 0)
    -- local darker_g = math.max(math.floor(g * (1 - percentage / 100)), 0)
    -- local darker_b = math.max(math.floor(b * (1 - percentage / 100)), 0)

    local darker_r = math.max(math.floor(r * (1 - percentage / 100) + 0.5), 0)
    local darker_g = math.max(math.floor(g * (1 - percentage / 100) + 0.5), 0)
    local darker_b = math.max(math.floor(b * (1 - percentage / 100) + 0.5), 0)

    return {
      r = darker_r,
      g = darker_g,
      b = darker_b,
    }
  end,
  get_distance = function (rgb_color_1, rgb_color_2)
    local r_color_1 = rgb_color_1.r
    local g_color_1 = rgb_color_1.g
    local b_color_1 = rgb_color_1.b

    local r_color_2 = rgb_color_2.r
    local g_color_2 = rgb_color_2.g
    local b_color_2 = rgb_color_2.b

    return ((r_color_1 - r_color_2)^2 + (g_color_1 - g_color_2)^2 + (b_color_1 - b_color_2)^2) ^ (0.5)
  end
}

local hex = {
  get_intermediate_colors = function(hex_color_string_1, hex_color_string_2, n)
    local intermediate_colors_rgb = rgb.get_intermediate_colors(
      hex_string_to_rgb(hex_color_string_1),
      hex_string_to_rgb(hex_color_string_2),
      n
    )

    local intermediate_colors_hex = {}

    for _, rgb_color in ipairs(intermediate_colors_rgb) do
      table.insert(intermediate_colors_hex, rgb_to_hex_string(rgb_color))
    end

    return intermediate_colors_hex
  end,
  darken = function(hex_color_string, percentage)
    local rgb_color = hex_string_to_rgb(hex_color_string)
    local rgb_darken = rgb.darken(rgb_color, percentage)

    return rgb_to_hex_string(rgb_darken)
  end,
  find_closer_color = function(hex_color_string, hex_color_strings)
    local closest_color = hex_color_strings[1]
    local closest_distance = math.huge

    for _, color_string in ipairs(hex_color_strings) do
      local distance = rgb.get_distance(hex_string_to_rgb(hex_color_string), hex_string_to_rgb(color_string))

      if distance < closest_distance then
        closest_color = color_string
        closest_distance = distance
      end
    end

    return closest_color
  end,
}

return {
  highlight = highlight,
  treesitter_map_to_legacy = treesitter_map_to_legacy,
  grayscale_to_hex_string = grayscale_to_hex_string,
  hex = hex,
}
