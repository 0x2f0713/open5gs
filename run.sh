#/bin/bash

./install/bin/open5gs-amfd &
./install/bin/open5gs-smfd &
sudo ./install/bin/open5gs-upfd &
./install/bin/open5gs-ausfd &
./install/bin/open5gs-nrfd &
./install/bin/open5gs-udmd &
./install/bin/open5gs-udrd &
./install/bin/open5gs-pcfd &
./install/bin/open5gs-nssfd &
./install/bin/open5gs-bsfd