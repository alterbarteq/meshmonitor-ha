# meshmonitor-ha

🇵🇱 [Polski](#polski) | 🇬🇧 [English](#english)

---

## Polski

Home Assistant Add-on uruchamiający [MeshMonitor](https://github.com/Yeraze/meshmonitor) — narzędzie do monitorowania sieci Meshtastic.

### Dlaczego ten add-on?

Istniejący add-on [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) jest przestarzały i używa wersji 3.6.3. Ten add-on zawsze uruchamia **najnowszą wersję** z oficjalnego obrazu Docker `ghcr.io/yeraze/meshmonitor:latest`.

### Instalacja

1. W Home Assistant przejdź do **Ustawienia → Aplikacje → Zainstaluj aplikację**
2. Kliknij menu **(⋮) → Repozytoria**
3. Dodaj: `https://github.com/alterbarteq/meshmonitor-ha`
4. Znajdź **MeshMonitor** i kliknij **Zainstaluj**
5. Skonfiguruj add-on i kliknij **Uruchom**

### Konfiguracja

| Opcja | Opis | Domyślnie |
|-------|------|-----------|
| `meshtastic_node_ip` | Adres IP węzła Meshtastic | `192.168.1.100` |
| `meshtastic_node_port` | Port TCP węzła | `4403` |
| `admin_password` | Hasło admina (tylko pierwsze uruchomienie) | `changeme` |
| `log_level` | Poziom logowania | `info` |
| `timezone` | Strefa czasowa | `Europe/Warsaw` |

### Dostęp

Po uruchomieniu MeshMonitor jest dostępny pod adresem:
http://<adres-HA>:8099 (http://homeassistant.local:8099)

Domyślne dane logowania: `admin` / `changeme` — **zmień hasło po pierwszym logowaniu!**

### Podziękowania

- [Yeraze/meshmonitor](https://github.com/Yeraze/meshmonitor) — autor MeshMonitor
- [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) — inspiracja dla struktury add-ona

---

## English

Home Assistant Add-on running [MeshMonitor](https://github.com/Yeraze/meshmonitor) — a web application for monitoring Meshtastic mesh networks.

### Why this add-on?

The existing add-on [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) is outdated and uses version 3.6.3. This add-on always runs the **latest version** from the official Docker image `ghcr.io/yeraze/meshmonitor:latest`.

### Installation

1. In Home Assistant go to **Settings → Add-ons → Add-on Store**
2. Click the menu **(⋮) → Repositories**
3. Add: `https://github.com/alterbarteq/meshmonitor-ha`
4. Find **MeshMonitor** and click **Install**
5. Configure the add-on and click **Start**


If not configured, the add-on will attempt to auto-detect your Home Assistant URLs from the Supervisor API. If auto-detection fails, it falls back to allowing all origins (`*`), which works but is less secure.

## Usage

1. After starting the add-on, click "Open Web UI" to access MeshMonitor
2. Default credentials are:
   - Username: `admin`
   - Password: `changeme`
3. Change the password after first login
4. Configure your mesh network settings as needed

## Security

This add-on uses CORS (Cross-Origin Resource Sharing) to control which URLs can access the MeshMonitor web interface. There are three ways CORS is configured, in order of priority:

### 1. Manual Configuration (Recommended)

Set the `allowed_origins` option in the add-on configuration with all the URLs you use to access MeshMonitor. **Important**: Use the MeshMonitor port (default 3001), not Home Assistant's port (8123).

```yaml
allowed_origins: "http://homeassistant.local:3001,http://192.168.1.10:3001,https://abcdefg123.ui.nabu.casa:3001"
```

This is the most secure option and works best if you access Home Assistant from multiple URLs (hostname, IP address, external domain, etc.).

### 2. Auto-Detection

If `allowed_origins` is not configured, the add-on will attempt to auto-detect your Home Assistant URLs from the Supervisor API. However, this may not work reliably as the API often returns `null` for these values.

### 3. Fallback to Allow All

If neither manual configuration nor auto-detection provides URLs, the add-on falls back to `allowed_origins: "*"` (all origins allowed) with a warning in the logs. While this ensures the add-on works, it's less secure.

**Check the logs** after starting the add-on to see which method is being used.

## Updating MeshMonitor

This add-on uses the `:latest` tag of the upstream [MeshMonitor](https://github.com/yeraze/meshmonitor) Docker image. This means you'll get MeshMonitor updates when:

1. The add-on version is bumped (e.g., from 0.0.1 to 0.0.2), which triggers a rebuild
2. You manually rebuild the add-on in Home Assistant

**To get the latest MeshMonitor version:**

1. Check for add-on updates in Settings → Add-ons → MeshMonitor
2. If an update is available, click "Update"
3. Restart the add-on

**Note**: Since this is a personal project, I may not immediately release new versions when upstream MeshMonitor updates. If you want to force an update to the latest MeshMonitor version, you can:
1. Uninstall the add-on (make sure to back up your configuration and data first)
2. Reinstall it from the add-on store

Alternatively, you can watch the [MeshMonitor releases](https://github.com/yeraze/meshmonitor/releases) and open an issue requesting a version bump.

## Logging and Disk Space

**Important:** This add-on filters logs to prevent excessive disk space usage.

MeshMonitor generates very verbose logs when monitoring an active mesh network. Without filtering, these logs are captured by Home Assistant's journald system and can consume multiple gigabytes of disk space over time, potentially filling up your system.

### Default Behavior

To prevent disk space issues, this add-on filters logs by default:
- **Shows:** [WARN] and [ERROR] messages, startup output, supervisord messages
- **Filters out:** [INFO] and [DEBUG] messages (which are very verbose)
- **Result:** 80-90% reduction in log volume while keeping important troubleshooting information

### To Enable Full Logging

If you need complete logs for troubleshooting:

1. Access the add-on container via SSH or console
2. Edit the last line of `/run.sh`
3. Remove the `| grep -v -E "^\[(INFO|DEBUG)\]" || true` portion
4. Restart the add-on

**Warning:** With full logging enabled, monitor your Home Assistant disk space regularly. You may need to manually vacuum journald logs:
```bash
journalctl --vacuum-size=500M
```

### Checking Disk Space

Monitor your Home Assistant disk usage in:
- Settings → System → Storage
- Via SSH: `df -h`
- Journald logs specifically: `du -sh /var/log/journal`

## Support

For issues with this add-on, please open an issue on [GitHub](https://github.com/bhardie/ha-meshmonitor/issues).

For issues with MeshMonitor itself, see the [upstream project](https://github.com/yeraze/meshmonitor).

---

Built with the help of [Claude Code](https://claude.ai/code)
