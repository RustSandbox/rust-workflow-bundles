# Complete Command Reference

This document provides a comprehensive reference for all workflow bundles in Rust Workflow Bundles.

## Table of Contents

- [Development Workflows](#development-workflows)
- [Quality Gates](#quality-gates)
- [Security & Auditing](#security--auditing)
- [Dependency Management](#dependency-management)
- [Testing Workflows](#testing-workflows)
- [Performance Analysis](#performance-analysis)
- [CI/CD Simulation](#cicd-simulation)
- [Release Management](#release-management)
- [Build Workflows](#build-workflows)
- [Fix & Repair](#fix--repair)
- [Maintenance](#maintenance)
- [Watch Mode](#watch-mode)
- [Project Setup](#project-setup)
- [Context-Specific](#context-specific)
- [Git Integration](#git-integration)
- [Utilities](#utilities)

---

## Development Workflows

### `cdev`
**Complete development cycle**

Runs: Format → Clippy → Test → Build

```bash
cdev
```

**Use when:** Active development, before committing

**Time:** ~45 seconds

**What it runs:**
```bash
cargo fmt
cargo clippy -- -D warnings
cargo test
cargo build
```

---

### `cdevfast`
**Quick development check**

Runs: Check → Test

```bash
cdevfast
```

**Use when:** Quick feedback during development

**Time:** ~15 seconds

**What it runs:**
```bash
cargo check
cargo test
```

---

### `cdevquick`
**Fastest syntax check**

Runs: Check only

```bash
cdevquick
```

**Use when:** Just want to check if code compiles

**Time:** ~5 seconds

**What it runs:**
```bash
cargo check
```

---

### `cdevx`
**Development cycle with nextest**

Like `cdev` but uses cargo-nextest (faster)

```bash
cdevx
```

**Requires:** `cargo-nextest`

---

## Quality Gates

### `cpre`
**Pre-commit checks**

Essential checks before committing code.

```bash
cpre
```

**Use when:** Before every commit

**Time:** ~30 seconds

**What it runs:**
```bash
cargo fmt -- --check
cargo clippy -- -D warnings
cargo test
```

---

### `cstrict`
**Strict quality checks**

More stringent quality checks with all features.

```bash
cstrict
```

**Use when:** Before PR, weekly quality check

**Time:** ~2 minutes

**What it runs:**
```bash
cargo fmt -- --check
cargo clippy --all-targets --all-features -- -D warnings -W clippy::pedantic
cargo test --all-features
cargo doc --no-deps
```

---

### `cquality`
**Complete quality gate**

Runs 10+ quality checks. The most comprehensive check.

```bash
cquality
```

**Use when:** Before releases, important PRs

**Time:** ~5 minutes

**What it runs:**
- Format check
- Clippy (strict)
- All tests
- Doc tests
- Documentation build
- Security audit
- Unsafe detection
- Dependency check
- Unused dependencies
- Semver check
- Binary size analysis

---

## Security & Auditing

### `csecaudit`
**Complete security audit**

Full security audit with multiple tools.

```bash
csecaudit
```

**Use when:** Weekly, after adding dependencies, before releases

**Time:** ~1 minute

**What it runs:**
```bash
cargo audit                    # Security vulnerabilities
cargo geiger                   # Unsafe code detection
cargo deny check advisories    # Security advisories
cargo deny check licenses      # License compliance
```

**Requires:** `cargo-audit`, `cargo-geiger`, `cargo-deny`

---

### `csecquick`
**Quick security check**

Fast security check with audit and geiger.

```bash
csecquick
```

**Use when:** Quick security verification

**Time:** ~30 seconds

**What it runs:**
```bash
cargo audit
cargo geiger
```

---

## Dependency Management

### `cdephealth`
**Complete dependency health check**

Comprehensive dependency analysis.

```bash
cdephealth
```

**Use when:** Weekly, when build times increase, before releases

**Time:** ~45 seconds

**What it runs:**
```bash
cargo machete              # Unused dependencies
cargo outdated             # Outdated packages
cargo audit                # Security vulnerabilities
cargo tree --duplicates    # Duplicate dependencies
```

**Requires:** `cargo-machete`, `cargo-outdated`, `cargo-audit`

---

### `cdepfix`
**Auto-fix dependency issues**

Automatically fix common dependency problems.

```bash
cdepfix
```

**Use when:** After dependency check finds issues

**Time:** ~1 minute

**What it runs:**
```bash
cargo machete --fix
cargo update
cargo audit fix
```

---

### `cdeprefresh`
**Clean and update dependencies**

Complete dependency refresh.

```bash
cdeprefresh
```

**Use when:** Starting fresh, troubleshooting build issues

**Time:** ~2 minutes

**What it runs:**
```bash
cargo clean
cargo update
cargo check
```

---

## Testing Workflows

### `ctestall`
**Run all test types**

Comprehensive test execution across all targets.

```bash
ctestall
```

**Use when:** Before releases, weekly full test

**Time:** ~2 minutes

**What it runs:**
```bash
cargo test --lib
cargo test --bins
cargo test --tests
cargo test --doc
cargo test --examples
```

---

### `ctestcov`
**Tests with coverage report**

Generate HTML coverage report.

```bash
ctestcov
```

**Use when:** Checking code coverage

**Time:** ~3 minutes

**What it runs:**
```bash
cargo nextest run
cargo tarpaulin --out Html --output-dir coverage
open coverage/index.html  # Opens report
```

**Requires:** `cargo-nextest`, `cargo-tarpaulin`

---

### `ctestfeatures`
**Test all feature combinations**

Test with different feature flags.

```bash
ctestfeatures
```

**Use when:** Library development, before releases

**Time:** ~5 minutes (depends on features)

**What it runs:**
```bash
cargo hack test --feature-powerset --depth 2
```

**Requires:** `cargo-hack`

---

### `ctestadvanced`
**Advanced testing suite**

Advanced testing with mutation testing.

```bash
ctestadvanced
```

**Use when:** Important releases, high-quality libraries

**Time:** ~10+ minutes

**What it runs:**
```bash
cargo nextest run
cargo hack test --each-feature
cargo mutants --test-tool nextest
```

**Requires:** `cargo-nextest`, `cargo-hack`, `cargo-mutants`

---

## Performance Analysis

### `cperfcheck`
**Full performance analysis**

Complete performance profiling.

```bash
cperfcheck
```

**Use when:** Performance optimization, before releases

**Time:** ~5 minutes

**What it runs:**
```bash
cargo criterion             # Benchmarks
cargo flamegraph            # Profiling
cargo bloat --release       # Binary size
```

**Requires:** `cargo-criterion`, `cargo-flamegraph`, `cargo-bloat`

---

### `cperfquick`
**Quick performance check**

Fast performance verification.

```bash
cperfquick
```

**Use when:** Quick perf check during optimization

**Time:** ~2 minutes

**What it runs:**
```bash
cargo build --release
cargo bloat --release
cargo criterion
```

---

### `cbuildopt`
**Optimized build with analysis**

Release build with size analysis.

```bash
cbuildopt
```

**Use when:** Checking release binary

**Time:** ~1 minute

**What it runs:**
```bash
cargo build --release
cargo bloat --release --crates
ls -lh target/release/
```

---

## CI/CD Simulation

### `cci`
**Simulate CI pipeline**

Simulate GitHub Actions CI locally.

```bash
cci
```

**Use when:** Before pushing, before creating PR

**Time:** ~2 minutes

**What it runs:**
```bash
cargo fmt -- --check
cargo clippy --all-targets --all-features -- -D warnings
cargo nextest run --all-features  # or cargo test
cargo doc --no-deps --all-features
cargo build --all-features
```

---

### `ccifull`
**Full CI with security**

Complete CI including security checks.

```bash
ccifull
```

**Use when:** Before important pushes, weekly

**Time:** ~5 minutes

**What it runs:**
- All `cci` checks
- Security audit
- Dependency check
- Unsafe detection
- Semver check

---

### `ccifast`
**Quick CI feedback**

Fast CI verification.

```bash
ccifast
```

**Use when:** Quick PR checks

**Time:** ~1 minute

**What it runs:**
```bash
cargo fmt -- --check
cargo clippy -- -D warnings
cargo nextest run  # or cargo test
```

---

## Release Management

### `cprelease`
**Pre-release checklist**

Complete pre-release verification (7 steps).

```bash
cprelease
```

**Use when:** Before every release

**Time:** ~5 minutes

**What it runs:**
1. Format & Clippy
2. All tests
3. Documentation
4. Semver compatibility
5. Security audit
6. Dependency check
7. Package check

---

### `crelease`
**Create release**

Create and publish release.

```bash
crelease patch   # 1.0.0 -> 1.0.1
crelease minor   # 1.0.0 -> 1.1.0
crelease major   # 1.0.0 -> 2.0.0
```

**Use when:** Publishing new version

**Requires:** `cargo-release`

---

## Build Workflows

### `cbuildall`
**Build all targets**

Build everything in dev and release.

```bash
cbuildall
```

**Use when:** Full project build

**Time:** ~5 minutes

---

### `crebuild`
**Clean and rebuild**

Fresh build from scratch.

```bash
crebuild
```

**Use when:** Troubleshooting build issues

**Time:** ~3 minutes

---

## Fix & Repair

### `cfixall`
**Auto-fix everything**

Automatically fix common issues.

```bash
cfixall
```

**Use when:** Quick cleanup, after merging

**Time:** ~1 minute

**What it runs:**
```bash
cargo fmt
cargo clippy --fix --allow-dirty --allow-staged
cargo machete --fix
cargo audit fix
```

---

### `cfixverify`
**Fix and verify**

Fix issues and verify they're resolved.

```bash
cfixverify
```

**What it runs:**
```bash
cfixall
cargo check
cargo test
```

---

### `cnuclear`
**Nuclear option**

Fix absolutely everything (destructive).

```bash
cnuclear
```

**Use when:** Everything is broken

**Warning:** This is destructive - commits changes

**What it runs:**
```bash
cargo clean
cargo fmt
cargo clippy --fix --allow-dirty --allow-staged --all-targets --all-features
cargo update
cargo test --all-features
```

---

## Maintenance

### `cmaintenance`
**Full weekly maintenance**

Complete maintenance routine.

```bash
cmaintenance
```

**Use when:** Every Friday, monthly deep clean

**Time:** ~5-10 minutes

**What it runs:**
```bash
rustup update
cargo install-update -a
cargo update
cargo clean
cargo build
cargo test
cargo audit
```

---

### `chealth`
**Project health dashboard**

Show project health metrics.

```bash
chealth
```

**Use when:** Daily check-in, weekly review

**Shows:**
- Lines of code
- Dependency tree
- Unsafe code usage
- Outdated packages
- TODO/FIXME count

---

## Watch Mode

### `cwatchdev`
**Watch and run dev cycle**

Auto-run check + test on file changes.

```bash
cwatchdev
```

**Use when:** Active development

**Requires:** `watchexec`

---

### `cwatchquality`
**Watch with quality checks**

Auto-run format + clippy + test.

```bash
cwatchquality
```

**Use when:** Maintaining code quality while developing

**Requires:** `watchexec`

---

### `cwatchrun`
**Watch and run**

Auto-run cargo run on changes.

```bash
cwatchrun
```

**Use when:** Developing binary/application

**Requires:** `watchexec`

---

## Project Setup

### `cnewpro`
**New CLI project with best practices**

Create new project with common dependencies.

```bash
cnewpro myapp
```

**Creates project with:**
- clap (CLI parsing)
- anyhow (error handling)
- thiserror (error types)
- serde + serde_json
- pretty_assertions (dev)
- criterion (dev)

---

### `cnewlib`
**New library project**

Create new library project.

```bash
cnewlib mylib
```

---

## Context-Specific

### `cstandup`
**Before standup/demo**

Quick check before showing work.

```bash
cstandup
```

**What it runs:**
```bash
cargo build --release
cargo test
```

---

### `cpr`
**PR preparation**

Complete PR preparation.

```bash
cpr
```

**What it runs:**
```bash
cargo fmt
cargo clippy --all-targets --all-features -- -D warnings
cargo nextest run --all-features
cargo doc --no-deps
cargo semver-checks
git status
```

---

### `cproduction`
**Production-ready build**

Build for production with checks.

```bash
cproduction
```

**What it runs:**
```bash
cargo test --all-features
cargo audit
cargo build --release
cargo bloat --release
```

---

## Git Integration

### `cgitcommit`
**Commit with checks**

Run checks then commit.

```bash
cgitcommit "feat: add feature"
```

**What it runs:**
```bash
cpre
git add .
git commit -m "message"
```

---

### `cgitpush`
**Push with CI**

Run CI then push.

```bash
cgitpush
```

**What it runs:**
```bash
cci
git push
```

---

## Utilities

### `cbundles`
**Show all commands**

Display help for all available bundles.

```bash
cbundles
```

---

## Installation

### Required Tools

```bash
# Rust toolchain
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

### Recommended Tools

```bash
# Install binstall first (faster)
cargo install cargo-binstall

# Essential tools
cargo binstall -y cargo-nextest cargo-audit cargo-geiger \
  cargo-machete cargo-deny cargo-outdated watchexec-cli

# Quality & Testing
cargo binstall -y cargo-tarpaulin cargo-hack cargo-mutants

# Performance
cargo binstall -y cargo-bloat cargo-flamegraph cargo-criterion

# Release
cargo binstall -y cargo-semver-checks cargo-release
```

---

## Examples

### Daily Development
```bash
chealth
cwatchdev
# ... code ...
cpre
git commit -m "feat: add feature"
cci
git push
```

### Weekly Routine
```bash
cmaintenance
cdephealth
csecaudit
```

### Before Release
```bash
cprelease
crelease patch
cargo publish
```

### Emergency Fix
```bash
cnuclear
cpre
git commit -m "fix: critical bug"
cgitpush
```

---

## Tips

1. **Start simple:** Use `cdev`, `cpre`, `cci` first
2. **Use watch mode:** `cwatchdev` during development
3. **Auto-fix first:** Run `cfixall` when things break
4. **Regular maintenance:** `cmaintenance` every Friday
5. **Before releases:** Always run `cprelease`

---

## Troubleshooting

**Command not found?**
```bash
source ~/path/to/rust-bundles.sh
```

**Tool missing?**
- Bundles will fallback gracefully
- Install with: `cargo install <tool>`

**Too slow?**
- Use faster variants: `cdevfast`, `ccifast`
- Enable incremental builds

---

**For more information, see the main [README](../README.md)**
