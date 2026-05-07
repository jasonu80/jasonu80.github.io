
# Solutions to Lab

## Process:

Here, I retrieved the files inside the machine:

```bash
ls
# randy-chromium.pcapng  ssl-key.log
```

Then, opened the Wireshark and decrypted the SSL key file to decrypt the traffic.

![Decrypted Traffic](DecryptedTraffic.png)

After that, I discovered the export objects in the Wireshark menu. 

![Export](ExportObjects.png)

Since this is encrypted traffic, it needs to be viewed on the Wireshark GUI Application itself. 

![Credentials](Credentials.png)

