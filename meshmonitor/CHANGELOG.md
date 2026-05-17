# Changelog

All notable changes to this project will be documented in this file.

## [1.0.4] - 2026-05-17

### Added
- USB device access (`/dev/ttyUSB0`) — MeshCore devices connected via USB (CP2102, CH340, etc.) are now supported
- `host_network` mode enabled — improves connectivity to Meshtastic nodes on the local network

### Fixed
- Resolved issue where the add-on could not reach Meshtastic nodes on non-default subnets

---

## [1.0.3] - 2026-05-09

### Fixed
- Fixed `devices` format in `config.yaml` — HA Supervisor requires a simple list of paths, not objects with `path` and `cgroup` keys
- Removed deprecated `arch` values (`armhf`, `i386`) that caused warnings in HA Supervisor

---

## [1.0.2] - 2026-05-09

### Changed
- Switched to official `ghcr.io/yeraze/meshmonitor:latest` Docker image as build base — installation time reduced from ~15 minutes to under 1 minute
- Simplified `Dockerfile` — no longer builds MeshMonitor from source
- Removed `run.sh` dependency — MeshMonitor now uses its own entrypoint with environment variables set via `Dockerfile ENV`

### Fixed
- Fixed blank web UI caused by incorrect `CMD` in Dockerfile
- Fixed `ALLOWED_ORIGINS` — set to `*` to allow access from local network

---

## [1.0.1] - 2026-05-09

### Fixed
- Fixed add-on not appearing in HA store — added missing `arch:` section to `config.yaml`
- Fixed `image:` conflict with `Dockerfile` — removed `image:` line so HA uses local build
- Fixed npm dependency conflict (`vite-plugin-pwa`) — added `--legacy-peer-deps` flag

---

## [1.0.0] - 2026-05-09

### Added
- Initial release — fork of [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor)
- Updated to always pull latest MeshMonitor from [Yeraze/meshmonitor](https://github.com/Yeraze/meshmonitor)
- Added support for `aarch64`, `amd64`, `armv7` architectures
- Added Ingress support for Home Assistant sidebar
- Added configurable options: `meshtastic_node_ip`, `meshtastic_node_port`, `admin_password`, `log_level`, `timezone`
- Added `repository.yaml` with correct maintainer information
