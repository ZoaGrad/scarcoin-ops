#!/usr/bin/env bash
set -euo pipefail

# Example: score a sample ache and mint via agent
curl -s -X POST http://localhost:8000/score \
  -H "Content-Type: application/json" \
  -d '{"ache_text":"My chest tightens when I lie about what I want."}' | jq .
