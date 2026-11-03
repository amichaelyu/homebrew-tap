cask "skim" do
  version "1.7.17.2"
  sha256 "e60181793be9adee637210dd1efc4ec68fdeea892be91ddcb1e799bcc42c323b"

  url "https://github.com/amichaelyu/skim/releases/download/#{version}/Skim.zip"
  name "Skim"
  desc "PDF reader and note-taker fork that reloads changed PDFs without flashing"
  homepage "https://github.com/amichaelyu/skim"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :monterey

  app "Skim.app"
  binary "#{appdir}/Skim.app/Contents/SharedSupport/displayline"
  binary "#{appdir}/Skim.app/Contents/SharedSupport/skimnotes"
  binary "#{appdir}/Skim.app/Contents/SharedSupport/skimpdf"

  zap trash: [
    "~/Library/Application Scripts/net.sourceforge.skim-app.skim.quicklook-preview",
    "~/Library/Application Scripts/net.sourceforge.skim-app.skim.quicklook-thumbnails",
    "~/Library/Application Support/com.apple.sharedfilelist/com.apple.LSSharedFileList.ApplicationRecentDocuments/net.sourceforge.skim-app.skim.sfl*",
    "~/Library/Caches/com.apple.helpd/Generated/net.sourceforge.skim-app.skim.help*",
    "~/Library/Caches/net.sourceforge.skim-app.skim",
    "~/Library/Containers/net.sourceforge.skim-app.skim.quicklook-preview",
    "~/Library/Containers/net.sourceforge.skim-app.skim.quicklook-thumbnails",
    "~/Library/Cookies/net.sourceforge.skim-app.skim.binarycookies",
    "~/Library/HTTPStorages/net.sourceforge.skim-app.skim",
    "~/Library/Preferences/net.sourceforge.skim-app.skim.bookmarks.plist",
    "~/Library/Preferences/net.sourceforge.skim-app.skim.plist",
    "~/Library/Saved Application State/net.sourceforge.skim-app.skim.savedState",
  ]
end
