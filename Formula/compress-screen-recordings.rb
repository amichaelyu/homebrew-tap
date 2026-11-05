class CompressScreenRecordings < Formula
  desc "Automatically shrink macOS screen recordings on the Desktop with ffmpeg"
  homepage "https://github.com/amichaelyu/launchAgents/tree/main/compress-screen-recordings"
  url "https://github.com/amichaelyu/launchAgents/archive/refs/tags/v1.0.0.tar.gz"
  version "0.1.2"
  sha256 "57c964167fddacfdc0a9427d3349316d0918ba56b9ad620c4d8d22f5cf6c2deb"

  depends_on "ffmpeg"
  depends_on :macos

  def install
    bin.install "compress-screen-recordings/bin/compress-screen-recordings"
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
