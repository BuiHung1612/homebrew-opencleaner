cask "opencleaner" do
  version "0.3.6"
  sha256 "272c92a0e07bb040a29c5fe764dbb421a88e7e25c348cb97ce4e5c7980a1bced"

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
