#!/bin/bash

# This script effectively resets rabbitmq on OSX. Often this is necessary if `sudo` has been used to start and stop brew services on OSX. 

# Set your username here
USERNAME=$(whoami)
HOME_DIR="/Users/$USERNAME"

echo "🐇 Fixing RabbitMQ startup issues..."

# Ensure HOME is set
export HOME="$HOME_DIR"
echo "✅ HOME set to $HOME"

# Stop RabbitMQ
echo "🔧 Stopping RabbitMQ..."
brew services stop rabbitmq

# Set feature flags config
ADV_CONFIG_DIR="$HOME/.config/rabbitmq"
ADV_CONFIG_FILE="$ADV_CONFIG_DIR/advanced.config"
mkdir -p "$ADV_CONFIG_DIR"

echo "📄 Writing feature flags to $ADV_CONFIG_FILE..."
cat <<EOF > "$ADV_CONFIG_FILE"
[
  {feature_flags, [
    {stream_filtering, true}
  ]}
].
EOF

# Copy to Homebrew location
BREW_CONFIG_FILE="/opt/homebrew/etc/rabbitmq/advanced.config"
echo "📄 Copying config to $BREW_CONFIG_FILE..."
cp "$ADV_CONFIG_FILE" "$BREW_CONFIG_FILE"

# Optional: clear RabbitMQ state (be cautious - this nukes persisted data)
echo "⚠️  Resetting RabbitMQ database (data will be lost)..."
rm -rf /opt/homebrew/var/lib/rabbitmq
mkdir -p /opt/homebrew/var/lib/rabbitmq

# Start RabbitMQ again
echo "🚀 Starting RabbitMQ..."
brew services start rabbitmq

echo "✅ Done. Check status with: brew services list"