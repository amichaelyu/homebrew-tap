class ServerAutoreconnect < Formula
  desc "Remount network shares so Finder sidebar favorites come back on their own"
  homepage "https://github.com/amichaelyu/server-autoreconnect"
  url "https://github.com/amichaelyu/server-autoreconnect/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "9777b56e07e6ea4ae288d1ee4ee87aeb606e3cecde4e2795909b2326441adaad"

  depends_on :macos

  def install
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
      List share URLs, one per line, in ~/.config/server-autoreconnect/shares:
        mkdir -p ~/.config/server-autoreconnect
        echo 'smb://user@host/share' >> ~/.config/server-autoreconnect/shares

      Then start the background agent:
        brew services start server-autoreconnect
    EOS
  end

  test do
    ENV["SERVER_AUTORECONNECT_CONFIG"] = testpath/"none"
    assert_match "no config", shell_output(bin/"server-autoreconnect")
  end
end
