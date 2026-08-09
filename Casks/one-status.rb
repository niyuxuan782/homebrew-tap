cask "one-status" do
  version "0.6.0"

  on_arm do
    sha256 "3257eb165f25542fbeb23b1cf2e71947b34efe98107a84a1f3b6b2fd8a53bf0b"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "87ce21ed3e9b32feee95ddf342451ad346ac4f7227be1a23c945ba5d3ca0c00a"

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
