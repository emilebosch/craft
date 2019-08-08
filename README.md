# Simple craft cms

To build a new environment

```
docker-compose build
docker-compose up -d
open http://localhost:6060/?p=admin/install
```

To backup an environment

```
./bin/backup
```

To restore the environment

```
./bin/restore
```

## Thanks

Inspired by https://github.com/wyveo/craftcms-docker