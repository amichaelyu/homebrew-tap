class SmbAutoreconnect < Formula
  desc "Keep network shares mounted and in the Finder sidebar"
  homepage "https://github.com/amichaelyu/launchAgents/tree/main/smb-autoreconnect"
  url "https://github.com/amichaelyu/launchAgents/archive/refs/tags/v1.0.0.tar.gz"
  version "0.3.1"
  sha256 "57c964167fddacfdc0a9427d3349316d0918ba56b9ad620c4d8d22f5cf6c2deb"

  depends_on :macos

  def install
    system "swiftc", "-O", "-suppress-warnings", "smb-autoreconnect/src/sidebar.swift", "-o", "smb-autoreconnect-sidebar"
    libexec.install "smb-autoreconnect-sidebar"
    bin.install "smb-autoreconnect/bin/smb-autoreconnect"
    pkgshare.install "smb-autoreconnect/shares.example"
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
