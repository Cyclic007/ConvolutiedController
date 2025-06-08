---
title: "ConvolutedController"
author: "Cyclic"
description: "A wireless Controller built to be used for PC gameing"
created_at: "2025-5-26"
---

#### May 26 The Start

I decided to make a controller that both doesn't have stick drift but also is wireless

The controller will use Hall effect joysticks

also started the scematic and learned I am a fool and that - goes to grd and not +

** Total time spent 3hr **

#### May 29 Short bit

I am going to fix the PCB and all that stuff because I kinda messed it up

I need to setup a swith for the joystick inputs because I have 3 pins and need 4 so I am going to have it constantly switch

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/a81f000e1080067f32bf2d1c0988e7dc7af3a951_image.png)

** Total Time Spent 1hr **

#### May 30

I have decided that there will only be 1 Joystick so I wont need to do cursed stuff

I also finished the scematic

** Total Time Spent 2hr **

#### June 2 Changeing Prosesser

I decided that a controller with only 1 joystick is pathetic to I am changeing to useing Adafruit_Feather_32u4_BluefruitLE

- https://learn.adafruit.com/adafruit-feather-32u4-bluefruit-le/overview

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/c11a42454f0eb3f9d48f4a8e54dc4f91a332ca8e_image.png)

** Total Time spent 1.5hr **

#### June 4 PCB but for real this time

I started by fixing some aotaion things first 

also made case by Useing Turbo Case

- https://turbocase.org/

also Finished the PCB

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/60642058c2bd67ed2ba958b365670b09a76cadf5_image.png)

** Total time Spent 2.5hr **

#### June 4th Part 2 Electric Boogaloo

Found out that ZMK does not support my new Micro Controller so I need to find a different one.
 
I am now going to use SparkFun Pro Micro - RP2040

- https://www.sparkfun.com/sparkfun-pro-micro-rp2040.html

It has 4 ADC pins and is actualy supported by ZMK

** Total Time Spent 1 hr **

#### June 5th Finding that I messed up

so I need a different micro controller because the new one I chose does not have any ADC pins so I will be useing Seeed Studio XIAO RP2040

- wiki.seeedstudio.com/XIAO-RP2040/

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/0db04dad982bc87245ef0502aa6296e004c5a82b_image.png)

I also started on the firmwere configs useing ZMK

I found that insted of useing ZMK I am going to use PassingLink

- https://github.com/passinglink/passinglink

this comes with the stuff to just flash the firmwere 

also I am once again going to change controller for the Adafruit Feather nRF52840 because It works with a battery and is recommended for the firmwere

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/075a4479b8401aa721ad1cecd837b8c7f3f25156_image.png)

and I wont need to write the firmwere myself.

** Total Time Spent 6.5 hr **

#### June 8 Fixing things

I have been told I need to actually make my own case 3d model so I boot up Fusion 360 to start on that

![](https://hc-cdn.hel1.your-objectstorage.com/s/v3/5bd6f40032a6ffecd1735271c88bd00e8aa2448a_image.png)

![](https://hackclub.slack.com/archives/C016DEDUL87/p1749392403176389?thread_ts=1749392396.917319&cid=C016DEDUL87)

** Total Time Spent 1hr 

#### June 8 part 2 firmwere

I found that the thing I was going to use for firmwere is 5 yrs old and not supported. I am going to use alpaca for firmwere and change to adafruit rp2040

** time spent 1hr 