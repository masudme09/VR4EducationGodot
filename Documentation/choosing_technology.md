One key idea to create education friendly environment on Meta Quest is to install Linux on it and deploy required application and browsers on that. 
To install linux on android like meta quest we have two main ways>
    - jail break or root the device and install linux as its primary OS. 
    - install linux on top of the android system and use viewer like VNC viewer to view it

Jail breaking Meta Quest is a complicated and illegal process and furthermore, if we root meta quest and install linux on it then we have to basically modify the OS a lot to get immersive experience like what meta provided. So, its not worth the efforts.

On the other hand, running linux on top of android is easy and lots of existing application can ease the effort. It is a completely legal and safe process and we will not break anything of the Meta OS. 

So, I have tried to find out suitable existing technology that can be used to install linux on Meta Quest and provides best usable experience. I have tested following ways so far:

1. Hudders tutorial: https://pastebin.pl/view/65faf5e0 \
   In this tutorial, a linux terminal emulator called Termux is used and with the emulator some custom scripts has been executed to download and install Debian based linux distro. This attempt was successful with following limitations:
   - VNC viewer resolution is low and only can have mobile like small potrait window
   - Graphical UI based application can not be run and can only run command line based application
2. Using Andronix, Termux & VNCViewer \
   Next I have tested an application named Androidnix where they provided almost all popular linux distros and also paid mod version, specificly build for android. I have tried to install ubuntu and manjaro with xfce display type. 
   Good:
    - Resoulution can be set while starting vncserver
    - command line works and useable graphical are on meta quest
   Bad:
    - could not able to install GUI based apps
    - The modded version have some preinstled apps but that is paid version and I couldn't try
    - overall Meta OS mouse support is not proper. For example right click menu not working, copy paste on the linux OS not working. My assumption, its problem of Meta OS. 
3. Next I have test UserLand and bVncViewer. In my opinion, most easy to get started and provides almost all funtionalities of linux except audio isuues while playing video or audio. 
    - GUI based apps can be installed directly from UserLand and worked

    So far, this is the best technology, if we want to sacrifice audio playback. 

Overall, approaching to install linux on top of android to prepare educational environment have some key issues:
    1. In Meta envirionment, Mouse is not working as standard linux environment
    2. Copy pasting is big hassle, keyborad copy is not properly working on linux environment installed on Meta Quest
    3. As Linux is installed on top of android, its not using the hardwares natively and provides poor performance