#!/usr/bin/env bash
set -euo pipefail

# Wait for anvil
until curl -sf http://anvil:8545 >/dev/null; do sleep 1; done

# Clone or mount your contracts repo
# (If you prefer, bake contracts into a custom image and skip this clone.)
git clone --depth=1 https://github.com/ZoaGrad/scarcoin-contracts /contracts
cd /contracts

# Install and build
forge --version
forge build

# Deploy (example; adjust to your script)
# Expect your deploy script to print addresses to JSON.
forge script script/Deploy.s.sol:Deploy \
  --broadcast --rpc-url http://anvil:8545 --legacy --json > /out/addresses.json

# Optionally export ABIs for UI/indexer
mkdir -p /out/abis
cp -r out/*/*.json /out/abis || true
echo "Contracts deployed. Addresses at /out/addresses.json"
