cask "ice" do
  version "0.11.16"
  sha256 "8c4a0a4ac51a31369ff08e42f4b670e8871f892c8e3cc15d01185e807074168f"

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
