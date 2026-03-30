#!/bin/bash
# T440s specific installs
yay -S tlp moonlight-qt

# Start tlp service
sudo systemctl enable tlp.service
