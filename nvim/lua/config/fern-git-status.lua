local g = vim.g

g["fern_git_status#disable_ignored"] = 1
g["fern_git_status#disable_untracked"] = 1
g["fern_git_status#disable_submodules"] = 1
g["fern_git_status#indexed_character"] = "■"
g["fern_git_status#stained_character"] = "■"
g["fern_git_status_disable_startup"] = 1

-- Due to lazy-loading of Fern, we need to manually initialize this plugin.
vim.cmd([[call fern_git_status#init()]])
