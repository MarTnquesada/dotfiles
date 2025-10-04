# Install Ghostty (this uses a community-maintained setup so review every once in a while)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"

# Install Rust toolchain 


# Install Python toolchain: uv, ruff and lsp server
curl -LsSf https://astral.sh/uv/install.sh | sh
uv tool install ruff
uv tool install python-lsp-server

# Install ripgrep (needed for telescope.nvim grep search)
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.1-1_amd64.deb
sudo dpkg -i ripgrep_14.1.1-1_amd64.deb

# Install NeoVim v0.11.3
