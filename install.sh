#!/bin/bash

# IndexTTS Installation Script

echo "🎵 IndexTTS2 Installation"
echo "========================="

# Install uv
echo "📦 Installing uv..."
curl -LsSf https://astral.sh/uv/install.sh | sh

# Spawn new bash shell with uv in PATH
echo "🔄 Spawning new shell with uv..."
exec bash -c '
source "$HOME/.cargo/env" 2>/dev/null || true

echo "✅ uv installed: $(uv --version)"

# Install dependencies
echo "📦 Installing dependencies..."
uv sync --all-extras

# Download model
echo "📥 Downloading IndexTTS-2 model..."
uv tool install "huggingface-hub[cli,hf_xet]"
hf download IndexTeam/IndexTTS-2 --local-dir=checkpoints

echo ""
echo "🎉 Installation complete!"
echo ""
echo "To start the web interface:"
echo "  uv run webui.py"
echo ""
echo "To start with GPU acceleration (if available):"
echo "  uv run webui.py --fp16"
'