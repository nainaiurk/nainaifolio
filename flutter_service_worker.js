'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "f196405405d7eda54397f89cba929fd9",
".git/config": "aa24a1d52c0a67c2dd20006ff3991f67",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/FETCH_HEAD": "70a423d4b93861ff4df0d322b58487e0",
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
".git/index": "20d73c6e060cc8f2fd6de0c16d8c463e",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "59ca15b86a7e0ca968da5d4abfa9cb22",
".git/logs/refs/heads/main": "c2e02f25087ec7d9b137faee18344b88",
".git/logs/refs/remotes/origin/HEAD": "d220fbc7451bbd2f932f2de921b530c2",
".git/logs/refs/remotes/origin/main": "d184d548b85a457b1a87549f5b87c807",
".git/objects/01/3c3e8eb5a268cb85d0066db78a54ce52d0361f": "e5dd4dbbd150d1764a2b3d666a7a666f",
".git/objects/03/1ae3df4a1a1ea4ee93e83c78aa37177f6b8dd9": "061462f8d35a1e7283f727e60390dc77",
".git/objects/06/10d8ff62262f492f65e262646bbdff50e39b9f": "6270024dbf660fca23fb3e67cdeb38db",
".git/objects/07/74c17c0fa7a7e87e24a6935830998d92b52c75": "cd62ee54b7ceea7b2a7804e69b1d9134",
".git/objects/0d/15a18e3c6c796f75924c14f08c0dc9d7b1d7b6": "736dcd95ec9dc50272728aeec6b00c24",
".git/objects/12/dae42f12e203b7a504b2625a5527dceb1478a2": "79318fa54259d71512d350485eb789c4",
".git/objects/15/5cc12bf8e99c5e9d5102239460109805e1ce0a": "caeefde8defee251704cefe429aab441",
".git/objects/15/eade91e70bf84dbc5a836abbad9dc24faf0044": "9ed8776363d25274cc911c61e762f92f",
".git/objects/16/5ce0ddf03a820a38f48cba9aa0c9df9b6e6b79": "71df17c95c3124eada62b59e7dabda78",
".git/objects/18/8a49fdc7ca2d6779345ed4aa811adc310200be": "213e68dd881ee0746be908e8d109daf6",
".git/objects/1a/6fa45234df3399509f859cff7f7abb70094b73": "885db675d4a7398d50544e6e9266cbe5",
".git/objects/1b/262653eaeb2c0ca4526da05519e9d87770c116": "6cc75edf3bf90b1a480595b17bdbf425",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/1f/558838e96e7d263fa820ed63d3580686493fec": "31eea62fd1ebb01ffda863b014d89fb8",
".git/objects/20/1afe538261bd7f9a38bed0524669398070d046": "82a4d6c731c1d8cdc48bce3ab3c11172",
".git/objects/21/4be08c44ef5f17de7b943121313d0b43928c8b": "dbd4594bfc53424fa33dd904c0c2e884",
".git/objects/21/8423d6b131f7dd798d6afcb319c3fcda28516c": "926f22233cf6e84c39bad9cab54e3bd9",
".git/objects/22/336deba69d01de6a203ba3189766dd8dfd1f0f": "9e9cdec5a11835fbb046a6e164d1c5e9",
".git/objects/25/1e7c17cefce745d582ae7712451bc1e4a39101": "7278cd0898cdd18ebea68f1631951fee",
".git/objects/25/293ac5fa4c80d154fc90253d33e56f11698a7c": "c49a259b12a73d6a6a7348dd9caa2114",
".git/objects/25/3ba5faefc7ad49977975a5e0030359b4b2e6a4": "e68ceedf204b0f9cf896b715ba9ef041",
".git/objects/29/9a1ced5538f9f8a34db58c856994d5b92a1089": "51287048a3ab62014534703cca89fc70",
".git/objects/30/2e5ab524db4931dd0184001d8cbcb10389a3f4": "9ca39e9802fe450af45b6bb9f4e67d16",
".git/objects/32/86f64447c1f1986f67fee2145de3189108a36b": "eb5e1b8f9ecc8dc00fa042a5383c04f2",
".git/objects/32/959af17a6244da760e6f6b09644034063c92cd": "31bd9e6b608056198225d01e777d8978",
".git/objects/34/deae83f56137da04b22b185ce456b628ecc839": "e159ed22cbbc29050c8002e36b2a007d",
".git/objects/37/00761c19bd7cd81787e8e5a11b10f3ba81d400": "7d6220630f9ad9008ffa0a93278f0e70",
".git/objects/37/ca61a1bba0fa6f3a01645899c366550a99c6f8": "28038b903d8b7220e1f396b452b0fb43",
".git/objects/3a/34e6fd7a87ea6bb9dfaa3efd8071862b022e5b": "185236b54ae6d3bb7efe8d32d04e43df",
".git/objects/3d/eeb9540b89bea08443e50f1eeed2fda3730ea2": "5c125f7e232ea63ffc639a2e85e8f658",
".git/objects/3e/dd0cfa232782039b7ebe3207c42d77089e99be": "b15db754de39dc144bc05b16e1b77af9",
".git/objects/40/33587556da7927c0a306d04bca9df4b2bea6fa": "5c98f5be756f5465985f4bcb81c514c4",
".git/objects/47/d125cb940b5e3fb406163eb89d3f54814d7daa": "2e2ca6dd6fc1355b81cf4df66c0c93c6",
".git/objects/48/c3b41bee3be1ebd6e3b47182cbcd9795a3dd0f": "92a1b008bb7ab445acc4826e42008f20",
".git/objects/4a/39079e580dc9be820cba2fae41238c49eaa798": "ada1a19fea32fbb6719120809b9eae60",
".git/objects/4c/3ce8ac6cda5b4fa6ee0f756e8677096a0d1179": "4cdfeaf63ceea75e27206d192c83492f",
".git/objects/4e/9fda0b3776baf74ac570b574d8235cfb95af88": "3359c9f7eec9d28de6b57252d7712e49",
".git/objects/4f/8cd448e56bab9f296a8f3973961e4fe16c9ada": "67ca974ac36ca6c66524ea218b50c3d3",
".git/objects/57/59fff1e8030c23af57c19f1fcd8f268d273502": "b58a46282eb76be1434a2caec839e70b",
".git/objects/58/bdf029435397f37f7b31d557c7084a933609ca": "9e9582a0a8bb5eac5c63951d01a246e5",
".git/objects/59/62a92b6dbfe10031152c56f8d6e95ef6fefd9c": "0d7225ccf0016f64fb950dbcb3f0f645",
".git/objects/5a/7b05e1be311772247124911182fda78fde2cec": "d38bfbb93663df272dc4920186bd1040",
".git/objects/5f/27c53b689050af69a5aa65ffdf396b0d73173d": "e7b214f20e98d73614fe1340842807b7",
".git/objects/60/1dd155544fd1db693253603eec484cd434c623": "108acc2766083b2af2722eb14dc65677",
".git/objects/60/573060dd9d12906c4189923adfd42b93694787": "0b33a88a4b302f9ff1bc94b29190358c",
".git/objects/65/49d23f57426ed774815701b175b98ea83055ff": "915b7b6728524c6998fe1831550feae3",
".git/objects/66/5cd47c90cface3cca519c3ab930e62c4dafba4": "48ad90bb3211289b98480e011915454e",
".git/objects/68/be5524817c84284dca06c9dbb8046c97d19bb4": "65ee4b071ef1f91302fd57d47a3a6b66",
".git/objects/6f/9cad4c116bc8d72e2497226abb5c05ee64982c": "0d104480d68c1652a53721377a02a882",
".git/objects/6f/dd377cad276e0f92b22f55cf27736d1ddb1426": "42026e60c88c3d3390fd5ec691660c5d",
".git/objects/70/dc589e0cb7c27a54dad9ee2c50a557d352d987": "d260bdc8b64181dfe65189b88243f4ee",
".git/objects/71/1b12156048958afa4b07755982c671010fb734": "7a7c8c039f4616e28494dfb47ca9257b",
".git/objects/71/7117947090611c3967f8681ab1ac0f79bca7fc": "ad4e74c0da46020e04043b5cf7f91098",
".git/objects/71/7809363ed19bdd7e1d78f6e421e40a96bc29e3": "9414a3044cb191cc3f57340f57c3dc93",
".git/objects/72/9dc9d7e225d48f6b4ad4da9d4d91598725a18d": "07b6a873ad00e9c0eb91dd84890f0f9f",
".git/objects/74/4da43c572b7b681d6dfe253a5cd383172d1422": "5639134348419baea32c70d159c96d40",
".git/objects/75/d25e36e20a89621d97224753a69a7f8adca8c5": "85eea0c4de4feb80d33078ce5f221098",
".git/objects/76/823dee26abffe3b551263844dd006435dc6989": "7e0e34d6eb1ca6aa79799a68ad6a03c4",
".git/objects/77/2873737d614d4041443eb8e8dcb984e3a4a2bc": "06049531444b2ee4fd4c3cb13c27baf4",
".git/objects/7e/cbd9f645dbd186bbde77ad886b087b88632e72": "95a8da9e85b5c262195b9cf8894506f7",
".git/objects/7e/d694601da5561c41ebe8cb3343f84299bdb641": "a62d9499f562d99d7cf8351a1f13e6c0",
".git/objects/81/4997d5cb0f1008c0d61e78c8de9160906b3831": "3bfde1dc1a9288ea2830e22f98464dc6",
".git/objects/81/742ce587d8bc19dd3ca33800af6da2b0566559": "a60768450caf654bf02ca43170aa84f6",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/86/8201ba89b428f3b19d6b789dace2b2e5a003aa": "5ce5181a01a0de940f797c14a67adfb0",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/5e220a1799765801905b9d5837e89669a9939e": "720293a14c42a79d35efbc60f8c4f877",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/786d1394a798bdeba47901e8d919791d5fd170": "7ad8abaabe6302cea9b51d1e1d8e0e0e",
".git/objects/8b/9f902f8d00fbaafc6490bad2653b57a7d48a5c": "451625b402cfcbfa2c00e537061a1513",
".git/objects/8b/fbd70684055d618b4a47e0d90677f06a7605ea": "37b24982d21dac58c3de17167fd6342c",
".git/objects/8c/4eb70292fdecbf99433486d513a27aee95347d": "56759a88705f6bddb847a7bbb576c623",
".git/objects/90/7da8980201acb3322a14be95fb99e5f1df73ed": "e066787c818f3966faeb4c1066248e3d",
".git/objects/90/aac534bb28e3e374c6b638c3a06b7217592003": "ac8559ef9418310f784df77cb2f7e984",
".git/objects/92/62ab21adb05ddc49039291bad109cffa86892b": "23171f8fd4571519f438bdae2c0b6ce6",
".git/objects/94/bfb1463ad8331bfd687bc751b8920b133da744": "fd2d8c0d844b234856b36b93f652048f",
".git/objects/95/45a89d8968ec05cc6eeca3d4cd298af022f76d": "90c23c3ebf2475333baa899e49e7f4e4",
".git/objects/95/9d57a9c3a207590c23124ac929c9df180e9091": "0ad2f14602fc8dc3987233594b01c2d9",
".git/objects/96/cdddb2d530ade7ecc0399b55101359b4e1981f": "3710a33fbbd281f0310d9dd79a7ca5d0",
".git/objects/97/9840225689bdf8267ad8c86fe76242150bb9e2": "c48a80b01de002cea0abf1a050d915d1",
".git/objects/97/b9e83430cea5f6f496b506d32e4ae03db170c7": "c6508c2ad2cb6d2cdcb75ddd59577407",
".git/objects/9c/86729e98a3adcd3707f851a68358fe47fa024c": "5a2ccdc9bf747819695be75dae4603ef",
".git/objects/9d/a038e4fa0e869f98f4ffa860a1a111b359d596": "9bcf217e7a56c1dced2549e96ff38c45",
".git/objects/a0/46fbb657247909bfd2377803e21dec54dd53ad": "218f1961d3b18eaf6a8e03014acd6bea",
".git/objects/a2/7f839bb4f775235d2d3eba12f02ed0dfda1f63": "c9dd31550e50a801f981bc2fb22485b6",
".git/objects/a2/c327f6d65e15e1a8ad84f6a00af8a7f5a4e8cb": "6b7c9dcd09f21a4c748ed30d01761ba2",
".git/objects/a2/d904b44db3c0355d1cec87f6b9a8c0f39bedc4": "f6d26f69b4f3d2335a7652f86ed08783",
".git/objects/a6/0960934f26f26f9c0829b52de4ae74be0b4c86": "ae3f6b8b812af9bb848beb9198f60d86",
".git/objects/a8/f3fff7c49cf1b1054f2caa7bd5363071580253": "b48b6aeeede4bfd695d6507f2532730e",
".git/objects/a9/067cdb8d2710d5bb933cdc4f750bae6dfb0219": "9b5c64329d93ea1c9496f2a09838f3b5",
".git/objects/ac/c179d61671cf351c2d25e1c1d0b62eeda1022b": "c688c541619b3412257544d22185f899",
".git/objects/ae/5daf8c5072bae92dd0243fcda67a2c05207e5d": "6a3195e68eb78d82d6171851e1b1152e",
".git/objects/af/2fe7657994e74c3925570517b08fa7094bc09b": "f000bea92a7fc8401468cd409d5cc3e7",
".git/objects/af/742adee0a85dd21ea96cbd84182e30e085d6cf": "aa25b932ec40efacb1efe27e7cf25d82",
".git/objects/b0/71c6e2558120e4d375b688a2f2249ae0becc3b": "ac25df541427320072a595676c2aa33c",
".git/objects/b0/f29a6d92dcf5f5f1dbbdd0de33d8ef791a7ec5": "df8ab7ef9a75a1684522939d959550dc",
".git/objects/b5/0254288cc6319d153c4af1d64870d95ee2436f": "468a6506934a07c970a4739eae75eedd",
".git/objects/b6/d1ca6b224b2a647cb034eb0efe56e5c178de08": "fedc2b3a876b828c1bf86b2f182d4980",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b7/d1555d764b35f2e672354a616d0b2ae6095546": "e20dd1db384bf39eef2a48b27ebbc56d",
".git/objects/b8/16a7fc1f0de83311a1a6f01557ea7b3258586e": "ceb94e4587bd99f53b303d224cf06e7b",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/ba/d6a92663a0e1076e56b22bccb1a2235aff9dfa": "db58ceaf03d531133e4a9f1b1f8ffb61",
".git/objects/bb/78310397f165f01842094eaeae3ecdcb4778fa": "d56839414e0e2071eb833726aac921f6",
".git/objects/bb/bc9b8d5a2732e8c2540ef2d9103013ee7e6bae": "64476e952bec15114e29eeb47bf5cac1",
".git/objects/be/352e2330000d68b4097b0bfe1fc764e8b70564": "8290de30aa80e7d6c43a4cc9d53c27f3",
".git/objects/c1/3f10618e400869c31ef49afb0fe0a040a7b36c": "9f4c94342c22625c60d28763d7ef3ae1",
".git/objects/c1/d790028ea8966daaaca8efbd00c0e880b6b58d": "bde60033f03d750c802a287b20f4d539",
".git/objects/c3/10d76623b05401027a3dfc24acd42749ed87fe": "fd091416dcb856a043b62306017f5818",
".git/objects/c5/f4bc2a4da91586f3005813077f0d0aa9040f82": "3191028b787554cee4652f5050144bff",
".git/objects/c9/689e2d523553985e82782edf0458ef9e891b07": "5a403362770a41d0ee9d83847cafeff0",
".git/objects/cd/31f500d79e49ff3d93e040eeafa29ac105aca0": "df7d691f2f8f19d4f58fc258e883e501",
".git/objects/d0/e494cb7960231058be7d8f27e251e6e6488228": "7dc22f35018618d8e28c7d3a558685e9",
".git/objects/d1/fd4a76d4adba62c6a575057651b896e89cae48": "b334bd0fd9ea84ffa1d2be5514025540",
".git/objects/d3/0c187d3415326afb4b056fe9eedd2bae0e4ba4": "b29143168deea70232e363f691ee2ea6",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/0d3777e92358afb1651db187acdf74f8bef9dc": "946ead68bb3d2435c761c06256d9ccd3",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d8/a575b786d24d7ecd3507d3b5d952c839df035f": "9c4f31879dbd8ebc5655ee9c8d581853",
".git/objects/db/33b0df3a75b72dd24225bd3b84df2dd61948e9": "992a9c61b663e9f44fb12b4622a2b2c8",
".git/objects/dc/751db00dc171fc19737d9da800d7a583bb2c6d": "9d5844467b51c186be2a5a867694bbd5",
".git/objects/dd/778ca71cda2f1c53fd395818aab4a7ff124cff": "b0cfea7366471cf4ff2ded0a4df33b33",
".git/objects/e2/ea63f177cf471a3a0e6ca3a0bded3cda95538d": "096f6cabcdebdcb55edba3650c7c6302",
".git/objects/e4/2e366fdb298e50a1c6cc4632a024e7ea09db24": "be281c78c8f7102d1bfa6b619cffc1a3",
".git/objects/e6/47399dd1e0e7610607fc0e8d805f116f80cf9d": "1b80acb83fca82cbae7407d41c7d5fe8",
".git/objects/e8/2c5850db3a3482d0c954a4dc122c02de555ce7": "d357cd906b3805bf81477f5527cca086",
".git/objects/e9/85853ed84acf10f62f639a4733083229c5a55d": "0fa4c11ffb67d2134def6bc8d43a77d3",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/ae21eb689cda1c1a7b7b1a69277b3c01112a4c": "9307c845ec84bf72ce97a1c506cf9cff",
".git/objects/f0/b5371916c824b5e537b81bec29680b0a473f7f": "1213686d7fb8983d05cbe2ae16530e2c",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/494e93f41dbf1032084ea774c8835e319f08a0": "715e37cad7f7bb420745672490258d07",
".git/objects/f5/52e50a1679bb9c6e2e4bd6ff50775578ad89f3": "7252c6aaa6ed6aebce4efd5f9568c8d3",
".git/objects/f6/1c2fed82cc6b1e2b6ead0368ee1e901a716773": "60b746e060601f3110f1022c31d3d5d3",
".git/objects/f6/c57aa482d502c9f8ed1a67a14584ca55a9cabe": "5d0b5fe4c9cf1f4f8d0a10982a6b0f25",
".git/ORIG_HEAD": "79582534a7e0eac45f659a238a3ca79f",
".git/refs/heads/main": "d272c8cc58237ae7624ccd167e650242",
".git/refs/remotes/origin/HEAD": "98b16e0b650190870f1b40bc8f4aec4e",
".git/refs/remotes/origin/main": "d272c8cc58237ae7624ccd167e650242",
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
"assets/assets/images/me.png": "acb67b40a3c9541f925134eada1f9e6b",
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
"CNAME": "2f5c94dc00c3b12ae3c56d591b88259c",
"favicon.png": "acb67b40a3c9541f925134eada1f9e6b",
"flutter.js": "c71a09214cb6f5f8996a531350400a9a",
"googlead08fffea20c2599.html": "57bcb040d13e75c3d3db575e667d8b9b",
"icons/Icon-192.png": "637f305266bc98f486607244ce80c9fb",
"icons/Icon-512.png": "637f305266bc98f486607244ce80c9fb",
"icons/Icon-maskable-192.png": "637f305266bc98f486607244ce80c9fb",
"icons/Icon-maskable-512.png": "637f305266bc98f486607244ce80c9fb",
"index.html": "c604d89fc316876346602cdb9d77edf0",
"/": "c604d89fc316876346602cdb9d77edf0",
"main.dart.js": "51e8859bc0cdc30ba0fdbe6ce3fd0d52",
"manifest.json": "c92737709708be5e8397274c869949a0",
"README.md": "491fd19459230fd426c7386b370a218f",
"robots.txt": "695ad27845a9b5e029283b3b3b605ba7",
"sitemap.xml": "42d34fc08bbc7003edbbba0f3f5b5255",
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
