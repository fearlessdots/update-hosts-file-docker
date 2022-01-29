# update-hosts-file (Linux-based platforms only)
### Available platforms: Linux x86_64 and Raspberry Pi

Script to help update the /etc/hosts file using custom hosts file from the Web (e.g. [Steven Black' hosts file](https://github.com/StevenBlack/hosts/ )) and other user custom hosts files. This program was tested on Linux X86_64 platform running Ubuntu 20.04/21.04 and on Raspberry Pi 3 Model B+ running Raspberry Pi OS.

**Note:** this is only a personal project, and it is released under the GNU General Public License, Version 2.

---

I believe **everyone** should have the right to browse the web without worries of being spied on or end up accessing a malicious website. The scripts found at this repository are just a way I (a newbie on the Linux world and the Shell language) found to make me safer online.

![undraw_connected_world_wuay](https://user-images.githubusercontent.com/63175560/123716784-d6a4b080-d851-11eb-9c1d-f7fb3054f609.png)

Source of image: [unDraw](https://undraw.co), a collection of open-source illustrations. I appreciate the work of Katerina Limpitsouni and Aggelos Gesoulis.

If you want to block ads and other hosts on Android, you can give a try to [AdAway](https://github.com/AdAway/adaway.github.io).

**I am not related neither to AdAway nor to Steven Black. But for sure their work somehow inspired me to make this personal project.**

# Modules
Hosts files (called modules) that are enabled, either retrieved locally or from the web, are automatically added to /etc/hosts every time you run `update-hosts-file update`. Configurations can be found in /modules. All hosts file (local and web) should follow the same scheme:
`<ip_address> <hostname>`. To comment a line, simply add a `#` in the start of it and the program will ignore it, skipping to the next line. For some help on how to configure properly the program, give a look at the templates provided by default.

To enable or disable modules, run `update-hosts-file manage`. This is valid for both web and custom modules (for more info on what these terms stand for, see the sections below). 

## Custom Modules (local)

Custom modules are files found in the computer (local files) that contains all the hosts and their corresponding IP addresses.These modules should be placed in the */modules/custom* directory inside the program directory (by default, */usr/share/update-hosts-file*).

In this directory, you can place custom hosts files following the scheme below:
```
# This is only a template
127.0.0.1 localhost
::1 localhost
0.0.0.0 0.0.0.0
```
To enable a custom module, hard link it (do not use ln -s) to /modules/custom/enable and, to disable it, simply unlink it. Alternatively, run `update-hosts-file update` and select the appropriate options.

**Note:** Two custom modules are provived as templates (by default, they are disabled). If you are going to keep Steven Black's hosts module enabled, there is no need to enable the `default` module (in /modules/custom/available/default) since the former already provides these hosts.

## Web Modules

Web modules are files found in the computer (local files) but that just contains a link to the corresponding hosts file. These modules should be placed in the */modules/web* directory inside the program directory (by default, */usr/share/update-hosts-file*).

In this directory, you can place hosts files to be retrieved from the Web, following the scheme below:
```
# This is only a template
https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn/hosts
```
The name of the file will be used as the name of the module and the only content inside of the file should be the corresponding source URL for the hosts file. 
  
To enable a web module, hard link it (do not use ln -s) to /modules/web/enable and, to disable it, simply unlink it. Alternatively, run `update-hosts-file update` and select the appropriate options.

**Note:** Steven Black's hosts is enabled by default. To deactivate it, simply unlink it from modules/web/enabled. For more info, visit the Steven Black's [official repo](https://github.com/StevenBlack/hosts/).

# Additional Help

## Valid Arguments
Run `update-hosts-file help` to display valid arguments.

## Program Preferences
You can change the program's default values (e.g., default text editor and viewer) by modifying `/config/preferences` file. By default, 'nano' is used as the editor and 'less' as the viewer (view/edit feature was added on version 1.2). All features can be found in this file. Give it a look! Features from future releases will be inserted in this file as soon as they are released.

# Installation
During the installation process, you can choose whether you want to backup your current modules directory `/modules` and preferences file `/config/preferences` or just install fresh program files and executables (scripts).

## Method 1 - Clone The Repository With GIT And Run
This method of installation will always download the most updated repository, but there is no guarantee of stability.

```bash
git clone https://github.com/fearlessdots/update-hosts-file
cd update-hosts-file
chmod +x install
sudo ./install
```
**Attention:** by default, the executable will be installed in /usr/bin and the other configuration files in /usr/share/update-hosts-file. You can change this (not recommended) by modifying the variable values inside the installation script.

## Method 2 - Download ZIP File And Run
This method of installation will always download the most recent release (sometimes outdated in comparison with the GIT repository). Downloading the most recent releases may be more stable than downloading the repository.

Use the command you prefer, e.g. wget or curl. Running wget:
```bash
wget https://github.com/fearlessdots/update-hosts-file/archive/refs/heads/main-x86_64.zip
unzip main-x86_64.zip
cd update-hosts-file-main-x86_64
chmod +x install
sudo ./install
```
**Attention:** by default, the executable will be installed in /usr/bin and the other configuration files in /usr/share/update-hosts-file. You can change this (not recommended) by modifying the variable values inside the installation script.

# Upgrade

## Method 1 - Run the `install` script
To upgrade, download the files found in this repository using any of the methods of installation and, once inside the downloaded directory, run `sudo ./install`.

## Method 2 - Run `update-hosts-file upgrade`
This method is available since version 1.5. It first verifies if any newer version is available (compared to the one installed on your computer) and, if you accept, it downloads the zip file for the most recent version and run the `install` script found inside of it. It is possible to automate this process to make it run the `upgrade`script every time you issue the command `update-hosts-file update` (this automation is enabled by default). For more information, view the `preferences` file located in the configuration directory.

# License
The update-hosts-file software is released under the GNU General Public License Version 2.0 (GPL-2.0).

```
Copyright (C) 2022 Filipe Bertelli

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.
```
