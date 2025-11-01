# Dotfiles

Personal dotfiles for managing shell and terminal configurations.

## 📁 Structure

```
.
├── zsh/          # Zsh shell configuration
│   └── .zshrc    # Zsh configuration file
├── tmux/         # Tmux terminal multiplexer configuration
│   └── .tmux.conf # Tmux configuration file
├── ghostty/      # Ghostty terminal emulator configuration
│   └── .config/ghostty/config # Ghostty configuration file
└── nvim/         # Neovim editor configuration
    └── .config/nvim/
        ├── init.lua           # Main Neovim configuration
        ├── lazy-lock.json     # Plugin version lock file
        └── lua/adeyahya/      # Custom Lua modules
            ├── config/        # Core configuration
            ├── plugin/        # Plugin configurations
            └── lsp.lua        # LSP setup
```

## 🚀 Features

### Ghostty Configuration
- **Font**: Cascadia Code NF at 14pt with font thickening enabled
- **Theme**: Catppuccin Mocha (dark) / Catppuccin Latte (light)
- **Transparency**: 92% background opacity with no blur
- **Auto-launch**: Automatically starts tmux on terminal launch
- **Minimal padding**: 4px horizontal window padding

### Neovim Configuration
- **Plugin Manager**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast plugin management
- **Theme**: Catppuccin Mocha with transparent background
- **Leader Key**: Space (`<Space>`)
- **LSP Support**: Lua and TypeScript language servers enabled
- **AI Integration**:
  - [Avante.nvim](https://github.com/yetone/avante.nvim) with Claude Sonnet 4.5, OpenRouter, and Moonshot support
  - [Copilot.lua](https://github.com/zbirenbaum/copilot.lua) for AI-powered code suggestions
- **File Navigation**:
  - [Telescope](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
  - [Oil.nvim](https://github.com/stevearc/oil.nvim) for file browsing (mapped to `-`)
  - [Neo-tree](https://github.com/nvim-neo-tree/neo-tree.nvim) as alternative file explorer
- **Git Integration**:
  - [LazyGit](https://github.com/kdheepak/lazygit.nvim) for terminal UI (mapped to `<leader>lg`)
  - [Neogit](https://github.com/NeogitOrg/neogit) for Magit-like interface
  - [Gitsigns](https://github.com/lewis6991/gitsigns.nvim) for inline git decorations
  - [Diffview](https://github.com/sindrets/diffview.nvim) for viewing diffs
- **Code Editing**:
  - [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
  - [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) & [blink.cmp](https://github.com/Saghen/blink.cmp) for completion
  - [nvim-surround](https://github.com/kylechui/nvim-surround) for surrounding text objects
  - [nvim-autopairs](https://github.com/windwp/nvim-autopairs) for auto-closing brackets
  - [Comment.nvim](https://github.com/numToStr/Comment.nvim) for easy commenting
  - [conform.nvim](https://github.com/stevearc/conform.nvim) for code formatting
- **UI Enhancements**:
  - [lualine](https://github.com/nvim-lualine/lualine.nvim) for statusline
  - [bufferline](https://github.com/akinsho/bufferline.nvim) for buffer tabs
  - [alpha-nvim](https://github.com/goolord/alpha-nvim) for start screen
  - [which-key](https://github.com/folke/which-key.nvim) for keybinding hints
  - [indent-blankline](https://github.com/lukas-reineke/indent-blankline.nvim) for indent guides
  - [eyeliner.nvim](https://github.com/jinh0/eyeliner.nvim) for enhanced f/t motions
- **Markdown Support**:
  - [render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim) for markdown rendering
  - [mdx.nvim](https://github.com/davidmh/mdx.nvim) for MDX file support
  - [img-clip.nvim](https://github.com/HakonHarnes/img-clip.nvim) for image pasting
- **Editor Settings**:
  - Line numbers with relative numbering
  - 2-space indentation (tabs converted to spaces)
  - No swap/backup files
  - Smart case-insensitive search
  - Vim-style window navigation (`Ctrl+h/j/k/l`)
  - Quick save with `;;`

### Zsh Configuration
- **Oh My Zsh** integration with `robbyrussell` theme
- **Neovim** as default editor with convenient aliases (`vim`, `v`)
- **Nushell** auto-execution when inside tmux sessions
- **Docker CLI** completions
- **Bun** runtime support and completions
- **LM Studio CLI** integration
- Git plugin enabled

### Tmux Configuration
- **Custom prefix**: `Ctrl+a` (instead of default `Ctrl+b`)
- **Mouse support** enabled
- **Vim-style pane navigation**: `h`, `j`, `k`, `l`
- **Intuitive pane splitting**:
  - `|` for horizontal split
  - `-` for vertical split
- **Catppuccin Mocha** theme
- **Status bar** with:
  - CPU usage
  - Battery status
  - Session info
  - Uptime
- **Plugins**:
  - [TPM](https://github.com/tmux-plugins/tpm) - Tmux Plugin Manager
  - [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) - Basic tmux settings
  - [catppuccin/tmux](https://github.com/catppuccin/tmux) - Catppuccin theme
  - [tmux-resurrect](https://github.com/tmux-plugins/tmux-resurrect) - Save/restore sessions
  - [tmux-continuum](https://github.com/tmux-plugins/tmux-continuum) - Automatic session saving
  - [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - Seamless vim/tmux navigation

## 📋 Prerequisites

- [Ghostty](https://ghostty.org/) - Modern terminal emulator
- [Neovim](https://neovim.io/) (v0.9.0+) - Hyperextensible Vim-based text editor
- [Zsh](https://www.zsh.org/) - Shell
- [Oh My Zsh](https://ohmyzsh.sh/) - Zsh framework
- [Tmux](https://github.com/tmux/tmux) - Terminal multiplexer
- [Nushell](https://www.nushell.sh/) (optional, for tmux integration)
- [Bun](https://bun.sh/) (optional, for JavaScript runtime)
- [Cascadia Code NF](https://github.com/ryanoasis/nerd-fonts) - Nerd Font for Ghostty
- [LazyGit](https://github.com/jesseduffield/lazygit) (optional, for git UI in Neovim)
- [ripgrep](https://github.com/BurntSushi/ripgrep) (recommended, for Telescope live grep)

## 🔧 Installation

1. **Clone the repository**:
   ```bash
   git clone git@github.com:adeyahya/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Create symbolic links**:
   ```bash
   # Ghostty configuration
   ln -sf ~/.dotfiles/ghostty/.config/ghostty ~/.config/ghostty

   # Neovim configuration
   ln -sf ~/.dotfiles/nvim/.config/nvim ~/.config/nvim

   # Zsh configuration
   ln -sf ~/.dotfiles/zsh/.zshrc ~/.zshrc

   # Tmux configuration
   ln -sf ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf
   ```

3. **Install Neovim plugins**:
   - Open Neovim: `nvim`
   - Lazy.nvim will automatically install all plugins on first launch
   - Wait for all plugins to install
   - Restart Neovim

4. **Install Tmux Plugin Manager (TPM)**:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

5. **Install tmux plugins**:
   - Start tmux: `tmux`
   - Press `Ctrl+a` + `I` (capital i) to install plugins

6. **Create private configuration** (for sensitive data):
   ```bash
   touch ~/private.zsh
   # Add your private environment variables and configurations here

   # For Avante.nvim AI features, add API keys:
   echo 'export OPENROUTER_API_KEY="your-key-here"' >> ~/private.zsh
   echo 'export ANTHROPIC_API_KEY="your-key-here"' >> ~/private.zsh
   ```

7. **Reload configurations**:
   ```bash
   # Reload zsh
   source ~/.zshrc

   # Reload tmux (inside tmux session)
   tmux source ~/.tmux.conf
   ```

## ⌨️ Key Bindings

### Neovim Key Bindings

| Key Binding | Action |
|------------|--------|
| `<Space>` | Leader key |
| `;;` | Save file |
| `Ctrl+h/j/k/l` | Navigate windows (left/down/up/right) |
| `-` | Open parent directory (Oil.nvim) |
| `<leader>lg` | Open LazyGit |
| `<leader>ff` | Find files (Telescope) |
| `<leader>fg` | Live grep (Telescope) |
| `<leader>fb` | Browse buffers (Telescope) |
| `<leader>fh` | Help tags (Telescope) |

### Tmux Key Bindings

| Key Binding | Action |
|------------|--------|
| `Ctrl+a` | Prefix key |
| `Prefix + \|` | Split pane horizontally |
| `Prefix + -` | Split pane vertically |
| `Prefix + h/j/k/l` | Navigate panes (left/down/up/right) |
| `Prefix + Ctrl+s` | Save tmux session |
| `Prefix + Ctrl+r` | Restore tmux session |
| `Prefix + I` | Install plugins |
| `Prefix + U` | Update plugins |
| `Prefix + Alt+u` | Uninstall plugins |
| `Ctrl+y` | Copy to system clipboard (WSL) |

## 🎨 Customization

### Ghostty
Edit `ghostty/.config/ghostty/config` to customize:
- Font family and size
- Color theme
- Background opacity and blur
- Window padding
- Default shell command

### Neovim
Edit files in `nvim/.config/nvim/lua/adeyahya/` to customize:
- `init.lua` - Core editor settings and key bindings
- `plugin/` - Individual plugin configurations
- `lsp.lua` - Language server settings
- Add new plugins by creating files in `plugin/` directory

### Zsh
Edit `zsh/.zshrc` to customize:
- Shell theme
- Plugins
- Aliases
- Environment variables

### Tmux
Edit `tmux/.tmux.conf` to customize:
- Key bindings
- Theme and colors
- Status bar content
- Plugin configurations

## 📝 Notes

- The `.zshrc` sources a `~/private.zsh` file for private configurations
- Nushell is automatically executed when inside tmux sessions
- The configuration includes WSL-specific clipboard integration
- Window and pane indexing starts at 1 instead of 0

## 📄 License

This is a personal configuration repository. Feel free to use and modify as needed.

## 🤝 Contributing

This is a personal dotfiles repository, but suggestions and improvements are welcome via issues or pull requests.

