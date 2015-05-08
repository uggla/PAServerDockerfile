#!/bin/bash

# Update configuration files

sed -i.bkp -f update_lobby.js.sed ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/states/lobby.js
sed -i.bkp -f update_sim_utils.js.sed ./.local/Uber\ Entertainment/Planetary\ Annihilation/stable/media/server-script/sim_utils.js
