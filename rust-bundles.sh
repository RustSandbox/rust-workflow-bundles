#!/usr/bin/env bash
# Rust Workflow Bundle Aliases
# Source this file in your ~/.zshrc or ~/.bashrc:
# source ~/path/to/rust-bundles.sh

# ============================================================================
# ESSENTIAL WORKFLOW BUNDLES
# ============================================================================

# Complete development cycle
alias cdev='cargo fmt && cargo clippy -- -D warnings && cargo test && cargo build'
alias cdevfast='cargo check && cargo test'
alias cdevquick='cargo check'
alias cdevx='cargo fmt && cargo clippy -- -D warnings && cargo nextest run && cargo build'

# ============================================================================
# QUALITY GATES
# ============================================================================

# Pre-commit checks
cpre() {
  echo "🔍 Format check..." && cargo fmt -- --check &&
  echo "📎 Clippy..." && cargo clippy -- -D warnings &&
  echo "🧪 Tests..." && cargo test &&
  echo "✅ Ready to commit!"
}

# Strict quality
cstrict() {
  cargo fmt -- --check &&
  cargo clippy --all-targets --all-features -- -D warnings -W clippy::pedantic &&
  cargo test --all-features &&
  cargo doc --no-deps
}

# Ultra-strict quality
cstrict-ultra() {
  cargo fmt -- --check &&
  cargo clippy --all-targets --all-features -- -D warnings -W clippy::pedantic -W clippy::nursery &&
  cargo geiger &&
  cargo nextest run --all-features &&
  cargo deny check
}

# ============================================================================
# SECURITY & AUDIT BUNDLES
# ============================================================================

# Complete security audit
csecaudit() {
  echo "🔒 Security Audit" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Checking for vulnerabilities..." &&
  cargo audit &&
  echo "" &&
  echo "2️⃣ Detecting unsafe code..." &&
  cargo geiger &&
  echo "" &&
  echo "3️⃣ Checking dependencies..." &&
  cargo deny check advisories &&
  echo "" &&
  echo "4️⃣ License compliance..." &&
  cargo deny check licenses &&
  echo "" &&
  echo "✅ Security audit complete!"
}

# Quick security check
csecquick() {
  cargo audit && cargo geiger
}

# ============================================================================
# DEPENDENCY MANAGEMENT BUNDLES
# ============================================================================

# Complete dependency health check
cdephealth() {
  echo "📦 Dependency Health Check" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Unused dependencies..." &&
  cargo machete &&
  echo "" &&
  echo "2️⃣ Outdated packages..." &&
  cargo outdated &&
  echo "" &&
  echo "3️⃣ Security vulnerabilities..." &&
  cargo audit &&
  echo "" &&
  echo "4️⃣ Duplicate dependencies..." &&
  cargo tree --duplicates &&
  echo "" &&
  echo "✅ Dependency check complete!"
}

# Clean and update everything
cdeprefresh() {
  echo "🧹 Cleaning..." &&
  cargo clean &&
  echo "⬆️ Updating dependencies..." &&
  cargo update &&
  echo "🔧 Checking compilation..." &&
  cargo check &&
  echo "✅ Dependencies refreshed!"
}

# Fix all dependency issues
cdepfix() {
  cargo machete --fix &&
  cargo update &&
  cargo audit fix
}

# ============================================================================
# TESTING BUNDLES
# ============================================================================

# Run all test types
ctestall() {
  echo "🧪 Running all tests..." &&
  cargo test --lib &&
  cargo test --bins &&
  cargo test --tests &&
  cargo test --doc &&
  cargo test --examples &&
  echo "✅ All tests passed!"
}

# Test with coverage
ctestcov() {
  cargo nextest run &&
  cargo tarpaulin --out Html --output-dir coverage &&
  echo "📊 Coverage report: coverage/index.html" &&
  (open coverage/index.html 2>/dev/null || xdg-open coverage/index.html 2>/dev/null || true)
}

# Test all feature combinations
ctestfeatures() {
  echo "🔀 Testing feature combinations..." &&
  cargo hack test --feature-powerset --depth 2 &&
  echo "✅ All feature combinations work!"
}

# Advanced testing suite
ctestadvanced() {
  echo "🧪 Standard tests..." &&
  cargo nextest run &&
  echo "🔀 Feature combinations..." &&
  cargo hack test --each-feature &&
  echo "🧬 Mutation testing..." &&
  cargo mutants --test-tool nextest &&
  echo "✅ Advanced testing complete!"
}

