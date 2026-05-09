# meshmonitor-ha

Home Assistant Add-on uruchamiający [MeshMonitor](https://github.com/Yeraze/meshmonitor) — narzędzie do monitorowania sieci Meshtastic.

## Dlaczego ten add-on?

Istniejący add-on [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) jest przestarzały i używa wersji 3.6.3.
Ten add-on zawsze uruchamia **najnowszą wersję** z oficjalnego obrazu Docker `ghcr.io/yeraze/meshmonitor:latest`.

## Instalacja

1. W Home Assistant przejdź do **Ustawienia → Aplikacje → Zainstaluj aplikację**
2. Kliknij menu **(⋮) → Repozytoria**
3. Dodaj: `https://github.com/alterbarteq/meshmonitor-ha`
4. Znajdź **MeshMonitor** i kliknij **Zainstaluj**
5. Skonfiguruj add-on i kliknij **Uruchom**

## Konfiguracja

| Opcja | Opis | Domyślnie |
|-------|------|-----------|
| `meshtastic_node_ip` | Adres IP węzła Meshtastic | `192.168.1.100` |
| `meshtastic_node_port` | Port TCP węzła | `4403` |
| `admin_password` | Hasło admina (tylko pierwsze uruchomienie) | `changeme` |
| `log_level` | Poziom logowania | `info` |
| `timezone` | Strefa czasowa | `Europe/Warsaw` |

## Dostęp

Po uruchomieniu MeshMonitor jest dostępny pod adresem:

http://'adres-HA':8099

Domyślne dane logowania:
- Login: `admin`
- Hasło: ustawione w konfiguracji (domyślnie `changeme`)

**Zmień hasło po pierwszym logowaniu!**

## Jak działa

Add-on pobiera oficjalny obraz Docker `ghcr.io/yeraze/meshmonitor:latest` — zawsze najnowszą wersję. Dane (baza SQLite) są przechowywane w `/data` i przeżywają aktualizacje.

## Podziękowania

- [Yeraze/meshmonitor](https://github.com/Yeraze/meshmonitor) — autor MeshMonitor
- [bhardie/ha-meshmonitor](https://github.com/bhardie/ha-meshmonitor) — inspiracja dla struktury add-ona

## Licencja

MIT — wrapper add-ona dla HA  
MeshMonitor: [BSD-3-Clause](https://github.com/Yeraze/meshmonitor/blob/main/LICENSE)
