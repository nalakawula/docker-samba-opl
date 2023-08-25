## Dockerized Samba Server for Open PlayStation Loader

OPL can stream backed up games from SMB.

On your Linux PC

1. You need to edit .env, change `SHARE_PATH` to your actual game directory
2. You then type `docker-compose up`


On your PS2

1. As your share enter `PS2SMB` (this is important)
2. As a username enter `guest`
3. Leave password empty

Enjoy!
