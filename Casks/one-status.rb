cask "one-status" do
  version "0.5.0"

  on_arm do
    sha256 "a9571921a76c91df851ef800f91c5390d82a733880fcfda7308da01d6aa0c635"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "469161b870a834638eab523153abdea930a2474b9ce1b12bf031aab8ba1d60a9"

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
