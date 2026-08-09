cask "one-status" do
  version "0.3.0"

  on_arm do
    sha256 "c82c24d273c55fdafd49a8edb5227f9eacfbdac1b3733c9985db3cfad412a074"

    url "https://github.com/niyuxuan782/one-status/releases/download/v0.3.0/One-Status-0.3.0-mac-arm64.dmg"
  end
  on_intel do
    sha256 "dad497d7a961fd3e835e36716c95b8d5a058321572cefddf010f2fa4e324c969"

    url "https://github.com/niyuxuan782/one-status/releases/download/v0.3.0/One-Status-0.3.0-mac-x64.dmg"
  end

  name "One Status"
  desc "Personal Agent control center for AI environment sync and handoff"
  homepage "https://os.furesta.top/"

  depends_on :macos

  app "One Status.app"

  caveats <<~EOS
    This preview build has not completed Apple Developer ID notarization.
    Verify the release checksum before installation.
  EOS
end
