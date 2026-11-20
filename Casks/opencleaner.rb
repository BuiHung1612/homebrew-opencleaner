cask "opencleaner" do
  version "0.3.10"
  sha256 "ef7e8fbc06b2a0fbd93459d9aa5f654a1547a59a0c9ab5aba230f1a21de5e48a"

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
