# amichaelyu/tap

Homebrew tap for my apps and forks.

```
brew trust amichaelyu/tap   # Homebrew won't load third-party tap formulae until trusted
brew install amichaelyu/tap/syntax-highlight-plus
brew install --cask amichaelyu/tap/ice
brew install amichaelyu/tap/compress-screen-recordings
brew install --cask amichaelyu/tap/skim
brew install amichaelyu/tap/smb-autoreconnect
brew install amichaelyu/tap/compute
```

**syntax-highlight-plus** — [Syntax Highlight](https://github.com/amichaelyu/SourceCodeSyntaxHighlight) fork with Markdown and LaTeX previews. Apple Silicon, notarized.

**ice** — [Ice](https://github.com/amichaelyu/Ice) fork rebuilt for macOS 27 (also runs on macOS 14 and later). Universal, notarized.

**compress-screen-recordings** — [Watches the Desktop](https://github.com/amichaelyu/launchAgents/tree/main/compress-screen-recordings) and re-encodes macOS screen recordings with ffmpeg, usually 5-10x smaller. Run `compress-screen-recordings install-agent` after installing.

**skim** — [Skim](https://github.com/amichaelyu/skim) fork whose reloads of a changed PDF don't flash, for live LaTeX previews. Notarized. Install it in place of `homebrew/cask/skim` (`brew uninstall --cask skim` first).

**smb-autoreconnect** — [Keeps network shares mounted](https://github.com/amichaelyu/launchAgents/tree/main/smb-autoreconnect) and in the Finder sidebar: remounts them whenever their server is reachable and re-adds missing sidebar favorites. Run `brew services start smb-autoreconnect`, then connect to each share once in Finder.

**compute** — [Agent-native job scheduler](https://github.com/amichaelyu/compute) that places jobs on Slurm clusters, CPU machines and paid GPU clouds, with a web dashboard and a skill file for agents. Builds the `computed` daemon from source; configure `~/.config/compute`, then `brew services start compute`.
