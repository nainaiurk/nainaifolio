'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "3c734a8be0bcfe85a9e283127df12723",
".git/config": "aa24a1d52c0a67c2dd20006ff3991f67",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "a482fbaa34dd703596c8565bde93722b",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "6cf4a8796f018dc9528f8432b6a62cbf",
".git/logs/refs/heads/main": "f8c55ff3a99ec255cd915e643867cc7c",
".git/logs/refs/remotes/origin/main": "104e3a748cc7a70b09a43bb62330f3a1",
".git/objects/06/10d8ff62262f492f65e262646bbdff50e39b9f": "6270024dbf660fca23fb3e67cdeb38db",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/1f/558838e96e7d263fa820ed63d3580686493fec": "31eea62fd1ebb01ffda863b014d89fb8",
".git/objects/25/3ba5faefc7ad49977975a5e0030359b4b2e6a4": "e68ceedf204b0f9cf896b715ba9ef041",
".git/objects/30/2e5ab524db4931dd0184001d8cbcb10389a3f4": "9ca39e9802fe450af45b6bb9f4e67d16",
".git/objects/32/86f64447c1f1986f67fee2145de3189108a36b": "eb5e1b8f9ecc8dc00fa042a5383c04f2",
".git/objects/37/00761c19bd7cd81787e8e5a11b10f3ba81d400": "7d6220630f9ad9008ffa0a93278f0e70",
".git/objects/37/ca61a1bba0fa6f3a01645899c366550a99c6f8": "28038b903d8b7220e1f396b452b0fb43",
".git/objects/3e/dd0cfa232782039b7ebe3207c42d77089e99be": "b15db754de39dc144bc05b16e1b77af9",
".git/objects/40/33587556da7927c0a306d04bca9df4b2bea6fa": "5c98f5be756f5465985f4bcb81c514c4",
".git/objects/4a/39079e580dc9be820cba2fae41238c49eaa798": "ada1a19fea32fbb6719120809b9eae60",
".git/objects/4c/3ce8ac6cda5b4fa6ee0f756e8677096a0d1179": "4cdfeaf63ceea75e27206d192c83492f",
".git/objects/4e/9fda0b3776baf74ac570b574d8235cfb95af88": "3359c9f7eec9d28de6b57252d7712e49",
".git/objects/58/bdf029435397f37f7b31d557c7084a933609ca": "9e9582a0a8bb5eac5c63951d01a246e5",
".git/objects/59/62a92b6dbfe10031152c56f8d6e95ef6fefd9c": "0d7225ccf0016f64fb950dbcb3f0f645",
".git/objects/66/5cd47c90cface3cca519c3ab930e62c4dafba4": "48ad90bb3211289b98480e011915454e",
".git/objects/68/be5524817c84284dca06c9dbb8046c97d19bb4": "65ee4b071ef1f91302fd57d47a3a6b66",
".git/objects/75/d25e36e20a89621d97224753a69a7f8adca8c5": "85eea0c4de4feb80d33078ce5f221098",
".git/objects/7e/cbd9f645dbd186bbde77ad886b087b88632e72": "95a8da9e85b5c262195b9cf8894506f7",
".git/objects/7e/d694601da5561c41ebe8cb3343f84299bdb641": "a62d9499f562d99d7cf8351a1f13e6c0",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/5e220a1799765801905b9d5837e89669a9939e": "720293a14c42a79d35efbc60f8c4f877",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/786d1394a798bdeba47901e8d919791d5fd170": "7ad8abaabe6302cea9b51d1e1d8e0e0e",
".git/objects/90/aac534bb28e3e374c6b638c3a06b7217592003": "ac8559ef9418310f784df77cb2f7e984",
".git/objects/96/cdddb2d530ade7ecc0399b55101359b4e1981f": "3710a33fbbd281f0310d9dd79a7ca5d0",
".git/objects/97/9840225689bdf8267ad8c86fe76242150bb9e2": "c48a80b01de002cea0abf1a050d915d1",
".git/objects/a2/7f839bb4f775235d2d3eba12f02ed0dfda1f63": "c9dd31550e50a801f981bc2fb22485b6",
".git/objects/a2/d904b44db3c0355d1cec87f6b9a8c0f39bedc4": "f6d26f69b4f3d2335a7652f86ed08783",
".git/objects/a6/0960934f26f26f9c0829b52de4ae74be0b4c86": "ae3f6b8b812af9bb848beb9198f60d86",
".git/objects/ae/5daf8c5072bae92dd0243fcda67a2c05207e5d": "6a3195e68eb78d82d6171851e1b1152e",
".git/objects/b0/f29a6d92dcf5f5f1dbbdd0de33d8ef791a7ec5": "df8ab7ef9a75a1684522939d959550dc",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/d1555d764b35f2e672354a616d0b2ae6095546": "e20dd1db384bf39eef2a48b27ebbc56d",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/c1/3f10618e400869c31ef49afb0fe0a040a7b36c": "9f4c94342c22625c60d28763d7ef3ae1",
".git/objects/d3/0c187d3415326afb4b056fe9eedd2bae0e4ba4": "b29143168deea70232e363f691ee2ea6",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/dc/751db00dc171fc19737d9da800d7a583bb2c6d": "9d5844467b51c186be2a5a867694bbd5",
".git/objects/e2/ea63f177cf471a3a0e6ca3a0bded3cda95538d": "096f6cabcdebdcb55edba3650c7c6302",
".git/objects/e9/85853ed84acf10f62f639a4733083229c5a55d": "0fa4c11ffb67d2134def6bc8d43a77d3",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/ae21eb689cda1c1a7b7b1a69277b3c01112a4c": "9307c845ec84bf72ce97a1c506cf9cff",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/494e93f41dbf1032084ea774c8835e319f08a0": "715e37cad7f7bb420745672490258d07",
".git/objects/f6/1c2fed82cc6b1e2b6ead0368ee1e901a716773": "60b746e060601f3110f1022c31d3d5d3",
".git/objects/f6/c57aa482d502c9f8ed1a67a14584ca55a9cabe": "5d0b5fe4c9cf1f4f8d0a10982a6b0f25",
".git/refs/heads/main": "e6f1c4be5230fa9a001bcee4a3ac1377",
".git/refs/remotes/origin/main": "e6f1c4be5230fa9a001bcee4a3ac1377",
".vercel/project.json": "2654de4a5451617053e788ccfc42e022",
".vercel/README.txt": "2b13c79d37d6ed82a3255b83b6815034",
"assets/AssetManifest.bin": "d257bf9b370b33980303bc1cf6068c4e",
"assets/AssetManifest.bin.json": "2d3fa3e25c2eca6414b6b74a8c6f170e",
"assets/AssetManifest.json": "da97a9fd4cc9727e5a3ea768f06d4ffc",
"assets/assets/cv.pdf": "65bf48655d5c9a00ef586120fe8dbd85",
"assets/assets/fonts/Lora-Bold.ttf": "a487e58050c7a815e9e5cc2d70a8f3ae",
"assets/assets/fonts/Lora-Regular.ttf": "7637dfac7457920e0367967d608ee3a8",
"assets/assets/fonts/Merriweather-Bold.ttf": "e4a089e69d9fb17af0b6b3390850468b",
"assets/assets/fonts/Merriweather-Regular.ttf": "f417c6ecc22331e14cdc511a148ae129",
"assets/assets/fonts/Montserrat-Bold.ttf": "c300fff4e4ae0ca994c58ac9f6639b19",
"assets/assets/fonts/Montserrat-Regular.ttf": "203d753a80557746c23ce95191fbf013",
"assets/assets/images/me.png": "637f305266bc98f486607244ce80c9fb",
"assets/FontManifest.json": "2270981627dfbed5f81526bc2750a237",
"assets/fonts/MaterialIcons-Regular.otf": "2c1544fc743fe405816cd004fa626076",
"assets/NOTICES": "72f1a943a677e48f7934172c45fc148d",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "bbc3a2d2265f7ff6bef4ba339a0ba4c9",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "dbf0a93d2b23d99b7af4b1a6ab94e122",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "4bc7849a5c7774cfa18e4bc2ef82404a",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "c86fbd9e7b17accae76e5ad116583dc4",
"canvaskit/canvaskit.js.symbols": "38cba9233b92472a36ff011dc21c2c9f",
"canvaskit/canvaskit.wasm": "3d2a2d663e8c5111ac61a46367f751ac",
"canvaskit/chromium/canvaskit.js": "43787ac5098c648979c27c13c6f804c3",
"canvaskit/chromium/canvaskit.js.symbols": "4525682ef039faeb11f24f37436dca06",
"canvaskit/chromium/canvaskit.wasm": "f5934e694f12929ed56a671617acd254",
"canvaskit/skwasm.js": "445e9e400085faead4493be2224d95aa",
"canvaskit/skwasm.js.symbols": "741d50ffba71f89345996b0aa8426af8",
"canvaskit/skwasm.wasm": "e42815763c5d05bba43f9d0337fa7d84",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "dc21ec87e89bff44ff65489e8ef48933",
"/": "dc21ec87e89bff44ff65489e8ef48933",
"main.dart.js": "24a0744c30384f24964d92a8a35fdd91",
"manifest.json": "0f74af58da6530f163d02347a127c5c1",
"README.md": "491fd19459230fd426c7386b370a218f",
"version.json": "256e54cb78fae2b57acd16b5f8aad165"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
