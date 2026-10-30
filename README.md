# homebrew-tap

Homebrew tap for [LightEditorVidz](https://github.com/light-editor-vidz/light-editor-vidz).

## Install

```bash
brew install --cask light-editor-vidz/tap/light-editor-vidz
```

## Update

```bash
brew update
brew upgrade --cask light-editor-vidz
```

## Uninstall

```bash
brew uninstall --cask light-editor-vidz
brew untap light-editor-vidz/tap
```

Add `--zap` to `brew uninstall` to also remove the app's settings and caches.

## About unsigned builds

LightEditorVidz is not signed or notarized by Apple. If macOS refuses to open it on first launch, remove the quarantine attribute once:

```bash
xattr -dr com.apple.quarantine "/Applications/LightEditorVidz.app"
```

## License

MIT — see [LICENSE](LICENSE).
