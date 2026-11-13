cask "light-editor-vidz" do
  version "1.1.2"
  sha256 "21a0fdc1a4e6d4998fd34329f3cbb908e46008985907d19de823f5f2344ff8f6"

  url "https://github.com/light-editor-vidz/light-editor-vidz/releases/download/v#{version}/LightEditorVidz_aarch64.app.tar.gz"
  name "LightEditorVidz"
  desc "Desktop video editor with scene composition and real mp4 export"
  homepage "https://github.com/light-editor-vidz/light-editor-vidz"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships Tauri's updater and replaces itself in place.
  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "LightEditorVidz.app"

  zap trash: [
    "~/Library/Application Support/com.sikander.lighteditorvidz",
    "~/Library/Caches/com.sikander.lighteditorvidz",
    "~/Library/Preferences/com.sikander.lighteditorvidz.plist",
    "~/Library/Saved Application State/com.sikander.lighteditorvidz.savedState",
    "~/Library/WebKit/com.sikander.lighteditorvidz",
  ]

  caveats <<~EOS
    LightEditorVidz is not signed or notarized by Apple. On first launch macOS may
    refuse to open it. Remove the quarantine attribute once:

      xattr -dr com.apple.quarantine "/Applications/LightEditorVidz.app"
  EOS
end
