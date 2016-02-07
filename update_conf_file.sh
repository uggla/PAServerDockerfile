#!/bin/bash

# Update configuration files

# Introduce modification from mikeyh : https://forums.uberent.com/threads/wip-dedicated-servers.65077/page-6#post-1124347
cd ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script && patch -p1 < /home/pa/mikeyh_lobby.patch
cd /home/pa
# Update lobby to add beacon
sed -i.bkp -f update_lobby.js.sed ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/states/lobby.js
# Update MAX_PLAYERS and MAX_SPECTATORS parameters
sed -i.bkp -f update_main.js.sed ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/main.js
# Update MAX_PLANETS parameters
sed -i.bkp -f update_sim_utils.js.sed ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/sim_utils.js
