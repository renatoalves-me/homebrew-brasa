# Homebrew cask for Brasa. It lives in the tap repo renatoalves-me/homebrew-brasa (Casks/brasa.rb).
# After each release, update `version` and `sha256` (the release publishes the .sha256 file).
cask "brasa" do
  version "1.1.0"
  sha256 "185337b54acf4c8d0a1a2a1f40d3b3c195c751761119ab22e5fa6cc456ef4cc4"

  url "https://github.com/renatoalves-me/brasa/releases/download/v#{version}/Brasa-v#{version}-arm64.zip"
  name "Brasa"
  desc "Menu bar temperature monitor for Apple Silicon with status and advice"
  homepage "https://github.com/renatoalves-me/brasa"

  depends_on macos: ">= :sonoma"
  depends_on arch: :arm64

  app "Brasa.app"
  binary "#{appdir}/Brasa.app/Contents/MacOS/Brasa", target: "brasa"

  # The build is ad-hoc signed (not notarized yet): clear the quarantine flag so macOS opens it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Brasa.app"]
  end

  zap trash: "~/Library/Preferences/br.com.renato.brasa.plist"
end
