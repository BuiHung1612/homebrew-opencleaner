# Template: the release workflow fills in the version and sha256 and attaches the result to the release.
cask "opencleaner" do
  version "0.3.2"
  sha256 "2e1ec490019056a9b0f7235fe4d13fe1ad5cb4f4d4afce818855996d1ac327a3"

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
