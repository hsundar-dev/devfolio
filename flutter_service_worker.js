'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"assets/FontManifest.json": "941482facfebf9b5d772de485e67e8f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "825e75415ebd366b740bb49659d7a5c6",
"assets/packages/hugeicons/lib/fonts/hugeicons-stroke-rounded.ttf": "ed1746fbad500fea94f6e5c5eb97ed7d",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "4769f3245a24c1fa9965f113ea85ec2a",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "3ca5dc7621921b901d513cc1ce23788c",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "32a15f7713f52ace70814eec9f775ec2",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/assets/images/profile.png": "d834d7ff2ae59c1bdba67c2565d29753",
"assets/assets/images/wakatime.png": "8ecd87f2c406919fc04a244c37cd2f78",
"assets/assets/images/Signature.png": "90489f05acdd5ee0ef42b5e33cc236f6",
"assets/assets/images/background.png": "2ef654ef5b80b82ed624ce90c775c3da",
"assets/assets/icons/dart.png": "1ab71d33e7ba834836197b4fa8726da0",
"assets/assets/icons/flutter.png": "1105c9a994c1a6638daed558d5b631fd",
"assets/assets/icons/twitter.svg": "a4a0163fef48a4247a305528c07bc4fa",
"assets/assets/icons/bloc.png": "977fbfba561065f9a68c4b47f9774531",
"assets/assets/icons/firebase.png": "36170822afe4c716cfbdb96dac8cd10e",
"assets/assets/icons/check.svg": "4220c82511cc1dfb40b8bba7d25c5f55",
"assets/assets/icons/linkedin.svg": "5b2195ddf9e879047dd8a163c4194920",
"assets/assets/icons/download.svg": "628700a3031424d215a441fab2da1731",
"assets/assets/icons/behance.svg": "35ad2d47e647d0b168e7707b2984c6b5",
"assets/assets/icons/github.svg": "9226aa209923e38c0a6ddcb236e2bc68",
"assets/assets/icons/dribble.svg": "d392567c5678d42472d2c7b766268101",
"assets/assets/logos/js.png": "9335814a2a4989f0f9888a11e46cb293",
"assets/assets/logos/mysql.png": "19700a30d7a0bb74337f6d3f7cdceccd",
"assets/assets/logos/c.png": "6479e59b457bd85f7e777bae3240e928",
"assets/assets/logos/flutter.png": "11730d08fa60e5d497c6827f65288e85",
"assets/assets/logos/vscode.png": "99a81d9e28f7128cb6c4116c649e3c60",
"assets/assets/logos/google_cloud.png": "32c760630c3a130a680e7bb6c47ec806",
"assets/assets/logos/html.png": "19b4a0aa5fbe88bd09b7fba7766059f5",
"assets/assets/logos/php.png": "588eb7216afa74efa1aff33c057f1ef4",
"assets/assets/logos/java.png": "d895b7834dda35ec3cfb1a0b877bb9c8",
"assets/assets/logos/mongodb.png": "4775e7d2413145b3a145de9fd7310eda",
"assets/assets/logos/css.png": "f106950cc79041ada8fd3b143f47fd75",
"assets/assets/logos/python.png": "72b1654c58e03fc8da233d2afc82a555",
"assets/assets/logos/canva.png": "57fb7ea3dbad58872fd6ded3d87001ab",
"assets/assets/logos/figma.png": "10e6aa3f57e7cd02cd2ce557fdfd2995",
"assets/assets/logos/getnames.py": "49f3a4bb379d1a4088cb5d667856d3b3",
"assets/assets/logos/android_studio.png": "72ded9c9494a1d2ec02b9fd6e62d6d8f",
"assets/assets/projects/cag.png": "c2845fbb77189ac110880a141a6abd23",
"assets/assets/projects/lms.png": "2e38cb73935355f56534bc0c5f868eae",
"assets/assets/projects/mobizync.png": "0a86915c6ec5e93e88aae3503cbb722a",
"assets/assets/projects/innohive.png": "27e7db39c686644870c03be92a569b6c",
"assets/assets/projects/hfm.png": "e21c54b58c09325fb26f6ffea9e2b5d6",
"assets/assets/projects/brahmastra.png": "4e2a1777ea0c7eccd5a4fd3f3f8736ad",
"assets/assets/projects/studev.png": "0e4218fff32d4d0322f99e0781271e6a",
"assets/AssetManifest.bin.json": "190463f6e5988dea6eedf1c5633dd2ed",
"assets/fonts/Zain-Regular.ttf": "effcaaec7266498f24d53e9d1ada0577",
"assets/fonts/Zain-Italic.ttf": "66e27c68ffd0b240d68e2a3d80dba060",
"assets/fonts/Zain-Bold.ttf": "17d1e3938d44350edba395f89f3bda50",
"assets/fonts/MaterialIcons-Regular.otf": "fa47ed636ad5b6e9cfab377f971c36db",
"assets/AssetManifest.bin": "a116876bde8d8bb7f83a2cb10feba678",
"assets/NOTICES": "6493db31a5733adb3ba395fa9e258e18",
"assets/AssetManifest.json": "be5569a74dcbce92c0c49b85b89d5f01",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"flutter_bootstrap.js": "53d33980750e75027dfc979dfbf91256",
"canvaskit/skwasm.wasm": "1c93738510f202d9ff44d36a4760126b",
"canvaskit/skwasm.js.symbols": "9fe690d47b904d72c7d020bd303adf16",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "f7c5e5502d577306fb6d530b1864ff86",
"canvaskit/chromium/canvaskit.wasm": "c054c2c892172308ca5a0bd1d7a7754b",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "27361387bc24144b46a745f1afe92b50",
"canvaskit/canvaskit.wasm": "a37f2b0af4995714de856e21e882325c",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"index.html": "470eab9e7a17cbdf95828ff0b59959a9",
"/": "470eab9e7a17cbdf95828ff0b59959a9",
"main.dart.js": "6b4bfa2be8b86ee699d28c5fd44a1218",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "6521a7b3e06497e532045d20fd46abab",
"version.json": "ac7d57fe31a91f73b206e297d700b7c5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
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
