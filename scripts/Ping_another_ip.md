# Ping_another_ip

A simple batchfile, to use in PRTG's Custom EXE/Script sensor, to ping another IP than device's IP (VPN WAN endpoint, multi-homed server, ...).

## How to use

1. Put `Ping_another_ip.bat` in `Custom Sensors\EXE` of your PRTG installation path.
1. Create a device.
1. Add a custom sensor **EXE/Script**.
1. (Set *Name*).
1. Set *EXE/script* to **Ping_another_ip.bat**.
1. Set *Parameters* to the IP address to ping (without quote ex: **8.8.8.8**).
1. (Set *Timeout* to **10** seconds).
1. Set *Channel Name* to **Response time**.
1. Set *Unit String* to **ms**.

Enjoy :)
