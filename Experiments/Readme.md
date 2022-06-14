Currently, Godot support 3 plugins to interact with VR headsets. 
1. OpenVR plugin
2. OpenXR plugin
3. Oculus Mobile Plugin ( Specially for Oculus Quest)

OpenXR is the latest and future of VR development for Godot and most of the other game development platform. As this OpenXR API is developed by Khronos Group consortium and adopted by almost all popular VR platform including Meta Quest.
OpenVR is also Open source API that is accepted by most of the headset manufacturer and its introduced by Valve Software. 
Oculus Mobile API is specially made for Oculus or Meta device. 

As all three plugin should potentially support Oculus Quest theoratically and OpenXR plugin for godot have implemented passthrough features, I have tried to test OpenXR with occulus first.
While testing OpenXR, I have gone through prettey harsh challenges and controllers were deactivated when deploying to Quest 2 and very lack of support document available to confirm proper usage. 
I could use Occulus link to test OpenXR test application on PC with head tracking. As, controller functions are very essential for my project, I have to quit using OpenXR plugin. 

Then I have tried OpenVR, as its also a common API interface and theoratically should work on cross platform deployment. However, also faces issues to properly make the controller working and testing and deploying application with OpenVR plugin in godot is pretty cumbersome. 
The most challenging thing I am facing to work with Godot is lack of proper documentation and unstable documentation. As Godot is still new game engine and new godot 4.0 will be almost completely rewritten, team is more focused on that. 
Current godot documentation sometimes not properly sync with latest release. Also, sometimes I had face bugs in the release.

Finally, I have tested Oculus Mobile Plugin and it seems, controller and key press is working with the demo scene provided by plugin. Although, this plugin is deprecated but as its working with basic thing, I am trying to achieve my main requirements with it.
Also, it have some popular implementation available that should be help during the process. 

After a few hours of more testing, I could use openXR properly and decided to use OpenXR and occulus plugin together. 
