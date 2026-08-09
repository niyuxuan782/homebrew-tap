cask "one-status" do
  version "0.7.0"

  on_arm do
    sha256 "ccc3208c0127dcac4b26d4f256644415239a08d4dbc1de15f89e45bccd96ab4b"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "4ef858fef15ef554fb4689fa6340ed2736abd02139196da68e480563dcb031e5"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-x64.dmg"
  end

  name "One Status"
  desc "Personal Agent control center for AI environment sync and handoff"
  homepage "https://niyuxuan782.github.io/one-status/"

  depends_on :macos

  app "one-status.app", target: "One Status.app"

  caveats <<~EOS
    This preview build has not completed Apple Developer ID notarization.
    Verify the release checksum before installation.
  EOS
end
