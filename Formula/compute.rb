class Compute < Formula
  desc "Agent-native job scheduler for Slurm clusters, CPU machines and GPU clouds"
  homepage "https://github.com/amichaelyu/compute"
  url "https://github.com/amichaelyu/compute/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "7af79e319eff0070c54706606bccc44f234feb7362921a2d8d3e04426ad92ef7"

  depends_on "oven-sh/bun/bun" => :build
  depends_on "rust" => :build
  depends_on "zstd"

  def install
    # The dashboard is embedded in the daemon at build time.
    cd "web" do
      system "bun", "install", "--frozen-lockfile"
      system "bun", "run", "build"
    end
    system "cargo", "install", *std_cargo_args(path: "crates/computed")
    pkgshare.install "skills", "hosts.example.toml", "deploy/computed.service"
  end

  service do
    run [opt_bin/"computed", "serve"]
    keep_alive true
    log_path var/"log/computed.log"
    error_log_path var/"log/computed.log"
  end

  def caveats
    <<~EOS
      Configure the coordinator in ~/.config/compute:
        hosts.toml       backends (start from #{opt_pkgshare}/hosts.example.toml)
        allowed_signers  SSH public keys allowed to use the API
        computed.env     COMPUTE_LISTEN=<address>:8765, and other settings
      Then start it:
        brew services start compute

      Agents use the skill; link it where your agent finds skills:
        ln -s #{opt_pkgshare}/skills/compute ~/.claude/skills/compute
      and point clients at the daemon in ~/.config/compute/client.env (COMPUTE_URL=...).
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/computed version")
    assert_path_exists pkgshare/"skills/compute/SKILL.md"
  end
end
