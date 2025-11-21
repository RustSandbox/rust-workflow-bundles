# Rust Workflow Bundles - Cheat Sheet

> Stop typing the same cargo commands. Use workflow bundles instead.

---

## Install (30s)

```bash
source ~/path/to/rust-bundles.sh
echo "source ~/path/to/rust-bundles.sh" >> ~/.zshrc
source ~/.zshrc
```

---

## The Big 5

```bash
cdev           # Format + Clippy + Test + Build
cpre           # Pre-commit checks
cci            # Full CI simulation
cfixall        # Auto-fix everything
chealth        # Project health dashboard
```

---

## Daily Workflow

```bash
# Morning
chealth

# While coding
cwatchdev      # Auto-run tests on save

# Before commit
cpre

# Before push
cci

# Friday
cmaintenance
```

---

## All Commands

### Development
```bash
cdev           # Full dev cycle
cdevfast       # Check + test only
cdevquick      # Check only
cwatchdev      # Watch mode
```

### Quality
```bash
cpre           # Pre-commit
cstrict        # Strict checks
cquality       # Everything (10+ checks)
```

### Security
```bash
csecaudit      # Full audit
csecquick      # Quick audit
```

### Dependencies
```bash
cdephealth     # Full dep check
cdepfix        # Auto-fix deps
cdeprefresh    # Clean + update
```

### Testing
```bash
ctestall       # All test types
ctestcov       # With coverage
ctestfeatures  # All features
```

### Performance
```bash
cperfcheck     # Full analysis
cperfquick     # Quick check
cbuildopt      # Optimized build
```

### CI/CD
```bash
cci            # CI simulation
ccifull        # CI + security
ccifast        # Quick CI
```

### Release
```bash
cprelease      # Pre-release check
crelease patch # Patch release
crelease minor # Minor release
```

### Fix
```bash
cfixall        # Fix everything
cfixverify     # Fix + verify
cnuclear       # Nuclear option
```

### Maintenance
```bash
cmaintenance   # Full maintenance
chealth        # Health check
```

### Git
```bash
cgitcommit "msg"  # Commit with checks
cgitpush          # Push with CI
```

### New Project
```bash
cnewpro myapp  # New CLI project
cnewlib mylib  # New library
```

### Context
```bash
cstandup       # Before standup
cpr            # Before PR
cproduction    # Production build
```

---

## What They Do

**cdev**
```
→ cargo fmt
→ cargo clippy -- -D warnings
→ cargo test
→ cargo build
```

**cci**
```
→ cargo fmt -- --check
→ cargo clippy --all-targets --all-features
→ cargo nextest run --all-features
→ cargo doc --no-deps
→ cargo build --all-features
```

**csecaudit**
```
→ cargo audit
→ cargo geiger
→ cargo deny check advisories
→ cargo deny check licenses
```

**cdephealth**
```
→ cargo machete
→ cargo outdated
→ cargo audit
→ cargo tree --duplicates
```

**cfixall**
```
→ cargo fmt
→ cargo clippy --fix
→ cargo machete --fix
→ cargo audit fix
```

**cmaintenance**
```
→ rustup update
→ cargo install-update -a
→ cargo update
→ cargo clean
→ cargo build
→ cargo test
→ cargo audit
```

---

## Install Tools

```bash
# Binstall first (faster)
cargo install cargo-binstall

# Essential
cargo binstall -y \
  cargo-nextest \
  cargo-audit \
  cargo-geiger \
  cargo-machete \
  cargo-deny \
  cargo-outdated \
  watchexec-cli

# Quality
cargo binstall -y \
  cargo-tarpaulin \
  cargo-hack \
  cargo-mutants

# Performance
cargo binstall -y \
  cargo-bloat \
  cargo-flamegraph \
  cargo-criterion

# Release
cargo binstall -y \
  cargo-semver-checks \
  cargo-release
```

---

## Common Workflows

**Before Commit**
```bash
cfixall && cpre
```

**Before Push**
```bash
cci
```

**Before PR**
```bash
cfixall && cpr
```

**Before Release**
```bash
cprelease && crelease patch
```

**Emergency Fix**
```bash
cnuclear && cpre
```

