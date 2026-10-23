cask "notchhider" do
  version "1.1.0"
  sha256 "4c66484039c7a2b8d26add81660f66393e8d65f7b2d8b5e54e2cbcf905fd8ffd"

  url "https://github.com/amichaelyu/notchHider/releases/download/v#{version}/NotchHider-#{version}.zip"
  name "NotchHider"
  desc "Hides the MacBook notch by painting the menu bar black"
  homepage "https://github.com/amichaelyu/notchHider"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "NotchHider.app"

  uninstall quit: "com.michaelyu.NotchHider"

  zap trash: [
    "~/Library/Application Support/NotchHider",
    "~/Library/Preferences/com.michaelyu.NotchHider.plist",
  ]
end
