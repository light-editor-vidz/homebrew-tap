# LightEditorVidz Homebrew Tap

Official Homebrew tap for [**LightEditorVidz**](https://light-editor-vidz.github.io/light-editor-vidz/) — compose scenes with text, images, video and audio, animate them, and export a real mp4.

## Install

```bash
brew install --cask light-editor-vidz/tap/light-editor-vidz
```

Or use the project's one-line installer, which runs the same `brew install` on macOS and installs
the `.deb` / `.AppImage` on Linux:

```bash
curl -fsSL https://raw.githubusercontent.com/light-editor-vidz/light-editor-vidz/main/install.sh | bash
```

## Upgrade

```bash
brew upgrade --cask light-editor-vidz
```

## Uninstall

```bash
brew uninstall --cask light-editor-vidz
brew untap light-editor-vidz/tap
```

Add `--zap` to also remove settings, caches and application data:

```bash
brew uninstall --zap --cask light-editor-vidz
```

## Requirements

- **macOS 11 Big Sur or later**, Apple Silicon or Intel — the DMG is a universal
  binary.
- [`ffmpeg`](https://ffmpeg.org) is a **required runtime dependency** and is pulled in
  automatically by the cask.

The app is not signed with an Apple Developer certificate. If macOS refuses to open it,
clear the quarantine flag once:

```bash
xattr -dr com.apple.quarantine "/Applications/LightEditorVidz.app"
```

## Contents

| Cask | Description |
|------|-------------|
| [`light-editor-vidz`](Casks/light-editor-vidz.rb) | LightEditorVidz desktop app (universal DMG) |

## How this tap is updated

Nothing here is edited by hand. Publishing a release in the
[main repository](https://github.com/light-editor-vidz/light-editor-vidz) triggers its
`update-homebrew-tap` workflow, which recomputes the DMG checksum and bumps `version`
and `sha256` in `Casks/light-editor-vidz.rb`.

The cask body itself is the source of truth and lives only here — the workflow rewrites
those two fields and nothing else, so an edit made in this repository is never
overwritten by the next release. Before pushing, the workflow audits and actually
installs the candidate cask on a macOS runner; a cask that fails to install never
reaches this repository.

The workflow needs a `HOMEBREW_TAP_TOKEN` secret on the main repository (a PAT with
`contents: write` here).

## Issues

Report problems on the [main issue tracker](https://github.com/light-editor-vidz/light-editor-vidz/issues).
