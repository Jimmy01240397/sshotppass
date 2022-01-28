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

3. config your ``.sshotp`` in your home directory
```
vi ~/.sshotp

<keyname>: 
  password: <yourpassword>
  pwdcmp: <ssh password title>
  otp: <otp secret>
  otpcmp: <ssh otp title>
```

for example:


```
vi ~/.sshotp

<keyname>: 
  password: <yourpassword>
  pwdcmp: Password
  otp: <otp secret>
  otpcmp: Changing MOTP
```

4. And you can connect with sshotppass.
```
sshotppass <keyname> ssh <username>@<host>

sshotppass <keyname> scp <localpath> <username>@<host>:<remotepath>
```
