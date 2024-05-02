# Changelog

## 0.12.0 - 2024-05-02

### Added

- CHANGELOG.md
- .gitignore
- Makefile
- docker-compose.yml
- --disable-gpu flag to chrome
- missing python requests module required for self-ping.py ([#7](https://github.com/vital987/chrome-novnc/issues/7) fix)
- VNC_SHARED to app.json

### Changed

- base distro to alpine
- package names for alpine compatibility
- chromium download source to alpine repo
- README.md
- rootfs -> assets

### Fixed

- issue [#7](https://github.com/vital987/chrome-novnc/issues/7)

