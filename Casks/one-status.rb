cask "one-status" do
  version "0.8.0"

  on_arm do
    sha256 "49e1d1ad9ee1efcd37adbc9a312af53dfb4dbbf0d5e73baae03c97813654b9a5"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "7111f64b4bb8d987d3197f25b6fd242350b87006c090079e93c1f90486e9c791"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-x64.dmg"
  end

  name "One Status"
  desc "Manage AI tools, encrypted credentials, memory, and work state"
  homepage "https://niyuxuan782.github.io/one-status/"

  depends_on :macos

  app "one-status.app", target: "One Status.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/One Status.app"]
    system_command "/usr/bin/codesign",
                   args: ["--verify", "--deep", "--strict", "#{appdir}/One Status.app"]
  end

  caveats <<~EOS
    This preview build has not completed Apple Developer ID notarization.
    Homebrew verifies the checksum, clears quarantine, and verifies the ad-hoc signature.
  EOS
end