**Weekly Maintenance**
```bash
cmaintenance
```

**New Project**
```bash
cnewpro myapp && cd myapp && cdev
```

---

## Time Saved

| Command | Manual | Bundle | Saved |
|---------|--------|--------|-------|
| Pre-commit | 2 min | 30s | 1.5 min |
| CI check | 5 min | 2 min | 3 min |
| Security | 3 min | 1 min | 2 min |
| Quality gate | 15 min | 5 min | 10 min |

**Per day:** 15-30 minutes
**Per week:** 2-3 hours

---

## Customize

Add to `~/.zshrc`:

```bash
# Custom workflow
cmyflow() {
  cargo fmt &&
  cargo clippy -- -D warnings &&
  cargo test &&
  echo "✅ Done!"
}

# Database reset
cdbr() {
  cargo run --bin migrate reset &&
  cargo run --bin migrate up
}

# Deploy
cdeploy() {
  cci &&
  cargo build --release &&
  scp target/release/app server:/opt/
}
```

---

## Troubleshooting

**Command not found?**
```bash
source ~/path/to/rust-bundles.sh
```

**Tool missing?**
```bash
cargo install cargo-nextest
# Or bundles fallback automatically
```

**Too slow?**
```bash
cdevfast    # Instead of cdev
ccifast     # Instead of cci
```

---

## Help

```bash
cbundles    # Show all commands
```

---

## Examples

### Example 1: Morning Routine
```bash
cd ~/project
chealth
cwatchdev
```

### Example 2: Commit & Push
```bash
cpre
git commit -m "feat: new feature"
cci
git push
```

### Example 3: Friday Afternoon
```bash
cmaintenance
chealth
git push
```

### Example 4: Before Demo
```bash
cstandup
cargo run --release
```

### Example 5: New Feature
```bash
# Develop
cwatchdev

# Before commit
cpre

# Before push
cci

# After PR approved
git pull
cargo build --release
```

---

## Quick Reference

```
Development:     cdev, cwatchdev
Before Commit:   cpre, cfixall
Before Push:     cci
Security:        csecaudit
Dependencies:    cdephealth
Testing:         ctestall, ctestcov
Performance:     cperfcheck
Release:         cprelease, crelease
Maintenance:     cmaintenance, chealth
Emergency:       cnuclear
```

---

## One-Liners

```bash
# Fix and commit
cfixall && cpre && git commit -m "fix: issues"

# Full check
cquality

# Quick check
cdevfast

# Watch and develop
cwatchdev

# Weekly routine
cmaintenance && chealth

# Before release
cprelease && crelease patch

# Emergency
cnuclear && cci
```

---

## Tips

1. Start with: `cdev`, `cpre`, `cci`
2. Use watch mode: `cwatchdev`
3. Auto-fix first: `cfixall`
4. Check weekly: `cmaintenance`
5. Before release: `cprelease`

---

## Shortcuts

| Instead of | Use |
|------------|-----|
| `cargo fmt && cargo clippy && cargo test` | `cdev` |
| `cargo fmt -- --check && cargo clippy && cargo test` | `cpre` |
| Multiple CI commands | `cci` |
| Manual fixes | `cfixall` |
| Manual maintenance | `cmaintenance` |

---

## Most Used

```bash
cdev        # Every hour
cpre        # Before every commit
cci         # Before every push
cfixall     # When things break
cmaintenance # Every Friday
```

---

## Learning Path

**Day 1-7:** `cdev`, `cpre`, `cci`
**Day 8-14:** `cfixall`, `csecaudit`, `chealth`
**Day 15-21:** `cwatchdev`, `cdephealth`, `cmaintenance`
**Day 22+:** `cquality`, `cprelease`, custom bundles

---

## Pro Tips

- Use `cwatchdev` during development
- Run `cpre` before every commit
- Run `cci` before every push
- Run `cmaintenance` every Friday
- Create custom bundles for your workflow

---

## Bottom Line

**Instead of typing 40 commands per day, type 9.**

That's it. Install it. Use it. Save time.

```bash
source ~/path/to/rust-bundles.sh
cdev
```

---

*Version 1.0 • For Rust 1.70+ • MIT License*
