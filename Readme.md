# sshotppass

For ssh servers with 2FA

## install
1. clone this repo and cd into sshotppass.
``` bash
git clone https://github.com/Jimmy01240397/sshotppass
cd sshotppass
```

2. run install.sh
``` bash
sh install.sh
```

3. get your otp secert.
- Scan otp qrcode
- And you will get this ``otpauth://totp/<otp name>?algorithm=SHA1&digits=6&issuer=<issuer>&period=30&secret=<otp secert>``
- We need ``<otp secert>``

4. config your ``.sshotp`` in your home directory
``` yaml
<keyname>: 
  password: <yourpassword>
  pwdcmp: <ssh password title>
  otp: <otp secret>
  otpcmp: <ssh otp title>
```

for example:

![image](https://user-images.githubusercontent.com/57281249/151539520-fe8b60bc-0bea-465d-9344-fe0353cc2a3f.png)
```
vi ~/.sshotp

<keyname>: 
  password: <yourpassword>
  pwdcmp: Password
  otp: <otp secret>
  otpcmp: Changing MOTP
```

5. If you have not connected to the host before, please use ssh to connect once.
```
# ssh <username>@<host>
The authenticity of host '<host>' can't be established.
ECDSA key fingerprint is SHA256:###.
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '<host>' (ECDSA) to the list of known hosts.
```

6. And you can connect with sshotppass.
```
sshotppass <keyname> ssh <username>@<host>

sshotppass <keyname> scp <localpath> <username>@<host>:<remotepath>
```
