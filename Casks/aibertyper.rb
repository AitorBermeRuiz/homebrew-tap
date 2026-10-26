cask "aibertyper" do
  version "0.3.0"
  sha256 "dd2b1533c67b1de3c5420a4fe8ec51e31a10c4a080950af8ab710bf4c8866f38"

  url "https://github.com/AitorBermeRuiz/AitorTyper/releases/download/v#{version}/AiberTyper-#{version}.zip"
  name "AiberTyper"
  desc "Typing practice from the menu bar"
  homepage "https://github.com/AitorBermeRuiz/AitorTyper"

  depends_on macos: :sonoma

  app "AiberTyper.app"

  # Not notarized by Apple yet: without this, Gatekeeper refuses to open the downloaded app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/AiberTyper.app"]
  end

  caveats <<~TEXT
    AiberTyper is not notarized by Apple yet, so this cask removes the
    download quarantine flag from the app after installing it.
  TEXT

  zap trash: [
    "~/Library/Application Support/AiberTyper",
    "~/Library/Preferences/com.aiber.AiberTyper.plist",
    "~/Library/Application Support/AitorTyper",
    "~/Library/Preferences/com.aitor.AitorTyper.plist",
  ]
end
