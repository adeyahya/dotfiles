#!/bin/bash

# Dotfiles Installation Script
# This script installs all dependencies needed for the dotfiles configuration

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Homebrew is installed
check_homebrew() {
    print_info "Checking for Homebrew..."
    if ! command -v brew &> /dev/null; then
        print_error "Homebrew is not installed!"
        print_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        print_success "Homebrew installed successfully!"
    else
        print_success "Homebrew is already installed"
        print_info "Updating Homebrew..."
        brew update
    fi
}

# Install required dependencies
install_required() {
    print_info "Installing required dependencies..."

    # Neovim
    if ! command -v nvim &> /dev/null; then
        print_info "Installing Neovim..."
        brew install neovim
        print_success "Neovim installed"
    else
        print_success "Neovim is already installed"
    fi

    # Zsh (usually pre-installed on macOS, but let's make sure)
    if ! command -v zsh &> /dev/null; then
        print_info "Installing Zsh..."
        brew install zsh
        print_success "Zsh installed"
    else
        print_success "Zsh is already installed"
    fi

    # Tmux
    if ! command -v tmux &> /dev/null; then
        print_info "Installing Tmux..."
        brew install tmux
        print_success "Tmux installed"
    else
        print_success "Tmux is already installed"
    fi
}

# Install optional dependencies
install_optional() {
    print_info "Installing optional dependencies..."

    # Nushell
    if ! command -v nu &> /dev/null; then
        print_info "Installing Nushell..."
        brew install nushell
        print_success "Nushell installed"
    else
        print_success "Nushell is already installed"
    fi

    # Bun
    if ! command -v bun &> /dev/null; then
        print_info "Installing Bun..."
        brew install bun
        print_success "Bun installed"
    else
        print_success "Bun is already installed"
    fi

    # LazyGit
    if ! command -v lazygit &> /dev/null; then
        print_info "Installing LazyGit..."
        brew install lazygit
        print_success "LazyGit installed"
    else
        print_success "LazyGit is already installed"
    fi

    # ripgrep
    if ! command -v rg &> /dev/null; then
        print_info "Installing ripgrep..."
        brew install ripgrep
        print_success "ripgrep installed"
    else
        print_success "ripgrep is already installed"
    fi

    # fd (useful for Telescope)
    if ! command -v fd &> /dev/null; then
        print_info "Installing fd..."
        brew install fd
        print_success "fd installed"
    else
        print_success "fd is already installed"
    fi
}

# Install fonts
install_fonts() {
    print_info "Installing Nerd Fonts..."

    # Tap the cask-fonts repository
    brew tap homebrew/cask-fonts

    # Install Cascadia Code Nerd Font
    if ! brew list --cask font-cascadia-code-nf &> /dev/null; then
        print_info "Installing Cascadia Code Nerd Font..."
        brew install --cask font-cascadia-code-nf
        print_success "Cascadia Code Nerd Font installed"
    else
        print_success "Cascadia Code Nerd Font is already installed"
    fi
}

# Install Oh My Zsh
install_oh_my_zsh() {
    print_info "Checking for Oh My Zsh..."

    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_info "Installing Oh My Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
        print_success "Oh My Zsh installed"
    else
        print_success "Oh My Zsh is already installed"
    fi
}

# Install Tmux Plugin Manager
install_tpm() {
    print_info "Checking for Tmux Plugin Manager (TPM)..."

    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        print_info "Installing TPM..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        print_success "TPM installed"
    else
        print_success "TPM is already installed"
    fi
}

