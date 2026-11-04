class SmbAutoreconnect < Formula
  desc "Keep network shares mounted and in the Finder sidebar"
  homepage "https://github.com/amichaelyu/smb-autoreconnect"
  url "https://github.com/amichaelyu/smb-autoreconnect/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c75d099721e530eca3b5c4c1440be44c81e4513d89a10bc4287de696e5547f24"

  depends_on :macos

  def install
    system "swiftc", "-O", "-suppress-warnings", "src/sidebar.swift", "-o", "smb-autoreconnect-sidebar"
    libexec.install "smb-autoreconnect-sidebar"
    bin.install "bin/smb-autoreconnect"
    pkgshare.install "shares.example"
  end

  service do
    run opt_bin/"smb-autoreconnect"
    run_type :interval
    interval 15
    process_type :background
    log_path var/"log/smb-autoreconnect.log"
    error_log_path var/"log/smb-autoreconnect.log"
  end

  def caveats
    <<~EOS
      Start the background agent:
        brew services start smb-autoreconnect

      Shares you mount in Finder are added to ~/.config/smb-autoreconnect/shares,
      remounted when their server is reachable, and kept in the sidebar.
      Prefix a line with ! to stop tracking that share.
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/smb-autoreconnect --help")
    assert_path_exists libexec/"smb-autoreconnect-sidebar"
  end
end
