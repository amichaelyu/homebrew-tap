class CompressScreenRecordings < Formula
  desc "Automatically shrink macOS screen recordings on the Desktop with ffmpeg"
  homepage "https://github.com/amichaelyu/compress-screen-recordings"
  url "https://github.com/amichaelyu/compress-screen-recordings/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "f00763691fd44a401ca0aeddabf24a40c9e6ae16c6b349e631d88e834ce58a40"

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
