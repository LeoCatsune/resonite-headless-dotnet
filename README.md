# resonite-headless-dotnet

Docker image of a Resonite headless server (.NET 8)

Based on [shadowpanther/resonite-headless][upstream] and [WattleFoxxo/Resonite-pterodactyl-eggs][egg]

Send the command `/headlessCode` to **Resonite** bot (the one that sends you messages about Patreon and storage) in Resonite to get the beta key.

Steam login is required to download the client. You'll have to disable SteamGuard, so probably create a separate Steam account for your headless server.

Sample docker-compose:

```yaml
version: "3.3"
services:
  resonite:
    image: ghcr.io/leocatsune/resonite-headless-dotnet:latest
    container_name: resonite-headless
    tty: true
    stdin_open: true
    environment:
      STEAMBETA: headless
      STEAMBETAPASSWORD: ask-bot-for-code
      STEAMLOGIN: "your_steam_login your_steam_password"
    volumes:
      - "./Config:/Config:ro"
      - "./Logs:/Logs"
      - "/etc/localtime:/etc/localtime:ro"
    restart: unless-stopped
```

Place your `Config.json` into `Config` folder. Logs would be stored in `Logs` folder.

You probably need to set `vm.max_map_count=262144` by doing `echo "vm.max_map_count=262144" >> /etc/sysctl.conf` lest you end up with frequent GC crashes.

[upstream]: https://github.com/shadowpanther/resonite-headless
[egg]: https://github.com/WattleFoxxo/Resonite-pterodactyl-eggs
