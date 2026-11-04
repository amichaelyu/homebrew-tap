class ServerAutoreconnect < Formula
  desc "Keep network shares mounted and in the Finder sidebar"
  homepage "https://github.com/amichaelyu/server-autoreconnect"
  url "https://github.com/amichaelyu/server-autoreconnect/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "98281303ac295ae4511577295c0b042346fc9413d76184ff164c398226850150"

  depends_on :macos

  def install
    system "swiftc", "-O", "-suppress-warnings", "src/sidebar.swift", "-o", "server-autoreconnect-sidebar"
    libexec.install "server-autoreconnect-sidebar"
    bin.install "bin/server-autoreconnect"
    pkgshare.install "shares.example"
  end

  service do
    run opt_bin/"server-autoreconnect"
    run_type :interval
    interval 15
    process_type :background
    log_path var/"log/server-autoreconnect.log"
    error_log_path var/"log/server-autoreconnect.log"
  end

  def caveats
    <<~EOS
      Start the background agent:
        brew services start server-autoreconnect

      Shares you mount in Finder are added to ~/.config/server-autoreconnect/shares,
      remounted when their server is reachable, and kept in the sidebar.
      Prefix a line with ! to stop tracking that share.
    EOS
  end

  test do
    assert_match "usage", shell_output("#{bin}/server-autoreconnect --help")
    assert_path_exists libexec/"server-autoreconnect-sidebar"
  end
end
