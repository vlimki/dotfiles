local opt = vim.opt
local cmd = vim.cmd

opt.number = true
opt.relativenumber = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.cmd('imap <Tab> <Space><Space>')
opt.laststatus = 3
opt.termguicolors = true
vim.wo.fillchars='eob: '
opt.expandtab = false
vim.o.synmaxcol = 400
vim.cmd('set nocompatible')
vim.cmd('filetype off')
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true })
vim.keymap.set('n', '<C-t>', ':NvimTreeFocus<CR>', { noremap = true })

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

vim.keymap.set({ 't' },'<Esc>', "<C-\\><C-n>")
cmd('autocmd TermOpen * setlocal nonumber norelativenumber')

require('options/colors')

vim.g.haskell_tools = { hls = { settings = vim.json.decode([[{"haskell": {
    "cabalFormattingProvider": "cabal-gild",
    "checkParents": "CheckOnSave",
    "checkProject": true,
    "formattingProvider": "ormolu",
    "maxCompletions": 40,
    "plugin": {
        "alternateNumberFormat": {
            "globalOn": true
        },
        "cabal": {
            "codeActionsOn": true,
            "completionOn": true,
            "diagnosticsOn": true
        },
        "cabal-fmt": {
            "config": {
                "path": "cabal-fmt"
            }
        },
        "cabal-gild": {
            "config": {
                "path": "cabal-gild"
            }
        },
        "callHierarchy": {
            "globalOn": true
        },
        "changeTypeSignature": {
            "globalOn": true
        },
        "class": {
            "codeActionsOn": true,
            "codeLensOn": true
        },
        "eval": {
            "config": {
                "diff": true,
                "exception": false
            },
            "globalOn": true
        },
        "explicit-fields": {
            "globalOn": true
        },
        "explicit-fixity": {
            "globalOn": true
        },
        "fourmolu": {
            "config": {
                "external": false,
                "path": "fourmolu"
            }
        },
        "gadt": {
            "globalOn": true
        },
        "ghcide-code-actions-bindings": {
            "globalOn": true
        },
        "ghcide-code-actions-fill-holes": {
            "globalOn": true
        },
        "ghcide-code-actions-imports-exports": {
            "globalOn": true
        },
        "ghcide-code-actions-type-signatures": {
            "globalOn": true
        },
        "ghcide-completions": {
            "config": {
                "autoExtendOn": true,
                "snippetsOn": true
            },
            "globalOn": true
        },
        "ghcide-hover-and-symbols": {
            "hoverOn": true,
            "symbolsOn": true
        },
        "ghcide-type-lenses": {
            "config": {
                "mode": "always"
            },
            "globalOn": true
        },
        "hlint": {
            "codeActionsOn": true,
            "config": {
                "flags": []
            },
            "diagnosticsOn": true
        },
        "importLens": {
            "codeActionsOn": true,
            "codeLensOn": true
        },
        "moduleName": {
            "globalOn": true
        },
        "ormolu": {
            "config": {
                "external": false
            }
        },
        "overloaded-record-dot": {
            "globalOn": true
        },
        "pragmas-completion": {
            "globalOn": true
        },
        "pragmas-disable": {
            "globalOn": true
        },
        "pragmas-suggest": {
            "globalOn": true
        },
        "qualifyImportedNames": {
            "globalOn": true
        },
        "rename": {
            "config": {
                "crossModule": false
            },
            "globalOn": true
        },
        "retrie": {
            "globalOn": true
        },
        "semanticTokens": {
            "config": {
                "classMethodToken": "method",
                "classToken": "class",
                "dataConstructorToken": "enumMember",
                "functionToken": "function",
                "moduleToken": "namespace",
                "operatorToken": "operator",
                "patternSynonymToken": "macro",
                "recordFieldToken": "property",
                "typeConstructorToken": "enum",
                "typeFamilyToken": "interface",
                "typeSynonymToken": "type",
                "typeVariableToken": "typeParameter",
                "variableToken": "variable"
            },
            "globalOn": false
        },
        "splice": {
            "globalOn": true
        },
        "stan": {
            "globalOn": false
        }
    },
    "sessionLoading": "singleComponent"
}}]])}}

local dap = require('dap')

dap.adapters.haskell = {
  type = 'executable';
  command = 'haskell-debug-adapter';
  args = {'--hackage-version=0.0.33.0'};
}
dap.configurations.haskell = {
  {
    type = 'haskell',
    request = 'launch',
    name = 'Debug',
    workspace = '${workspaceFolder}',
    startup = "${file}",
    stopOnEntry = true,
    logFile = vim.fn.stdpath('data') .. '/haskell-dap.log',
    logLevel = 'WARNING',
    ghciEnv = vim.empty_dict(),
    ghciPrompt = "λ: ",
    -- Adjust the prompt to the prompt you see when you invoke the stack ghci command below 
    ghciInitialPrompt = "λ: ",
    ghciCmd= "stack ghci --test --no-load --no-build --main-is TARGET --ghci-options -fprint-evld-with-show",
  },
}
