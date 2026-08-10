class OneStatus < Formula
  desc "Manage AI tools, encrypted credentials, memory, and work state"
  homepage "https://github.com/niyuxuan782/one-status"
  url "https://github.com/niyuxuan782/one-status/releases/download/v0.8.0/one-status-0.8.0.tgz"
  sha256 "4ccefc5e6d2ebaf306f38b652dc6f7cd7e3aaf18d31351b7ef784e26fb0c7027"
  license all_of: ["Apache-2.0", "MIT"]

  depends_on "node"

  on_macos do
    on_arm do
      resource "device-sidecar" do
        url "https://github.com/niyuxuan782/one-status/releases/download/v0.8.0/one-status-device-sidecar-0.8.0-mac-arm64.tar.gz"
        sha256 "0249759ffdbcb33cbb389151e1e7c3eb1661d49f944468039a76d4c4a64c3208"
      end
    end
    on_intel do
      resource "device-sidecar" do
        url "https://github.com/niyuxuan782/one-status/releases/download/v0.8.0/one-status-device-sidecar-0.8.0-mac-x64.tar.gz"
        sha256 "1d107f782776f105a3198b259b608be075bb19172551fea9489af46def4e9d75"
      end
    end
  end

  on_linux do
    depends_on arch: :x86_64
    resource "device-sidecar" do
      url "https://github.com/niyuxuan782/one-status/releases/download/v0.8.0/one-status-device-sidecar-0.8.0-linux-x64.tar.gz"
      sha256 "12ff29ebed71504cb2cbce035f881b7f9b733cc8f9a6b67229015402f7a5f60e"
    end
  end

  def install
    libexec.install "dist/one-status.js"
    chmod 0755, libexec/"one-status.js"
    bin.install_symlink libexec/"one-status.js" => "one-status"
    pkgshare.install "LICENSE", "dist/THIRD_PARTY_NOTICES.txt"

    resource("device-sidecar").stage do
      libexec.install "one-status-device-sidecar"
      chmod 0755, libexec/"one-status-device-sidecar"
      bin.install_symlink libexec/"one-status-device-sidecar"
      pkgshare.install "THIRD_PARTY_NOTICES.device-sidecar.md"
      (pkgshare/"licenses/cc-switch").install "licenses/cc-switch/LICENSE"
    end

    (var/"one-status").mkpath
    chmod 0700, var/"one-status"
  end

  service do
    run [opt_bin/"one-status", "server", "--host", "127.0.0.1", "--port", "8787",
         "--db", var/"one-status/one-status.sqlite"]
    environment_variables ONE_STATUS_DEVICE_SIDECAR: (opt_libexec/"one-status-device-sidecar").to_s
    keep_alive true
    working_dir var/"one-status"
    log_path var/"log/one-status.log"
    error_log_path var/"log/one-status.error.log"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/one-status version").strip
    assert_match "one-status mcp --transport http", shell_output("#{bin}/one-status help")
    assert_predicate libexec/"one-status-device-sidecar", :executable?
    assert_match '"ok":true', pipe_output("#{libexec}/one-status-device-sidecar scan", "{}")
  end
end
