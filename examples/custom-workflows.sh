#!/usr/bin/env bash
# Custom Workflow Examples
# Add these to your ~/.zshrc or ~/.bashrc after sourcing rust-bundles.sh

# ============================================================================
# PROJECT-SPECIFIC WORKFLOWS
# ============================================================================

# Database workflow
cdb() {
  echo "🗄️  Database Workflow" &&
  cargo run --bin migrate reset &&
  cargo run --bin migrate up &&
  cargo run --bin seed &&
  echo "✅ Database ready!"
}

# API server workflow
capi() {
  echo "🌐 Starting API server..." &&
  cargo fmt &&
  cargo clippy -- -D warnings &&
  cargo test &&
  cargo run --bin api-server
}

# Deploy workflow
cdeploy() {
  echo "🚀 Deploying..." &&
  cci &&
  cargo build --release --target x86_64-unknown-linux-musl &&
  scp target/x86_64-unknown-linux-musl/release/myapp server:/opt/apps/ &&
  ssh server "systemctl restart myapp" &&
  echo "✅ Deployed!"
}

# ============================================================================
# TEAM WORKFLOWS
# ============================================================================

# Before standup
cmystandup() {
  echo "📊 Standup Prep" &&
  git fetch &&
  git status &&
  chealth &&
  cargo build --release &&
  echo "✅ Ready for standup!"
}

# Code review workflow
creview() {
  local branch=${1:-main}
  echo "👀 Reviewing changes from $branch..." &&
  git diff "$branch"...HEAD --stat &&
  cci &&
  cargo semver-checks &&
  echo "✅ Review complete!"
}

# Pair programming setup
cpair() {
  echo "👥 Pair Programming Setup" &&
  cargo clean &&
  cargo build &&
  cargo test &&
  cwatchdev
}

# ============================================================================
# LIBRARY-SPECIFIC WORKFLOWS
# ============================================================================

# Library release workflow
clibrelease() {
  echo "📦 Library Release Workflow" &&
  cprelease &&
  cargo doc --open &&
  read -p "Documentation looks good? (y/n): " confirm &&
  if [[ $confirm == [yY] ]]; then
    crelease "$1" &&
    cargo publish
  fi
}

