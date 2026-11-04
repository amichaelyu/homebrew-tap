# amichaelyu/tap

Homebrew tap for my apps and forks.

```
brew trust amichaelyu/tap   # Homebrew won't load third-party tap formulae until trusted
brew install amichaelyu/tap/syntax-highlight-plus
brew install --cask amichaelyu/tap/ice
brew install amichaelyu/tap/compress-screen-recordings
brew install --cask amichaelyu/tap/skim
brew install amichaelyu/tap/server-autoreconnect
```

**syntax-highlight-plus** — [Syntax Highlight](https://github.com/amichaelyu/SourceCodeSyntaxHighlight) fork with Markdown and LaTeX previews. Apple Silicon, notarized.

**ice** — [Ice](https://github.com/amichaelyu/Ice) fork rebuilt for macOS 27 (also runs on macOS 14 and later). Universal, notarized.

**compress-screen-recordings** — [Watches the Desktop](https://github.com/amichaelyu/compress-screen-recordings) and re-encodes macOS screen recordings with ffmpeg, usually 5-10x smaller. Run `compress-screen-recordings install-agent` after installing.

**skim** — [Skim](https://github.com/amichaelyu/skim) fork whose reloads of a changed PDF don't flash, for live LaTeX previews. Notarized. Install it in place of `homebrew/cask/skim` (`brew uninstall --cask skim` first).

**server-autoreconnect** — [Remounts network shares](https://github.com/amichaelyu/server-autoreconnect) whenever their server is reachable, so Finder sidebar favorites come back on their own. List shares in `~/.config/server-autoreconnect/shares`, then `brew services start server-autoreconnect`.
