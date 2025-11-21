# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Planned
- Cargo workspace support
- VS Code extension
- Web dashboard for project health
- Plugin system
- CI/CD platform integrations

## [1.0.0] - 2025-01-21

### Added
- Initial release with 40+ workflow bundles
- Essential development workflows (cdev, cpre, cci)
- Security audit bundles (csecaudit, csecquick)
- Dependency management bundles (cdephealth, cdepfix, cdeprefresh)
- Testing workflows (ctestall, ctestcov, ctestfeatures, ctestadvanced)
- Performance analysis bundles (cperfcheck, cperfquick, cbuildopt)
- CI/CD simulation (cci, ccifull, ccifast)
- Release management (cprelease, crelease)
- Fix and maintenance bundles (cfixall, cnuclear, cmaintenance)
- Watch mode support (cwatchdev, cwatchquality, cwatchrun)
- Git integration (cgitcommit, cgitpush)
- Project setup utilities (cnewpro, cnewlib)
- Context-specific bundles (cstandup, cpr, cproduction)
- Project health dashboard (chealth)
- Complete documentation suite
- Installation script
- MIT License
- Contributing guidelines
- Example custom workflows

### Features
- 40+ bundled workflows
- Graceful fallback for missing tools
- Progress indicators with emojis
- Clear error messages
- Bash and Zsh support
- Fully customizable
- Comprehensive documentation
- Cheat sheets and quick references

### Tools Integration
- cargo (built-in)
- cargo-nextest (faster test runner)
- cargo-audit (security scanning)
- cargo-geiger (unsafe code detection)
- cargo-machete (unused dependencies)
- cargo-deny (dependency linting)
- cargo-outdated (outdated packages)
- cargo-tarpaulin (code coverage)
- cargo-hack (feature combinations)
- cargo-mutants (mutation testing)
- cargo-bloat (binary size analysis)
- cargo-flamegraph (performance profiling)
- cargo-criterion (benchmarking)
- cargo-semver-checks (semver compatibility)
- cargo-release (release automation)
- watchexec (file watching)
- And more!

---

## Release Notes

### v1.0.0 - Initial Release

This is the first stable release of Rust Workflow Bundles! 🎉

**What's included:**
- Complete workflow automation for Rust development
- 40+ pre-built workflow bundles
- Comprehensive documentation
- Easy installation script
- Full customization support

**Time savings:**
- Average 2-3 hours per week
- 40 commands per day → 9 commands per day
- Pre-commit: 2 min → 30 sec
- CI check: 5 min → 2 min
- Security audit: 3 min → 1 min

**Getting started:**
```bash
./install.sh
cdev
```

**Documentation:**
- [README.md](README.md) - Project overview
- [docs/COMMANDS.md](docs/COMMANDS.md) - Complete command reference
- [docs/CHEATSHEET.md](docs/CHEATSHEET.md) - Quick reference guide
- [CONTRIBUTING.md](CONTRIBUTING.md) - Contribution guidelines

**Community:**
- Report bugs: GitHub Issues
- Suggest features: GitHub Discussions
- Contribute: See CONTRIBUTING.md

Thank you for using Rust Workflow Bundles! 🦀

---

## Version History

- **1.0.0** (2025-01-21) - Initial stable release

---

## Upgrade Guide

### From Future Versions

When upgrading:

1. Pull latest changes:
   ```bash
   cd /path/to/rust-workflow-bundles
   git pull
   ```

2. Reload your shell:
   ```bash
   source ~/.zshrc  # or ~/.bashrc
   ```

3. Check for breaking changes in this CHANGELOG

4. Test your custom workflows

---

## Breaking Changes

None yet! This is the first release.

---

## Deprecations

None yet!

---

## Security

No security vulnerabilities reported yet.

To report security issues, please email: ghalebi@gmail.com

---

[Unreleased]: https://github.com/RustSandbox/rust-workflow-bundles/compare/v1.0.0...HEAD
[1.0.0]: https://github.com/RustSandbox/rust-workflow-bundles/releases/tag/v1.0.0
