# IOTJS-EXPRESS #

[![GitHub forks](https://img.shields.io/github/forks/SamsungInternet/iotjs-express.svg?style=social&label=Fork&maxAge=2592000)](https://GitHub.com/SamsungInternet/iotjs-express/network/)
[![license](https://img.shields.io/badge/license-MIT-0.svg)](MIT)
[![NPM](https://img.shields.io/npm/v/iotjs-express.svg)](https://www.npmjs.com/package/iotjs-express)
[![IRC Channel](https://img.shields.io/badge/chat-on%20freenode-brightgreen.svg)](https://kiwiirc.com/client/irc.freenode.net/#tizen)

[![NPM](https://nodei.co/npm/iotjs-express.png)](https://npmjs.org/package/iotjs-express)


## INTRODUCTION: ##

While ExpressJs claims to be minimalist,
many dependencies are required and thus can't support IoT.js runtime
(powered by JerryScript an alternative engine for MicroControllers).

Instead of porting the whole project to older ECMA standards, 
basic routing was re-implemented, and API tried to be preserved.

Originally this module was done for "webthing-iotjs" project,
a library to build webthings to connect to Mozilla's IoT gateway.

Source file was bundled into project, but then pulled out as this standalone module,
which can be used by both runtime Node.Js and IoT.js.

[![Presentation](https://image.slidesharecdn.com/webthing-iotjs-20181022rzr-181027220201/95/webthingiotjs20181027rzr-17-638.jpg)](https://www.slideshare.net/rzrfreefr/webthingiotjs20181022rzr-120959360/# "WebThingIotJs")


## USAGE USING IOTJS: ##

```sh
mkdir iotjs_modules
git clone https://github.com/SamsungInternet/iotjs-express iotjs_modules/iotjs-express
cd iotjs_modules/iotjs-express
iotjs example &

curl -i http://localhost:8888/.well-known/security.txt
#| HTTP/1.1 200 OK
#| access-control-allow-origin: *
#| access-control-allow-headers: Origin, X-Requested-With, Content-Type, Accept
#| access-control-allow-methods: GET, HEAD, PUT, POST, DELETE
#| 
#| Contact: https://www.npmjs.com/~rzr

curl -i http://localhost:8888/favicon.ico
#| HTTP/1.1 404 Not Found
#| content-length: 23
#| Error: 404 (Not Found)

curl -i http://localhost:8888/~rzr
#| {"user":"rzr"}

curl -X PUT -d '{"value":42}' http://localhost:8888/db/some-key
#| {"some-key":42}

curl -X PUT -d '{"value":1984}' http://localhost:8888/db/some-other-key
#| {"some-key":42,"some-other-key":1984}

```

[![iotjs_modules](https://image.slidesharecdn.com/webthing-iotjs-tizenrt-cdl2018-20181117rzr-181118110813/95/webthingiotjstizenrtcdl201820181117rzr-24-638.jpg)](https://www.slideshare.net/rzrfreefr/webthingiotjstizenrtcdl201820181117rzr/24 "iotjs_modules")


## USAGE USING NODE: ##

It's mostly the same:

```sh
npm install iotjs_express
cd node_modules/iotjs-express
npm start
# Or:
node example
```


## DEMO: ##

In "webthing-iotjs-20180621rzr" video,
Edison's run a webthing server powered by iotjs-express framework to build routes,
(it relies on IoT.js's http module, API is aligned to node)

[![webthing-iotjs-20180621rzr](https://camo.githubusercontent.com/8892251f72dae9fa1c508da8abc33cbc2f6a0e75/68747470733a2f2f732d6f70656e736f757263652e6f72672f77702d636f6e74656e742f75706c6f6164732f323031382f30362f7765627468696e672d696f746a732d3230313830363231727a722e676966#webthing-iotjs-20180621rzr.gif)](https://www.slideshare.net/rzrfreefr/webthingiotjs20181022rzr-120959360/41#webthing-iotjs-20180621rzr "Demo")

* https://player.vimeo.com/video/276279690#webthing-iotjs-20180621rzr

Demo also shows following systems:

* Edison: iotjs-express + webthing-iotjs on Jubilinux (Debian fork).
* RaspberryPi: mozilla-iot-gateway + express.js on Raspbian
* Galaxy note: SamsungInternet web browser for Android.


## RESOURCES: ##

* http://expressjs.com/
* https://www.npmjs.com/package/express
* https://en.wikipedia.org/wiki/Express.js
* https://iotjs.net
* https://github.com/rzr/webthing-iotjs/wiki/IotJs
* https://github.com/pando-project/iotjs/blob/master/docs/api/IoT.js-API-HTTP.md
* https://github.com/Samsung/iotjs-modules
* https://nodejs.org/api/http.html
* https://tools.ietf.org/html/rfc2616
* https://en.wikipedia.org/wiki/Representational_state_transfer
* https://github.com/rzr/webthing-iotjs/wiki
* https://libraries.io/npm/iotjs-express
* https://github.com/pando-project/iotjs-modules/pull/16# (Merged)
