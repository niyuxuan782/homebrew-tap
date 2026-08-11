cask "one-status" do
  version "0.8.0"

  on_arm do
    sha256 "a9f150cf5c3a47415e53284d45ec499150643909f665a918352008ec45f31a00"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-arm64.dmg"
  end
  on_intel do
    sha256 "7f921945800f423e0f83a374c311b6b01bc3706e13f777a85ff9d8bc45b36082"

    url "https://github.com/niyuxuan782/one-status/releases/download/v#{version}/One-Status-#{version}-mac-x64.dmg"
  end

  name "One Status"
  desc "Manage AI tools, encrypted credentials, memory, and work state"
  homepage "https://niyuxuan782.github.io/one-status/"

  depends_on :macos

  app "one-status.app", target: "One Status.app"
end
