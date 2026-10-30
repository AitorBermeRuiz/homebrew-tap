cask "aibertyper" do
  version "0.4.2"
  sha256 "3837efb71ad98cb27ac6496d2f577d22b909fe0d77810d08151498ac7795a9dd"

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