# Create symbolic links
create_symlinks() {
    print_info "Creating symbolic links..."

    DOTFILES_DIR="$HOME/.dotfiles"

    if [ ! -d "$DOTFILES_DIR" ]; then
        print_warning "Dotfiles directory not found at $DOTFILES_DIR"
        print_info "Skipping symlink creation. Please clone the repository first."
        return
    fi

    # Backup existing configs
    backup_dir="$HOME/.dotfiles_backup_$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"

    # Zsh
    if [ -f "$HOME/.zshrc" ] && [ ! -L "$HOME/.zshrc" ]; then
        print_info "Backing up existing .zshrc"
        mv "$HOME/.zshrc" "$backup_dir/.zshrc"
    fi
    ln -sf "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
    print_success "Linked .zshrc"

    # Tmux
    if [ -f "$HOME/.tmux.conf" ] && [ ! -L "$HOME/.tmux.conf" ]; then
        print_info "Backing up existing .tmux.conf"
        mv "$HOME/.tmux.conf" "$backup_dir/.tmux.conf"
    fi
    ln -sf "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME/.tmux.conf"
    print_success "Linked .tmux.conf"

    # Neovim
    if [ -d "$HOME/.config/nvim" ] && [ ! -L "$HOME/.config/nvim" ]; then
        print_info "Backing up existing nvim config"
        mv "$HOME/.config/nvim" "$backup_dir/nvim"
    fi
    mkdir -p "$HOME/.config"
    ln -sf "$DOTFILES_DIR/nvim/.config/nvim" "$HOME/.config/nvim"
    print_success "Linked nvim config"

    # Ghostty
    if [ -d "$DOTFILES_DIR/ghostty/.config/ghostty" ]; then
        if [ -d "$HOME/.config/ghostty" ] && [ ! -L "$HOME/.config/ghostty" ]; then
            print_info "Backing up existing ghostty config"
            mv "$HOME/.config/ghostty" "$backup_dir/ghostty"
        fi
        ln -sf "$DOTFILES_DIR/ghostty/.config/ghostty" "$HOME/.config/ghostty"
        print_success "Linked ghostty config"
    fi

    if [ "$(ls -A $backup_dir 2>/dev/null)" ]; then
        print_info "Backups saved to: $backup_dir"
    else
        rmdir "$backup_dir"
    fi
}

# Create private.zsh file
create_private_zsh() {
    print_info "Checking for private.zsh..."

    if [ ! -f "$HOME/private.zsh" ]; then
        print_info "Creating private.zsh file..."
        cat > "$HOME/private.zsh" << 'EOF'
# Private configuration file
# Add your private environment variables and API keys here

# Example: API keys for Avante.nvim
# export OPENROUTER_API_KEY="your-key-here"
# export ANTHROPIC_API_KEY="your-key-here"

# Add other private configurations below
EOF
        print_success "Created private.zsh template"
        print_warning "Remember to add your API keys to ~/private.zsh"
    else
        print_success "private.zsh already exists"
    fi
}

# Main installation function
main() {
    echo ""
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║                                                       ║"
    echo "║         Dotfiles Installation Script                 ║"
    echo "║                                                       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""

    # Check for Homebrew
    check_homebrew
    echo ""

    # Install required dependencies
    install_required
    echo ""

    # Install optional dependencies
    print_info "Do you want to install optional dependencies? (Nushell, Bun, LazyGit, ripgrep, fd) [Y/n]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY]|)$ ]]; then
        install_optional
        echo ""
    fi

    # Install fonts
    print_info "Do you want to install Cascadia Code Nerd Font? [Y/n]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY]|)$ ]]; then
        install_fonts
        echo ""
    fi

    # Install Oh My Zsh
    install_oh_my_zsh
    echo ""

    # Install TPM
    install_tpm
    echo ""

    # Create symlinks
    print_info "Do you want to create symbolic links for dotfiles? [Y/n]"
    read -r response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY]|)$ ]]; then
        create_symlinks
        echo ""
    fi

    # Create private.zsh
    create_private_zsh
    echo ""

    # Final instructions
    echo "╔═══════════════════════════════════════════════════════╗"
    echo "║                                                       ║"
    echo "║         Installation Complete!                        ║"
    echo "║                                                       ║"
    echo "╚═══════════════════════════════════════════════════════╝"
    echo ""
    print_success "All dependencies have been installed!"
    echo ""
    print_info "Next steps:"
    echo "  1. Restart your terminal or run: source ~/.zshrc"
    echo "  2. Open Neovim to install plugins: nvim"
    echo "  3. Start tmux and install plugins: tmux (then press Ctrl+a + I)"
    echo "  4. Add your API keys to ~/private.zsh if using Avante.nvim"
    echo ""
    print_warning "Note: You may need to set Zsh as your default shell:"
    echo "  chsh -s \$(which zsh)"
    echo ""
}

# Run main function
main