# ============================================================================
# PERFORMANCE BUNDLES
# ============================================================================

# Full performance analysis
cperfcheck() {
  echo "⚡ Performance Analysis" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Running benchmarks..." &&
  cargo criterion &&
  echo "" &&
  echo "2️⃣ Generating flamegraph..." &&
  cargo flamegraph &&
  echo "" &&
  echo "3️⃣ Binary size analysis..." &&
  cargo bloat --release --crates &&
  echo "" &&
  echo "✅ Performance analysis complete!"
}

# Quick performance check
cperfquick() {
  cargo build --release &&
  cargo bloat --release &&
  cargo criterion
}

# Build optimized binary with analysis
cbuildopt() {
  cargo build --release &&
  cargo bloat --release --crates &&
  ls -lh target/release/
}

# ============================================================================
# CI/CD SIMULATION
# ============================================================================

# Simulate GitHub Actions CI locally
cci() {
  echo "🤖 Simulating CI Pipeline" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Format check..." &&
  cargo fmt -- --check &&
  echo "" &&
  echo "2️⃣ Clippy (all targets, all features)..." &&
  cargo clippy --all-targets --all-features -- -D warnings &&
  echo "" &&
  echo "3️⃣ Tests (all features)..." &&
  cargo nextest run --all-features 2>/dev/null || cargo test --all-features &&
  echo "" &&
  echo "4️⃣ Doc check..." &&
  cargo doc --no-deps --all-features &&
  echo "" &&
  echo "5️⃣ Build check..." &&
  cargo build --all-features &&
  echo "" &&
  echo "✅ CI pipeline passed!"
}

# Full CI with security checks
ccifull() {
  echo "🤖 Full CI Pipeline" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  cargo fmt -- --check &&
  cargo clippy --all-targets --all-features -- -D warnings &&
  (cargo nextest run --all-features 2>/dev/null || cargo test --all-features) &&
  cargo doc --no-deps &&
  cargo audit &&
  cargo deny check &&
  cargo geiger &&
  cargo semver-checks &&
  echo "✅ Full CI passed!"
}

# Minimal CI for quick feedback
ccifast() {
  cargo fmt -- --check &&
  cargo clippy -- -D warnings &&
  (cargo nextest run 2>/dev/null || cargo test)
}

# ============================================================================
# RELEASE PREPARATION
# ============================================================================

# Pre-release checklist
cprelease() {
  echo "🚀 Pre-Release Checklist" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Format & Clippy..." &&
  cargo fmt -- --check &&
  cargo clippy --all-targets --all-features -- -D warnings &&
  echo "" &&
  echo "2️⃣ All tests..." &&
  cargo test --all-features &&
  echo "" &&
  echo "3️⃣ Documentation..." &&
  cargo doc --no-deps &&
  echo "" &&
  echo "4️⃣ Semver compatibility..." &&
  cargo semver-checks &&
  echo "" &&
  echo "5️⃣ Security audit..." &&
  cargo audit &&
  echo "" &&
  echo "6️⃣ Dependency check..." &&
  cargo deny check &&
  echo "" &&
  echo "7️⃣ Package check..." &&
  cargo package --allow-dirty &&
  echo "" &&
  echo "✅ Ready for release!"
}

# Release with version
crelease() {
  local version=${1:-patch}
  echo "🚀 Creating release: $version" &&
  cprelease &&
  cargo release "$version"
}

# ============================================================================
# BUILD BUNDLES
# ============================================================================

# Build all targets
cbuildall() {
  echo "🔨 Building all targets..." &&
  cargo build --all-targets --all-features &&
  cargo build --all-targets --all-features --release &&
  echo "✅ All builds complete!"
}

# Clean and rebuild
crebuild() {
  cargo clean &&
  cargo build --all-targets --all-features &&
  cargo test
}

# ============================================================================
# FIX EVERYTHING
# ============================================================================

# Auto-fix all issues
cfixall() {
  echo "🔧 Auto-fixing all issues..." &&
  echo "1️⃣ Format..." &&
  cargo fmt &&
  echo "2️⃣ Clippy fixes..." &&
  cargo clippy --fix --allow-dirty --allow-staged &&
  echo "3️⃣ Dependency fixes..." &&
  cargo machete --fix 2>/dev/null || true &&
  echo "4️⃣ Audit fixes..." &&
  cargo audit fix 2>/dev/null || true &&
  echo "✅ All fixes applied!"
}

