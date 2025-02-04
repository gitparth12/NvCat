-- local python_version = "python3.12"
local python_version = vim.fn.system("python3 --version"):match("%d+%.%d+")

local pynvim_env = vim.fn.stdpath("data") .. "/pynvim_env"
if not vim.loop.fs_stat(pynvim_env) then
  vim.fn.system({
    "python",
    "-m",
    "venv",
    pynvim_env,
  })
end

local pynvim_python = pynvim_env .. "/bin/python"

local pynvim_lib = pynvim_env .. "/lib/" .. python_version .. "/site-packages/pynvim"
if not vim.loop.fs_stat(pynvim_lib) then
  vim.fn.system({
    pynvim_python,
    "-m",
    "pip",
    "install",
    "pynvim",
  })
end

vim.g.python_host_prog = pynvim_python
vim.g.python3_host_prog = pynvim_python

if vim.env.VIRTUAL_ENV then
  local virtual_env_bin = vim.env.VIRTUAL_ENV .. "/bin"
  vim.env.PATH = virtual_env_bin .. ":" .. vim.env.PATH
end

-- if VIRTUAL_ENV is set, remove ~/.pyenv/shims from path
-- if vim.env.VIRTUAL_ENV then
--   vim.env.PATH = vim.env.PATH:gsub(vim.fn.expand("~/.pyenv/shims") .. ":", "")
-- end

-- vim.g.python_host_prog = "/Users/parthbhargava/.pyenv/versions/diversity/bin/python"
-- vim.g.python3_host_prog = "/Users/parthbhargava/.pyenv/versions/diversity/bin/python"
