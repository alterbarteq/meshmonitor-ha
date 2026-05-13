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

### Configuration

| Option | Description | Default |
|--------|-------------|---------|
| `meshtastic_node_ip` | IP address of your Meshtastic node | `192.168.1.100` |
| `meshtastic_node_port` | TCP port of the node | `4403` |
| `admin_password` | Admin password (first boot only) | `changeme` |
| `log_level` | Logging level | `info` |
| `timezone` | Timezone | `Europe/Warsaw` |

### Access

After starting, MeshMonitor is available at:
[http://<HA-address>:8099](http://<adres-HA>:8099 (http://homeassistant.local:8099))

Default credentials: `admin` / `changeme` — **change your password after first login!**

### How it works

The add-on pulls the official Docker image `ghcr.io/yeraze/meshmonitor:latest` — always the newest version. Data (SQLite database) is stored in `/data` and survives updates and restarts.

### Credits

- [Yeraze/meshmonitor](https://github.com/Yeraze/meshmonitor) — MeshMonitor author
- [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) — inspiration for the add-on structure

### License

MIT — HA add-on wrapper  
MeshMonitor: [BSD-3-Clause](https://github.com/Yeraze/meshmonitor/blob/main/LICENSE)
