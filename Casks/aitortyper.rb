cask "aitortyper" do
  version "0.1.0"
  sha256 "3e082864193de44b2515903ae087a7eaacb4736a760b6dffb204a40121442d3a"

  url "https://github.com/AitorBermeRuiz/AitorTyper/releases/download/v#{version}/AitorTyper-#{version}.zip"
  name "AitorTyper"
  desc "Typing practice from the menu bar"
  homepage "https://github.com/AitorBermeRuiz/AitorTyper"

  depends_on macos: :sonoma

  app "AitorTyper.app"

  # Not notarized by Apple yet: without this, Gatekeeper refuses to open the downloaded app.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/AitorTyper.app"]
  end

  caveats <<~TEXT
    AitorTyper is not notarized by Apple yet, so this cask removes the
    download quarantine flag from the app after installing it.
  TEXT

  zap trash: [
    "~/Library/Application Support/AitorTyper",
    "~/Library/Preferences/com.aitor.AitorTyper.plist",
  ]
end
