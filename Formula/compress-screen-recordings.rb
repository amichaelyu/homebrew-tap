class CompressScreenRecordings < Formula
  desc "Automatically shrink macOS screen recordings on the Desktop with ffmpeg"
  homepage "https://github.com/amichaelyu/compress-screen-recordings"
  url "https://github.com/amichaelyu/compress-screen-recordings/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a4e09f6fcda2046e0500d695d958282994b94f871eebd50aa8cef459a6df4381"

  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "bin/compress-screen-recordings"
  end

  def caveats
    <<~EOS
      To compress new screen recordings on your Desktop automatically, run:
        compress-screen-recordings install-agent

      macOS will then ask to let "Compress Screen Recordings" access your
      Desktop. Click Allow.

      Before uninstalling, run:
        compress-screen-recordings uninstall-agent
    EOS
  end

  test do
    assert_match "install-agent", shell_output("#{bin}/compress-screen-recordings help")
  end
end
