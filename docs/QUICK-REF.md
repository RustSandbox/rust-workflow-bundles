# Rust Bundles - One Page Cheat Sheet

## Install
```bash
source ~/path/to/rust-bundles.sh && echo "source ~/path/to/rust-bundles.sh" >> ~/.zshrc
```

## Essential 5
```bash
cdev        # Format + Clippy + Test + Build
cpre        # Pre-commit checks (format, lint, test)
cci         # Full CI simulation
cfixall     # Auto-fix everything
chealth     # Project health dashboard
```

## All Commands

| Category | Command | Purpose |
|----------|---------|---------|
| **Dev** | `cdev` | Full dev cycle |
| | `cdevfast` | Check + test |
| | `cwatchdev` | Auto-run tests |
| **Quality** | `cpre` | Pre-commit |
| | `cstrict` | Strict checks |
| | `cquality` | Everything |
| **Security** | `csecaudit` | Full audit |
| | `csecquick` | Quick audit |
| **Deps** | `cdephealth` | Check deps |
| | `cdepfix` | Fix deps |
| **Test** | `ctestall` | All tests |
| | `ctestcov` | With coverage |
| **Perf** | `cperfcheck` | Full analysis |
| | `cbuildopt` | Optimized |
| **CI** | `cci` | CI sim |
| | `ccifull` | CI + sec |
| **Release** | `cprelease` | Check |
| | `crelease patch` | Release |
| **Fix** | `cfixall` | Fix all |
| | `cnuclear` | Fix everything |
| **Maint** | `cmaintenance` | Weekly |
| **Git** | `cgitcommit "msg"` | Commit |
| | `cgitpush` | Push |
| **New** | `cnewpro name` | New project |

## Daily Workflow
```bash
chealth → cwatchdev → cpre → cci → cmaintenance (Friday)
```

## Common Patterns
```bash
cfixall && cpre              # Fix and check
cci                          # Before push
cprelease && crelease patch  # Release
cnuclear && cpre             # Emergency
cmaintenance                 # Weekly
```

## What They Run

**cdev:** `fmt → clippy → test → build`
**cci:** `fmt check → clippy (all) → test (all) → doc → build`
**csecaudit:** `audit → geiger → deny → licenses`
**cfixall:** `fmt → clippy --fix → machete --fix → audit fix`

## Install Tools
```bash
cargo install cargo-binstall
cargo binstall -y cargo-nextest cargo-audit cargo-geiger cargo-machete cargo-deny watchexec-cli
```

## Time Saved
Pre-commit: 2min → 30s | CI: 5min → 2min | Security: 3min → 1min | Weekly: 2-3 hours

## Customize
```bash
cmyflow() { cargo fmt && cargo test && echo "Done!"; }
```

## Help
```bash
cbundles    # Show all commands
```

---

**Pro Tip:** Start with `cdev`, `cpre`, `cci`. Add more as needed.

**Bottom Line:** 40 commands/day → 9 commands/day = 31 saved 🚀
