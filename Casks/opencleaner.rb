cask "opencleaner" do
  version "0.3.3"
  sha256 "13673b2cd29ce2664b82e22e654f2de807b52a0202b310bf761aeebf1ccd98e7"

  url "https://github.com/BuiHung1612/OpenCleaner/releases/download/v#{version}/OpenCleaner.dmg"
  name "OpenCleaner"
  desc "Free, open-source disk cleaner"
  homepage "https://github.com/BuiHung1612/OpenCleaner"

  auto_updates true
  depends_on macos: :tahoe

  app "OpenCleaner.app"

  # not notarized (no Apple Developer account): without this macOS blocks the first launch
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/OpenCleaner.app"],
        writable_paths: ["{{appdir}}/OpenCleaner.app"]
  end

  zap trash: [
    "~/Library/Application Support/OpenCleaner",
    "~/Library/Caches/OpenCleaner",
    "~/Library/Preferences/io.github.opencleaner.plist",
  ]
end
