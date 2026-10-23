cask "ice" do
  version "0.12.0"
  sha256 "599a5874d2e3a1186909be4f702e0a36d8a84a7e8993a9d459c622357ec8566c"

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
