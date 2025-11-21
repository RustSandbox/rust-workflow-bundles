#!/usr/bin/env bash
# Rust Workflow Bundles - Installation Script

set -e

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BUNDLES_FILE="$SCRIPT_DIR/rust-bundles.sh"

echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║          🦀 Rust Workflow Bundles Installer 🦀                   ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Check if rust-bundles.sh exists
if [ ! -f "$BUNDLES_FILE" ]; then
    echo -e "${RED}❌ Error: rust-bundles.sh not found in $SCRIPT_DIR${NC}"
    exit 1
fi

# Detect shell
if [ -n "$ZSH_VERSION" ]; then
    SHELL_TYPE="zsh"
    RC_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    SHELL_TYPE="bash"
    if [ -f "$HOME/.bashrc" ]; then
        RC_FILE="$HOME/.bashrc"
    else
        RC_FILE="$HOME/.bash_profile"
    fi
else
    echo -e "${YELLOW}⚠️  Warning: Unknown shell. Defaulting to bash.${NC}"
    SHELL_TYPE="bash"
    RC_FILE="$HOME/.bashrc"
fi

echo -e "${GREEN}✓${NC} Detected shell: $SHELL_TYPE"
echo -e "${GREEN}✓${NC} Shell config: $RC_FILE"
echo ""

# Check if already installed
if grep -q "rust-bundles.sh" "$RC_FILE" 2>/dev/null; then
    echo -e "${YELLOW}⚠️  Rust Workflow Bundles is already installed in $RC_FILE${NC}"
    echo ""
    read -p "Do you want to reinstall? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo -e "${BLUE}Installation cancelled.${NC}"
        exit 0
    fi

    # Remove old installation
    echo -e "${YELLOW}Removing old installation...${NC}"
    sed -i.backup '/rust-bundles.sh/d' "$RC_FILE"
fi

# Add to shell config
echo ""
echo -e "${BLUE}Installing Rust Workflow Bundles...${NC}"

SOURCE_LINE="source \"$BUNDLES_FILE\""

# Add source line to RC file
echo "" >> "$RC_FILE"
echo "# Rust Workflow Bundles" >> "$RC_FILE"
echo "$SOURCE_LINE" >> "$RC_FILE"

echo -e "${GREEN}✓${NC} Added to $RC_FILE"

# Source the file in current session
source "$BUNDLES_FILE"

echo -e "${GREEN}✓${NC} Sourced in current session"
echo ""

# Check for recommended tools
echo -e "${BLUE}Checking for recommended tools...${NC}"
echo ""

check_tool() {
    local tool=$1
    local install_cmd=$2

    if command -v "$tool" &> /dev/null; then
        echo -e "  ${GREEN}✓${NC} $tool"
        return 0
    else
        echo -e "  ${RED}✗${NC} $tool ${YELLOW}(install with: $install_cmd)${NC}"
        return 1
    fi
}

# Essential tools
check_tool "cargo" "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"

# Recommended cargo extensions
MISSING_TOOLS=()

if ! check_tool "cargo-nextest" "cargo install cargo-nextest"; then
    MISSING_TOOLS+=("cargo-nextest")
fi

if ! check_tool "cargo-audit" "cargo install cargo-audit"; then
    MISSING_TOOLS+=("cargo-audit")
fi

if ! check_tool "cargo-geiger" "cargo install cargo-geiger"; then
    MISSING_TOOLS+=("cargo-geiger")
fi

if ! check_tool "cargo-machete" "cargo install cargo-machete"; then
    MISSING_TOOLS+=("cargo-machete")
fi

if ! check_tool "watchexec" "cargo install watchexec-cli"; then
    MISSING_TOOLS+=("watchexec-cli")
fi

echo ""

if [ ${#MISSING_TOOLS[@]} -gt 0 ]; then
    echo -e "${YELLOW}Some recommended tools are missing.${NC}"
    echo ""
    read -p "Would you like to install them now? (y/N): " -n 1 -r
    echo

    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo ""
        echo -e "${BLUE}Installing missing tools...${NC}"
        echo -e "${YELLOW}This may take several minutes...${NC}"
        echo ""

        # Check if cargo-binstall is available (faster)
        if command -v cargo-binstall &> /dev/null; then
            echo -e "${GREEN}Using cargo-binstall (faster)${NC}"
            for tool in "${MISSING_TOOLS[@]}"; do
                echo -e "${BLUE}Installing $tool...${NC}"
                cargo binstall -y "$tool" || echo -e "${RED}Failed to install $tool${NC}"
            done
        else
            echo -e "${YELLOW}Tip: Install cargo-binstall for faster installations:${NC}"
            echo -e "${YELLOW}  cargo install cargo-binstall${NC}"
            echo ""

            for tool in "${MISSING_TOOLS[@]}"; do
                echo -e "${BLUE}Installing $tool...${NC}"
                cargo install "$tool" || echo -e "${RED}Failed to install $tool${NC}"
            done
        fi

        echo ""
        echo -e "${GREEN}✓${NC} Tool installation complete"
    fi
fi

echo ""
echo -e "${BLUE}╔══════════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║                    🎉 Installation Complete! 🎉                  ║${NC}"
echo -e "${BLUE}╚══════════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "${GREEN}Rust Workflow Bundles has been successfully installed!${NC}"
echo ""
echo -e "${YELLOW}Next steps:${NC}"
echo ""
echo -e "  1. Reload your shell:"
echo -e "     ${BLUE}source $RC_FILE${NC}"
echo -e ""
echo -e "  2. Or open a new terminal window"
echo -e ""
echo -e "  3. Try your first command:"
echo -e "     ${BLUE}cdev${NC}"
echo -e ""
echo -e "  4. See all available commands:"
echo -e "     ${BLUE}cbundles${NC}"
echo -e ""
echo -e "${YELLOW}Documentation:${NC}"
echo -e "  - Quick Reference: ${BLUE}docs/QUICK-REF.md${NC}"
echo -e "  - Cheat Sheet: ${BLUE}docs/CHEATSHEET.md${NC}"
echo -e "  - Full Docs: ${BLUE}docs/COMMANDS.md${NC}"
echo ""
echo -e "${GREEN}Happy Rust coding! 🦀${NC}"
echo ""
