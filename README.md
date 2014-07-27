# MACChange
A script to change your MAC address on startup.
All the MAC addresses of the devices is randomised using openssl (The most significant byte is preserved to not screw up with unicast/multicast and universally/locally administered settings.
Tested on Mac OS X.
======
## Installation
First download the source:
`$ git clone https://github.com/giacomogiudice/MACChanger.git`
then
`$ sudo sh MACChanger/setup.sh` 

## Notes
To change the list of devices to spoof, edit the `list` variable on line 5 of `chmac.sh`. For example: `list="en0 en1"`
