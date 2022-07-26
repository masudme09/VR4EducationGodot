## Preparing Quest 2 environment for Phoenix developent

- On Termux: ``apt install postgres`` \
<https://wiki.termux.com/wiki/Postgresql>
- ``pkg install proot-distro``
- ``proot-distro install ubuntu``
- ``proot-distro login ubuntu``
- ``apt install sudo``
- ``sudo adduser masud``
- ``sudo usermod -aG sudo masud``
- Check: ``groups masud``
- if user is not added to sudoers then goto /etc/sudoers and add user permission, same as root.
- ``su masud``
- ``sudo apt install erlang``
- ``sudo apt install elixir``
- ``mix local.hex``
- ``elixir -v``
- ``mix archive.install hex phx_new``
- modify dev.exs to make accessible through local network
- modify mix.exs if required
- ``mix ecto.create``
- ``mix phx.server``
- close the server if successful
- install VScode :
- ``wget https://github.com/cdr/code-server/releases/download/v3.10.2/code-server-3.10.2-linux-arm64.tar.gz
tar -xvf ./code-server-3.10.2-linux-arm64.tar.gz``
- ``cd code-server-3.10.2-linux-arm64`` \
``cd bin`` \
``export PASSWORD="password"``
- ``./code-server``
- close code-server and type bg to run in background
- cd to the phoenix project directory
- run phoenix server
- from vscode open the project folder and make changes