# Check all examples
cexamples() {
  echo "📚 Checking all examples..." &&
  for example in examples/*.rs; do
    local name=$(basename "$example" .rs)
    echo "▸ Testing example: $name" &&
    cargo run --example "$name" || return 1
  done &&
  echo "✅ All examples work!"
}

# ============================================================================
# PERFORMANCE WORKFLOWS
# ============================================================================

# Optimization workflow
copt() {
  echo "⚡ Optimization Workflow" &&
  cargo build --release &&
  cargo bloat --release --crates &&
  cargo criterion --bench "$1" &&
  cargo flamegraph --bin "$2" &&
  echo "✅ Optimization analysis complete!"
}

# Compare performance
ccompare() {
  echo "📊 Performance Comparison" &&
  git stash &&
  cargo criterion --bench "$1" --save-baseline before &&
  git stash pop &&
  cargo criterion --bench "$1" --baseline before &&
  echo "✅ Comparison complete!"
}

# ============================================================================
# DOCUMENTATION WORKFLOWS
# ============================================================================

# Documentation workflow
cdocs() {
  echo "📚 Documentation Workflow" &&
  cargo doc --all-features --document-private-items --open &&
  cargo test --doc &&
  echo "✅ Documentation ready!"
}

# Update README examples
creadme() {
  echo "📝 Testing README examples..." &&
  cargo test --doc &&
  cargo run --example readme_example &&
  echo "✅ README examples verified!"
}

# ============================================================================
# TESTING WORKFLOWS
# ============================================================================

# Integration test workflow
cintegration() {
  echo "🔗 Integration Tests" &&
  docker-compose up -d &&
  sleep 5 &&
  cargo test --test integration &&
  docker-compose down &&
  echo "✅ Integration tests complete!"
}

# End-to-end test workflow
ce2e() {
  echo "🎭 E2E Tests" &&
  cargo build --release &&
  ./scripts/start-test-env.sh &&
  cargo test --test e2e -- --test-threads=1 &&
  ./scripts/stop-test-env.sh &&
  echo "✅ E2E tests complete!"
}

# Stress test
cstress() {
  echo "💪 Stress Testing" &&
  cargo build --release &&
  cargo bench --bench stress_test &&
  echo "✅ Stress test complete!"
}

# ============================================================================
# SPECIALIZED WORKFLOWS
# ============================================================================

# WASM build workflow
cwasm() {
  echo "🌐 WASM Build" &&
  cargo build --target wasm32-unknown-unknown &&
  wasm-pack build --target web &&
  echo "✅ WASM build complete!"
}

# Cross-compilation workflow
ccross() {
  echo "🌍 Cross-Compilation" &&
  cargo build --target x86_64-unknown-linux-gnu &&
  cargo build --target x86_64-apple-darwin &&
  cargo build --target x86_64-pc-windows-gnu &&
  echo "✅ Cross-compilation complete!"
}

# Mobile build
cmobile() {
  echo "📱 Mobile Build" &&
  cargo build --target aarch64-linux-android &&
  cargo build --target aarch64-apple-ios &&
  echo "✅ Mobile builds complete!"
}

# ============================================================================
# CONTINUOUS INTEGRATION WORKFLOWS
# ============================================================================

# Local CI simulation (advanced)
ccilocal() {
  echo "🤖 Advanced CI Simulation" &&
  echo "Running in clean container..." &&
  docker run --rm -v "$(pwd)":/app -w /app rust:latest bash -c "
    cargo fmt -- --check &&
    cargo clippy --all-targets --all-features -- -D warnings &&
    cargo test --all-features &&
    cargo doc --no-deps &&
    cargo build --release
  " &&
  echo "✅ Local CI complete!"
}

# PR checks
cprcheck() {
  echo "✅ PR Checks" &&
  git fetch origin main &&
  cargo fmt -- --check &&
  cargo clippy --all-targets --all-features -- -D warnings &&
  cargo test --all-features &&
  cargo semver-checks check-release &&
  git diff origin/main...HEAD --name-only &&
  echo "✅ PR ready!"
}

# ============================================================================
# CLEANUP WORKFLOWS
# ============================================================================

# Deep clean
cdeepclean() {
  echo "🧹 Deep Clean" &&
  cargo clean &&
  rm -rf target/ &&
  rm -f Cargo.lock &&
  cargo build &&
  cargo test &&
  echo "✅ Deep clean complete!"
}

# Clean old artifacts
ccleanold() {
  echo "🧹 Cleaning old artifacts..." &&
  cargo sweep --time 30 &&
  echo "✅ Old artifacts cleaned!"
}

# ============================================================================
# DEBUG WORKFLOWS
# ============================================================================

# Debug build and run with logging
cdebug() {
  echo "🐛 Debug Mode" &&
  RUST_BACKTRACE=1 RUST_LOG=debug cargo run "$@"
}

# Debug with full backtrace
cdebugfull() {
  echo "🐛 Debug Mode (Full Backtrace)" &&
  RUST_BACKTRACE=full RUST_LOG=trace cargo run "$@"
}

# Run with profiler
cprofile() {
  echo "📊 Profiling..." &&
  cargo build --release &&
  perf record -g ./target/release/"$1" &&
  perf report &&
  echo "✅ Profiling complete!"
}

# ============================================================================
# UTILITY WORKFLOWS
# ============================================================================

# Quick benchmark
cqbench() {
  echo "⏱️  Quick Benchmark" &&
  cargo build --release &&
  hyperfine './target/release/'"$1"
}

# Size optimization
csize() {
  echo "📦 Size Optimization" &&
  cargo build --release &&
  strip target/release/"$1" &&
  upx --best --lzma target/release/"$1" &&
  ls -lh target/release/"$1" &&
  echo "✅ Size optimized!"
}

# License check
clicense() {
  echo "⚖️  License Check" &&
  cargo license &&
  cargo deny check licenses &&
  echo "✅ Licenses OK!"
}

# ============================================================================
# COLLABORATIVE WORKFLOWS
# ============================================================================

# Before PR review
cprreview() {
  echo "👀 Before PR Review" &&
  git pull origin main &&
  cargo update &&
  cci &&
  echo "✅ Ready to review PRs!"
}

# Merge preparation
cmerge() {
  local branch=${1:-main}
  echo "🔀 Merge Preparation" &&
  git fetch origin "$branch" &&
  git merge "origin/$branch" &&
  cargo update &&
  cargo test &&
  echo "✅ Ready to merge!"
}

# ============================================================================
# CUSTOM HELP FUNCTION
# ============================================================================

# Show custom workflows
cmyhelp() {
  echo "🛠️  Custom Workflows"
  echo ""
  echo "Project:"
  echo "  cdb           Database workflow"
  echo "  capi          API server workflow"
  echo "  cdeploy       Deploy workflow"
  echo ""
  echo "Team:"
  echo "  cmystandup    Standup preparation"
  echo "  creview       Code review workflow"
  echo "  cpair         Pair programming setup"
  echo ""
  echo "Library:"
  echo "  clibrelease   Library release workflow"
  echo "  cexamples     Check all examples"
  echo ""
  echo "Performance:"
  echo "  copt          Optimization workflow"
  echo "  ccompare      Compare performance"
  echo ""
  echo "Testing:"
  echo "  cintegration  Integration tests"
  echo "  ce2e          End-to-end tests"
  echo ""
  echo "Specialized:"
  echo "  cwasm         WASM build"
  echo "  ccross        Cross-compilation"
  echo ""
  echo "Debug:"
  echo "  cdebug        Debug with logging"
  echo "  cprofile      Profile application"
  echo ""
}

# ============================================================================
# INITIALIZATION MESSAGE
# ============================================================================

echo "✅ Custom workflows loaded! Type 'cmyhelp' for a list."
