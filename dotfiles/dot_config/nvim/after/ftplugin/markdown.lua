-- Function to convert path to image link with alt text
function _G.path_to_image_link(path)
  -- If the path is empty, get the current line content
  if not path then
    path = vim.fn.getline(".")
  end
  for match in string.gmatch(path, "!%[%]%((.+)%)") do
    -- We assume it's an image link without alt text
    path = match
    -- Strip any space and double quotes at the end, e.g. ' ""'
    path = string.gsub(path, '%s*"+$', "")
    break
  end
  -- Prompt for the alternative text
  local altText = vim.fn.input("Enter the title for the image: ")
  if not altText then
    return
  end
  -- Construct the markdown image syntax
  local imageLink = string.format('![%s](%s "%s")', altText, path, altText)
  -- Replace the current line with the image link
  vim.api.nvim_set_current_line(imageLink)
end

-- Insert a link to a diary file for the current date
function _G.insert_diary_link()
  local date = os.date("%Y-%m-%d")
  local diaryLink = string.format("- [%s](%s)", date, date)
  vim.api.nvim_put({ diaryLink }, "l", true, true)
end

-- Insert the daily todo list
function _G.insert_daily_todo()
  local date = os.date("%Y-%m-%d")
  local todoList = { string.format("# %s", date), "", "## To Do", "", "- [ ] " }
  vim.api.nvim_put(todoList, "l", false, true)
  -- remove last empty line
  vim.cmd("normal! Gdd")
  -- goto insert mode and put cursor at the end of the first todo item
  vim.cmd("startinsert!")
end

-- Helper to get the URL for a summary
local function get_url_for_summary(summary, issues)
  for _, issue in ipairs(issues) do
    if issue.summary == summary then
      return issue.url
    end
  end
end

-- Insert the link for an issue I am assigned to
function _G.insert_assigned_issue_link()
  -- Get the items from the output of a shell command
  local issue_links = vim.fn.systemlist("get-jira-issue-links")
  local pattern = "%[(.+)%]%((.+)%)"
  local issues = {}
  local issue_summaries = {}

  for _, link in ipairs(issue_links) do
    for summary, url in string.gmatch(link, pattern) do
      table.insert(issues, { summary = summary, url = url })
      table.insert(issue_summaries, summary)
    end
  end

  vim.ui.select(issue_summaries, { prompt = "Select an issue" }, function(summary)
    if not summary then
      return
    end
    local url = get_url_for_summary(summary, issues)
    local issueLink = string.format("- [ ] [%s](%s)", summary, url)
    vim.api.nvim_put({ issueLink }, "l", true, true)
  end)
end

-- vim.keymap.set("n", "<leader>mi", _G.path_to_image_link, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mi", ":<C-u>lua _G.path_to_image_link()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>mt", _G.insert_diary_link, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>md", _G.insert_daily_todo, { noremap = true, silent = true })
vim.keymap.set("n", "<leader>ml", _G.insert_assigned_issue_link, { noremap = true, silent = true })
