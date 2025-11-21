# 🦀 Rust Workflow Bundles

> **Stop typing the same cargo commands over and over. Use powerful workflow bundles instead.**

Bundle multiple cargo commands and extensions into single, easy-to-use aliases. Save 2-3 hours per week.

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Rust](https://img.shields.io/badge/rust-1.70%2B-orange.svg)](https://www.rust-lang.org/)
[![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh-blue.svg)](https://www.gnu.org/software/bash/)

---

## ✨ Features

- 🚀 **40+ bundled workflows** - One command runs multiple cargo operations
- ⚡ **Save 2-3 hours/week** - Stop typing repetitive commands
- 🔒 **Security-first** - Built-in security auditing bundles
- 🧪 **Testing workflows** - Complete test suites in one command
- 📦 **Dependency management** - Health checks and auto-fixes
- 🎯 **CI/CD simulation** - Test locally before pushing
- 🛠️ **Fully customizable** - Add your own workflow bundles
- 📚 **Well documented** - Comprehensive guides and examples

---

## 📦 Quick Start

### Installation (30 seconds)

```bash
# Clone the repository
git clone https://github.com/RustSandbox/rust-workflow-bundles.git
cd rust-workflow-bundles

# Run the install script
./install.sh

# Or manually source it
source rust-bundles.sh
echo "source $(pwd)/rust-bundles.sh" >> ~/.zshrc
```

### First Command

```bash
# Run a complete development cycle
cdev
```

That's it! 🎉

---

## 🚀 Usage

### The Essential Five

```bash
cdev        # Format + Clippy + Test + Build
cpre        # Pre-commit checks
cci         # Full CI simulation
cfixall     # Auto-fix everything
chealth     # Project health dashboard
```

### Daily Workflow

```bash
# Morning
chealth

# During development (auto-run tests on file changes)
cwatchdev

# Before committing
cpre

# Before pushing
cci

# Friday afternoon
cmaintenance
```

### Common Patterns

```bash
# Fix and commit
cfixall && cpre && git commit -m "fix: issues"

# Before pushing
cci

# Before creating PR
cfixall && cpr

# Before release
cprelease && crelease patch

# Emergency fix
cnuclear && cpre

# Weekly maintenance
cmaintenance
```

---

## 📚 Documentation

- **[Complete Command Reference](docs/COMMANDS.md)** - All 40+ commands explained
- **[Cheat Sheet](docs/CHEATSHEET.md)** - Quick reference guide
- **[Visual Cheat Sheet](docs/VISUAL-CHEATSHEET.md)** - ASCII art style guide
- **[Quick Reference](docs/QUICK-REF.md)** - One-page reference

---

## 🎯 Command Categories

### Development
- `cdev` - Complete development cycle
- `cdevfast` - Quick check + test
- `cwatchdev` - Watch mode (auto-run tests)

### Quality Gates
- `cpre` - Pre-commit checks
- `cstrict` - Strict quality checks
- `cquality` - Complete quality gate (10+ checks)

### Security
- `csecaudit` - Full security audit
- `csecquick` - Quick security check

### Dependencies
- `cdephealth` - Complete dependency check
- `cdepfix` - Auto-fix dependency issues
- `cdeprefresh` - Clean + update + rebuild

### Testing
- `ctestall` - Run all test types
- `ctestcov` - Tests with coverage report
- `ctestfeatures` - Test all feature combinations

### Performance
- `cperfcheck` - Full performance analysis
- `cperfquick` - Quick performance check
- `cbuildopt` - Optimized build with analysis

### CI/CD
- `cci` - Simulate CI pipeline
- `ccifull` - Full CI with security
- `ccifast` - Quick CI feedback

### Release
- `cprelease` - Pre-release checklist
- `crelease` - Create release (patch/minor/major)

### Fix & Maintenance
- `cfixall` - Auto-fix everything
- `cnuclear` - Nuclear option (fix ALL)
- `cmaintenance` - Full weekly maintenance
- `chealth` - Project health dashboard

[See full command list →](docs/COMMANDS.md)

---

## 🛠️ Requirements

### Required
- Rust toolchain (rustup, cargo)
- Bash or Zsh shell

### Recommended Tools

```bash
# Install cargo-binstall first (much faster)
cargo install cargo-binstall

# Essential tools
cargo binstall -y \
  cargo-nextest \
  cargo-audit \
  cargo-geiger \
  cargo-machete \
  cargo-deny \
  cargo-outdated \
  watchexec-cli
```

[Complete installation guide →](docs/COMMANDS.md#installation)

---

## 📊 Time Saved

| Workflow | Manual Time | Bundle Time | Saved |
|----------|-------------|-------------|-------|
| Pre-commit | 2 minutes | 30 seconds | 1.5 min |
| CI check | 5 minutes | 2 minutes | 3 min |
| Security audit | 3 minutes | 1 minute | 2 min |
| Quality gate | 15 minutes | 5 minutes | 10 min |

**Average savings: 2-3 hours per week** ⏰

---

## 🎨 Customization

Add your own workflow bundles:

```bash
# Add to ~/.zshrc after sourcing rust-bundles.sh

# Custom workflow
cmyflow() {
  echo "🔧 My Workflow" &&
  cargo fmt &&
  cargo clippy -- -D warnings &&
  cargo test &&
  echo "✅ Done!"
}

# Database reset workflow
cdbr() {
  cargo run --bin migrate reset &&
  cargo run --bin migrate up &&
  cargo run --bin seed
}
```

[More examples →](examples/custom-workflows.sh)

---

## 📖 Examples

### Example 1: Morning Development

```bash
cd ~/my-rust-project
chealth              # Check project status
cwatchdev            # Start watch mode
# Code away...
cpre                 # Before committing
git commit -m "feat: new feature"
```

### Example 2: Before Pushing

```bash
cfixall              # Auto-fix issues
cci                  # Run CI simulation
git push             # Push with confidence
```

### Example 3: Release Workflow

```bash
cprelease            # Run pre-release checks
crelease patch       # Create patch release
cargo publish        # Publish to crates.io
```

[More examples →](docs/COMMANDS.md#examples)

---

## 🤝 Contributing

Contributions are welcome! See [CONTRIBUTING.md](CONTRIBUTING.md) for details.

### Quick Contribution Guide

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-bundle`)
3. Add your workflow bundle to `rust-bundles.sh`
4. Update documentation
5. Test thoroughly
6. Commit your changes (`git commit -m 'Add amazing bundle'`)
7. Push to the branch (`git push origin feature/amazing-bundle`)
8. Open a Pull Request

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

### Inspiration

This project was inspired by:
- **[Useful Cargo Plugin Cheat Sheet](https://www.patreon.com/posts/useful-cargo-143899959)** by [timClicks](https://www.patreon.com/timClicks) - An excellent overview of cargo plugins that sparked the idea for bundled workflows

### Built With

Amazing Rust tooling that powers these workflows:
- [cargo](https://doc.rust-lang.org/cargo/) - Official Rust package manager
- [cargo-nextest](https://nexte.st/) - Next-generation test runner
- [cargo-audit](https://github.com/rustsec/rustsec) - Security vulnerability scanner
- [cargo-geiger](https://github.com/geiger-rs/cargo-geiger) - Unsafe code detector
- [cargo-deny](https://github.com/EmbarkStudios/cargo-deny) - Dependency linting
- [cargo-machete](https://github.com/bnjbvr/cargo-machete) - Unused dependency finder
- [watchexec](https://github.com/watchexec/watchexec) - File watcher
- And many more!

---

## ⭐ Show Your Support

If this project helped you, please consider:
- ⭐ Starring the repository
- 🐛 Reporting bugs
- 💡 Suggesting new workflow bundles
- 📝 Improving documentation
- 🔀 Submitting pull requests

---

## 📞 Support & Community

- 🐛 **Issues:** [GitHub Issues](https://github.com/RustSandbox/rust-workflow-bundles/issues)
- 💬 **Discussions:** [GitHub Discussions](https://github.com/RustSandbox/rust-workflow-bundles/discussions)
- 📧 **Email:** ghalebi@gmail.com

---

## 🗺️ Roadmap

- [ ] Add support for cargo workspaces
- [ ] Integration with popular CI/CD platforms
- [ ] Web dashboard for project health
- [ ] VS Code extension
- [ ] Plugin system for custom extensions
- [ ] Telemetry and analytics (opt-in)

---

## 📈 Project Stats

- **Commands:** 40+ bundled workflows
- **Time Saved:** 2-3 hours/week average
- **Rust Version:** 1.70+
- **Shell Support:** Bash 4+, Zsh 5+

---

## 🔗 Related Projects

- [cargo-make](https://github.com/sagiegurari/cargo-make) - Task runner
- [just](https://github.com/casey/just) - Command runner
- [cargo-watch](https://github.com/watchexec/cargo-watch) - File watcher for cargo

---

## 💡 FAQ

**Q: Do I need all the recommended tools?**
A: No! Bundles will gracefully fallback if tools are missing.

**Q: Can I use this with existing projects?**
A: Yes! Works with any Rust project immediately.

**Q: How do I update?**
A: Run `git pull` in the repository directory.

**Q: Can I customize the bundles?**
A: Absolutely! Add your own in `~/.zshrc` or modify `rust-bundles.sh`.

**Q: Does this work on Windows?**
A: Best on Linux/macOS. Windows users should use WSL2.

---

## 📜 Changelog

See [CHANGELOG.md](CHANGELOG.md) for release history.

---

<div align="center">

**Made with ❤️ for the Rust community**

[⬆ Back to top](#-rust-workflow-bundles)

</div>
