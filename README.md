DPHue
=====

DPHue is an Objective-C library for controlling the Philips Hue lighting system. It allows you to read and write the entire state of a Philips Hue controller and all of the lights it manages, including changing individual lamp color, power state and other settings.

Features
========
* Complete and granular management of the entire Philips Hue lighting system
* Robust autodiscovery of Hue controller (via meethue.com API and also SSDP)
* Completely asynchronous - the Hue API requires separate requests for each lamp which some control software implement in a blocking, serial fashion. DPHue executes multiple requests simultaneously and asynchronously, effecting rapid and reliable state changes.

Caveats
=======
* The Hue controller can only handle about 30 requests in rapid succession before it starts rate limiting, which it does by responding to all requests with HTTP 503. Additionally, each lamp requires a separate request. This means that if you make many API requests lamps may take a while to change, and the Hue controller may start ignoring you. So if you try to make a change and it doesn't work, wait a little bit and try again.

Examples
======================
* For a full implementation example, see QuickHue, an OS X menubar util, https://github.com/danparsons/QuickHue

Turn on all lights:
````objective-c
DPHue *hue = [[DPHue alloc] initWithHueHost:@"192.168.0.53" username:@"088CA87723B99CBC38C44DDD0E7875A2";
[hue readWithCompletion:^(DPHue *hue, NSError *err) {
     [hue allLightsOn];
}];
````

Set light 2 to half brightness:
````objective-c
DPHue *someHue = [[DPHue alloc] initWithHueHost:@"192.168.0.53" username:@"088CA87723B99CBC38C44DDD0E7875A2";
[someHue readWithCompletion:^(DPHue *hue, NSError *err) {
     DPHueLight *light = hue.lights[1];
     light.brightness = @128;
     [light write];
}];
````