# Fix and verify
cfixverify() {
  cfixall &&
  cargo check &&
  cargo test
}

# ============================================================================
# MAINTENANCE
# ============================================================================

# Weekly maintenance
cmaintenance() {
  echo "🧹 Weekly Maintenance" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "1️⃣ Update Rust..." &&
  rustup update &&
  echo "" &&
  echo "2️⃣ Update cargo tools..." &&
  cargo install-update -a &&
  echo "" &&
  echo "3️⃣ Update dependencies..." &&
  cargo update &&
  echo "" &&
  echo "4️⃣ Clean old artifacts..." &&
  cargo clean &&
  echo "" &&
  echo "5️⃣ Rebuild project..." &&
  cargo build &&
  echo "" &&
  echo "6️⃣ Run tests..." &&
  cargo test &&
  echo "" &&
  echo "7️⃣ Security audit..." &&
  cargo audit &&
  echo "" &&
  echo "✅ Maintenance complete!"
}

# Quick maintenance
cmaintenancequick() {
  rustup update &&
  cargo update &&
  cargo test &&
  cargo audit
}

# ============================================================================
# POWER USER BUNDLES
# ============================================================================

# Complete quality gate
cquality() {
  echo "💎 Complete Quality Gate" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "▸ Format..." &&
  cargo fmt -- --check &&
  echo "▸ Clippy (strict)..." &&
  cargo clippy --all-targets --all-features -- -D warnings -W clippy::pedantic &&
  echo "▸ Tests..." &&
  (cargo nextest run --all-features 2>/dev/null || cargo test --all-features) &&
  echo "▸ Doc tests..." &&
  cargo test --doc &&
  echo "▸ Documentation..." &&
  cargo doc --no-deps &&
  echo "▸ Security audit..." &&
  cargo audit &&
  echo "▸ Unsafe detection..." &&
  cargo geiger &&
  echo "▸ Dependency check..." &&
  cargo deny check &&
  echo "▸ Unused deps..." &&
  cargo machete &&
  echo "▸ Semver check..." &&
  cargo semver-checks &&
  echo "▸ Binary size..." &&
  cargo bloat --release &&
  echo "" &&
  echo "✅ All quality checks passed!"
}

# Everything you need before pushing
cbeforepush() {
  cargo fmt &&
  cargo clippy --fix --allow-dirty --allow-staged &&
  cargo test &&
  cargo doc --no-deps &&
  echo "✅ Safe to push!"
}

# Nuclear option: fix everything
cnuclear() {
  cargo clean &&
  cargo fmt &&
  cargo clippy --fix --allow-dirty --allow-staged --all-targets --all-features &&
  cargo update &&
  cargo test --all-features &&
  echo "💥 Nuclear fixes complete!"
}

# ============================================================================
# WATCH WORKFLOWS
# ============================================================================

# Watch and run full dev cycle
cwatchdev() {
  if command -v watchexec &> /dev/null; then
    watchexec -c -e rs,toml 'cargo check && cargo test'
  else
    echo "Install watchexec: cargo install watchexec-cli"
  fi
}

# Watch with quality checks
cwatchquality() {
  if command -v watchexec &> /dev/null; then
    watchexec -c -e rs,toml 'cargo fmt && cargo clippy && cargo test'
  else
    echo "Install watchexec: cargo install watchexec-cli"
  fi
}

# Watch and run
cwatchrun() {
  if command -v watchexec &> /dev/null; then
    watchexec -c -e rs,toml 'cargo run'
  else
    echo "Install watchexec: cargo install watchexec-cli"
  fi
}

# ============================================================================
# PROJECT HEALTH
# ============================================================================

# Show project health metrics
chealth() {
  echo "🏥 Project Health Dashboard" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  echo "" &&
  echo "📊 Lines of Code:" &&
  (find src -name "*.rs" -type f -exec wc -l {} + 2>/dev/null | tail -1 || echo "N/A") &&
  echo "" &&
  echo "📦 Dependencies:" &&
  (cargo tree --depth 1 2>/dev/null | head -20 || echo "N/A") &&
  echo "" &&
  echo "🔒 Unsafe Code:" &&
  (cargo geiger --compact 2>/dev/null || echo "cargo-geiger not installed") &&
  echo "" &&
  echo "⚠️ Outdated Packages:" &&
  (cargo outdated --root-deps-only 2>/dev/null || echo "cargo-outdated not installed") &&
  echo "" &&
  echo "🐛 TODO/FIXME:" &&
  (rg -c "TODO|FIXME" src/ 2>/dev/null || echo "None found") &&
  echo ""
}

