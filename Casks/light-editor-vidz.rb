cask "light-editor-vidz" do
  version "1.0.0"
  sha256 "8a0778adcbe8ed83e1d6ccf7ff31d6642d67e52b616ff38dbb4ab28c20e490a5"

  url "https://github.com/light-editor-vidz/light-editor-vidz/releases/download/v#{version}/light-editor-vidz_universal.app.tar.gz"
  name "LightEditorVidz"
  desc "Desktop video editor with scene composition and real mp4 export"
  homepage "https://light-editor-vidz.github.io/light-editor-vidz/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app ships Tauri's updater and replaces itself in place.
  auto_updates true
  depends_on macos: :big_sur
  depends_on formula: "ffmpeg"

  app "light-editor-vidz.app", target: "LightEditorVidz.app"

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
