# Contributing to Rust Workflow Bundles

Thank you for your interest in contributing to Rust Workflow Bundles! 🦀

## 🎯 How to Contribute

There are many ways to contribute:
- 🐛 Report bugs
- 💡 Suggest new workflow bundles
- 📝 Improve documentation
- 🔧 Submit bug fixes
- ✨ Add new features
- 🎨 Improve examples

## 🚀 Getting Started

### 1. Fork and Clone

```bash
# Fork the repository on GitHub
# Then clone your fork
git clone https://github.com/YOUR-USERNAME/rust-workflow-bundles.git
cd rust-workflow-bundles
```

### 2. Create a Branch

```bash
git checkout -b feature/your-feature-name
# or
git checkout -b fix/your-bug-fix
```

### 3. Make Your Changes

- Add your workflow bundle to `rust-bundles.sh`
- Update documentation if needed
- Add examples if applicable
- Test thoroughly

### 4. Test Your Changes

```bash
# Source the script
source rust-bundles.sh

# Test your new bundle
your-new-command

# Verify existing bundles still work
cbundles
cdev
cpre
```

### 5. Commit Your Changes

```bash
git add .
git commit -m "feat: add awesome new bundle"
```

Use conventional commits:
- `feat:` - New feature
- `fix:` - Bug fix
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Test changes
- `chore:` - Maintenance tasks

### 6. Push and Create PR

```bash
git push origin feature/your-feature-name
```

Then create a Pull Request on GitHub.

## 📋 Guidelines

### Code Style

```bash
# Good: Clear function name, with comments
# Complete security audit
csecaudit() {
  echo "🔒 Security Audit" &&
  echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━" &&
  cargo audit &&
  cargo geiger &&
  echo "✅ Security audit complete!"
}

# Bad: Unclear name, no comments, no feedback
sa() {
  cargo audit
  cargo geiger
}
```

### Bundle Guidelines

1. **Naming Convention**
   - Use `c` prefix for cargo-related bundles
   - Keep names short but descriptive
   - Use lowercase
   - Examples: `cdev`, `cpre`, `csecaudit`

2. **Functionality**
   - Each bundle should have a clear purpose
   - Combine related commands
   - Provide progress feedback with `echo`
   - Handle errors gracefully
   - Use `&&` to stop on errors

3. **Documentation**
   - Add comment above function
   - Update `cbundles` help function
   - Add to README if it's a major bundle
   - Include examples

4. **Error Handling**
   - Check for required tools
   - Provide helpful error messages
   - Fallback to alternatives when possible

Example:

```bash
# My awesome workflow
cmyworkflow() {
  # Check if tool exists
  if ! command -v cargo-awesome &> /dev/null; then
    echo "⚠️ cargo-awesome not installed. Install with: cargo install cargo-awesome"
    return 1
  fi

  echo "🚀 Running my workflow..." &&
  cargo fmt &&
  cargo awesome &&
  cargo test &&
  echo "✅ Workflow complete!"
}
```

### Documentation Guidelines

- Use clear, concise language
- Include code examples
- Show expected output when helpful
- Add troubleshooting tips
- Keep formatting consistent

## 🐛 Reporting Bugs

### Before Reporting

1. Check if the issue already exists
2. Try the latest version
3. Test with a minimal example

### Bug Report Template

```markdown
**Description**
A clear description of the bug.

**To Reproduce**
Steps to reproduce:
1. Run command `...`
2. See error

**Expected Behavior**
What should happen.

**Actual Behavior**
What actually happens.

**Environment**
- OS: [e.g., macOS 13.0]
- Shell: [e.g., zsh 5.9]
- Rust version: [e.g., 1.75.0]
- Script version: [e.g., 1.0.0]

**Additional Context**
Any other relevant information.
```

## 💡 Suggesting Features

### Feature Request Template

```markdown
**Feature Description**
A clear description of the feature.

**Use Case**
Why this feature would be useful.

**Proposed Solution**
How you think it should work.

**Example**
Code example of how it would be used.

**Alternatives**
Other solutions you've considered.
```

## 🧪 Testing

### Manual Testing

```bash
# Source the script
source rust-bundles.sh

# Test your bundle
your-new-command

# Test in different scenarios
cd /path/to/rust/project
your-new-command

# Test error cases
# (e.g., missing tools, failing tests)
```

### Test Checklist

- [ ] Bundle works on clean Rust project
- [ ] Bundle works on existing project
- [ ] Error messages are clear
- [ ] Progress is shown
- [ ] Handles missing tools gracefully
- [ ] Works in both bash and zsh
- [ ] Documentation is updated
- [ ] Examples are provided

## 📝 Documentation

### What to Document

- **README.md** - Overview, installation, main features
- **docs/COMMANDS.md** - Complete command reference
- **docs/CHEATSHEET.md** - Quick reference
- **examples/** - Usage examples

### Documentation Style

- Use headers for organization
- Include code blocks with syntax highlighting
- Add emojis for visual appeal (but don't overdo it)
- Keep lines under 80 characters when possible
- Use tables for comparisons

## 🎨 Examples

### Good Example

```bash
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
  echo "✅ Dependency check complete!"
}
```

### Why It's Good

✅ Clear function name
✅ Descriptive comment
✅ Progress feedback
✅ Visual separators
✅ Numbered steps
✅ Success message
✅ Proper error handling with `&&`

## 🤝 Pull Request Process

1. **Create PR** with clear title and description
2. **Link related issues** if applicable
3. **Wait for review** from maintainers
4. **Address feedback** if requested
5. **Celebrate** when merged! 🎉

### PR Checklist

- [ ] Code follows style guidelines
- [ ] Documentation is updated
- [ ] Examples are added/updated
- [ ] Tested manually
- [ ] Commit messages follow convention
- [ ] PR description is clear

## 🌟 Recognition

Contributors will be:
- Listed in README.md
- Mentioned in release notes
- Given credit in documentation

## ❓ Questions?

- Open a [GitHub Discussion](https://github.com/RustSandbox/rust-workflow-bundles/discussions)
- Create an [Issue](https://github.com/RustSandbox/rust-workflow-bundles/issues)
- Reach out to maintainers

## 📜 Code of Conduct

### Our Pledge

We pledge to make participation in our project a harassment-free experience for everyone, regardless of age, body size, disability, ethnicity, gender identity, level of experience, nationality, personal appearance, race, religion, or sexual identity.

### Our Standards

**Positive behavior:**
- Using welcoming and inclusive language
- Being respectful of differing viewpoints
- Accepting constructive criticism gracefully
- Focusing on what's best for the community
- Showing empathy towards others

**Unacceptable behavior:**
- Trolling, insulting, or derogatory comments
- Personal or political attacks
- Public or private harassment
- Publishing others' private information
- Other conduct which could reasonably be considered inappropriate

### Enforcement

Instances of abusive, harassing, or otherwise unacceptable behavior may be reported to the project maintainers. All complaints will be reviewed and investigated.

## 🙏 Thank You!

Thank you for contributing to Rust Workflow Bundles! Your efforts help make Rust development more productive for everyone.

---

**Happy Contributing!** 🦀