# ============================================================================
# NEW PROJECT SETUP
# ============================================================================

# Setup new CLI project
cnewpro() {
  local name=$1
  if [ -z "$name" ]; then
    echo "Usage: cnewpro <project-name>"
    return 1
  fi

  cargo new "$name" &&
  cd "$name" &&
  cargo add clap --features derive &&
  cargo add anyhow &&
  cargo add thiserror &&
  cargo add serde --features derive &&
  cargo add serde_json &&
  cargo add --dev pretty_assertions &&
  cargo add --dev criterion &&
  cargo deny init 2>/dev/null || true &&
  echo "✅ Project $name created with best practices!"
}

# Setup library project
cnewlib() {
  local name=$1
  if [ -z "$name" ]; then
    echo "Usage: cnewlib <library-name>"
    return 1
  fi

  cargo new --lib "$name" &&
  cd "$name" &&
  cargo add serde --features derive &&
  cargo add --dev pretty_assertions &&
  cargo add --dev criterion &&
  cargo deny init 2>/dev/null || true &&
  echo "✅ Library $name created!"
}

# ============================================================================
# CONTEXT-SPECIFIC BUNDLES
# ============================================================================

# Before standup/demo
cstandup() {
  echo "🎤 Standup Check" &&
  cargo build --release &&
  cargo test &&
  echo "✅ Ready for standup!"
}

# Complete PR prep
cpr() {
  echo "🔍 PR Preparation" &&
  cargo fmt &&
  cargo clippy --all-targets --all-features -- -D warnings &&
  (cargo nextest run --all-features 2>/dev/null || cargo test --all-features) &&
  cargo doc --no-deps &&
  cargo semver-checks 2>/dev/null || true &&
  git status &&
  echo "✅ Ready for PR!"
}

# Production-ready build
cproduction() {
  echo "🏭 Production Build" &&
  cargo test --all-features &&
  cargo audit &&
  cargo build --release &&
  cargo bloat --release &&
  echo "✅ Production build ready!"
}

# ============================================================================
# GIT INTEGRATION
# ============================================================================

# Commit with quality checks
cgitcommit() {
  if [ -z "$1" ]; then
    echo "Usage: cgitcommit <commit-message>"
    return 1
  fi
  cpre &&
  git add . &&
  git commit -m "$1"
}

# Push with CI checks
cgitpush() {
  cci &&
  git push
}

# ============================================================================
# HELP
# ============================================================================

# Show all bundle aliases
cbundles() {
  echo "🦀 Rust Workflow Bundles"
  echo ""
  echo "Essential:"
  echo "  cdev          - Format, clippy, test, build"
  echo "  cpre          - Pre-commit checks"
  echo "  cci           - Simulate CI pipeline"
  echo ""
  echo "Quality:"
  echo "  cquality      - Complete quality gate"
  echo "  cstrict       - Strict quality checks"
  echo ""
  echo "Security:"
  echo "  csecaudit     - Full security audit"
  echo "  csecquick     - Quick security check"
  echo ""
  echo "Dependencies:"
  echo "  cdephealth    - Dependency health check"
  echo "  cdepfix       - Fix dependency issues"
  echo ""
  echo "Testing:"
  echo "  ctestall      - Run all test types"
  echo "  ctestcov      - Test with coverage"
  echo ""
  echo "Performance:"
  echo "  cperfcheck    - Performance analysis"
  echo "  cbuildopt     - Optimized build"
  echo ""
  echo "Release:"
  echo "  cprelease     - Pre-release checklist"
  echo "  crelease      - Create release"
  echo ""
  echo "Maintenance:"
  echo "  cmaintenance  - Weekly maintenance"
  echo "  chealth       - Project health dashboard"
  echo ""
  echo "Fix:"
  echo "  cfixall       - Auto-fix everything"
  echo "  cnuclear      - Nuclear fix option"
  echo ""
  echo "Git:"
  echo "  cgitcommit    - Commit with checks"
  echo "  cgitpush      - Push with CI"
  echo ""
  echo "New Projects:"
  echo "  cnewpro       - New CLI project"
  echo "  cnewlib       - New library project"
  echo ""
  echo "Type 'cbundles' to see this list anytime"
}

echo "✅ Rust workflow bundles loaded! Type 'cbundles' for help"
