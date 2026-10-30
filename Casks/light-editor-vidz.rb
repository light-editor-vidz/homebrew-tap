cask "light-editor-vidz" do
  version "1.0.0"
  sha256 "0e67424c023a61745e0c894bf9fc44e58ab14671956b2ff0a1edcb83363b11b4"

  url "https://github.com/light-editor-vidz/light-editor-vidz/releases/download/v#{version}/LightEditorVidz_universal.app.tar.gz"
  name "LightEditorVidz"
  desc "Desktop video editor with scene composition and real mp4 export"
  homepage "https://github.com/light-editor-vidz/light-editor-vidz"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships Tauri's updater and replaces itself in place.
  auto_updates true
  depends_on formula: "ffmpeg"
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
