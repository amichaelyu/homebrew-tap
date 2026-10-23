cask "syntax-highlight-plus" do
  version "2.2.0"
  sha256 "54d6ad64d50851a8e0dc407b668bee62f20a3029316d859de82f86281d722a15"

  url "https://github.com/amichaelyu/SourceCodeSyntaxHighlight/releases/download/v#{version}/Syntax-Highlight-#{version}-arm64.zip"
  name "Syntax Highlight Plus"
  desc "Quick Look extension for source code, Markdown and LaTeX"
  homepage "https://github.com/amichaelyu/SourceCodeSyntaxHighlight"

  livecheck do
    url :url
    strategy :github_latest
  end

  conflicts_with cask: "syntax-highlight"
  depends_on arch: :arm64
  depends_on macos: ">= :monterey"

  app "Syntax Highlight.app"
  binary "#{appdir}/Syntax Highlight.app/Contents/Resources/syntax_highlight_cli"

  zap trash: [
    "~/Library/Application Support/Syntax Highlight",
    "~/Library/Containers/com.michaelyu.SourceCodeSyntaxHighlight",
    "~/Library/Containers/com.michaelyu.SourceCodeSyntaxHighlight.QuickLookExtension",
    "~/Library/Group Containers/SNC2X5N2CY.com.michaelyu.syntaxhighlight",
    "~/Library/Preferences/com.michaelyu.SourceCodeSyntaxHighlight.plist",
  ]
end
