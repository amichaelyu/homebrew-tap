cask "ice" do
  version "0.12.3"
  sha256 "afd7b1ffafa9634d7d2a5275ab70aaa4f74c9d22187babe3769df136ae242302"

  url "https://github.com/amichaelyu/Ice/releases/download/#{version}/Ice.zip"
  name "Ice"
  desc "Menu bar manager fork rebuilt for the latest OS release"
  homepage "https://github.com/amichaelyu/Ice"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  conflicts_with cask: [
    "jordanbaird-ice",
    "jordanbaird-ice@beta",
  ]
  depends_on macos: :sonoma

  app "Ice.app"

  uninstall quit:       "com.jordanbaird.Ice",
            login_item: "Ice"

  zap trash: [
    "~/Library/Application Support/com.jordanbaird.Ice",
    "~/Library/Caches/com.jordanbaird.Ice",
    "~/Library/HTTPStorages/com.jordanbaird.Ice",
    "~/Library/Preferences/com.jordanbaird.Ice.plist",
    "~/Library/WebKit/com.jordanbaird.Ice",
  ]
end
