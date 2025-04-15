local function Builder()
  local that = {}

  local highlights = {}
  local links = {}
  local unhighlights = {}

  that.highlight = function(group, props)
    that.unhighlight(group)

    table.insert(highlights, {
      group = group,
      props = props,
    })

    return that
  end

  that.link = function(source_group, target_group)
    that.unhighlight(source_group)

    table.insert(links, {
      source_group = source_group,
      target_group = target_group,
    })

    return that
  end

  that.unhighlight = function (group)
    table.insert(unhighlights, {
      group = group,
    })

    return that
  end

  that.build = function()
    for _, unhighlight in ipairs(unhighlights) do
      local group = unhighlight.group

      vim.api.nvim_set_hl(0, group, {})
    end

    for _, highligt in ipairs(highlights) do
      local group = highligt.group
      local props = highligt.props

      local guibg = props.guibg == nil and "" or "guibg=" .. props.guibg
      local guifg = props.guifg == nil and "" or "guifg=" .. props.guifg
      local gui = props.gui == nil and "" or "gui=" .. props.gui
      local guisp = props.guisp == nil and "" or "guisp=" .. props.guisp

      local cmd = table.concat({
        "highlight!", group, guifg, guibg, gui, guisp
      }, " ")

      vim.api.nvim_command(cmd)
    end

    for _, link in pairs(links) do
      local source_group = link.source_group
      local target_group = link.target_group

      vim.cmd('highlight! link ' .. source_group .. ' ' .. target_group)
    end
  end

  return that
end

return Builder
