cask "opencleaner" do
  version "0.3.0"
  sha256 "7192d71a3e6e85577910acb49606d6f567e1a355e8c02fceb09b0f4c6e268cb9"

  url "https://github.com/BuiHung1612/OpenCleaner/releases/download/v#{version}/OpenCleaner.dmg"
  name "OpenCleaner"
  desc "Free, open-source disk cleaner"
  homepage "https://github.com/BuiHung1612/OpenCleaner"

  auto_updates true
  depends_on macos: ">= :tahoe"

  app "OpenCleaner.app"

  # not notarized (no Apple Developer account): without this macOS blocks the first launch
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/OpenCleaner.app"]
  end

  zap trash: [
    "~/Library/Application Support/OpenCleaner",
    "~/Library/Caches/OpenCleaner",
    "~/Library/Preferences/io.github.opencleaner.plist",
  ]
end
