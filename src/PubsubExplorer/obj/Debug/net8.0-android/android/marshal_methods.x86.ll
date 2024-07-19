; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [407 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [808 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 7993866, ; 1: sr\Humanizer.resources.dll => 0x79fa0a => 357
	i32 10166715, ; 2: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 3: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 278
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 312
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 38948123, ; 7: ar\Microsoft.Maui.Controls.resources.dll => 0x2524d1b => 369
	i32 39109920, ; 8: Newtonsoft.Json.dll => 0x254c520 => 233
	i32 39485524, ; 9: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42244203, ; 10: he\Microsoft.Maui.Controls.resources.dll => 0x284986b => 378
	i32 42639949, ; 11: System.Threading.Thread => 0x28aa24d => 145
	i32 46183200, ; 12: sr\Humanizer.resources => 0x2c0b320 => 357
	i32 66541672, ; 13: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 14: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 402
	i32 68219467, ; 15: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 16: Microsoft.Maui.Graphics.dll => 0x44bb714 => 231
	i32 82292897, ; 17: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 83839681, ; 18: ms\Microsoft.Maui.Controls.resources.dll => 0x4ff4ac1 => 386
	i32 83984350, ; 19: es\Humanizer.resources => 0x5017fde => 330
	i32 101534019, ; 20: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 296
	i32 105299934, ; 21: Google.Cloud.PubSub.V1 => 0x646bfde => 185
	i32 117431740, ; 22: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 23: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 296
	i32 122350210, ; 24: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 25: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 316
	i32 136584136, ; 26: zh-Hans\Microsoft.Maui.Controls.resources.dll => 0x8241bc8 => 401
	i32 140062828, ; 27: sk\Microsoft.Maui.Controls.resources.dll => 0x859306c => 394
	i32 142721839, ; 28: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 29: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 30: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 31: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 252
	i32 176265551, ; 32: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 33: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 298
	i32 184328833, ; 34: System.ValueTuple.dll => 0xafca281 => 151
	i32 204929344, ; 35: ro\Humanizer.resources.dll => 0xc36f940 => 353
	i32 205061960, ; 36: System.ComponentModel => 0xc38ff48 => 18
	i32 206852659, ; 37: zh-CN\Humanizer.resources.dll => 0xc545233 => 366
	i32 209399409, ; 38: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 250
	i32 220171995, ; 39: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 40: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 272
	i32 230752869, ; 41: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 42: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 43: System.Globalization => 0xdd133ce => 42
	i32 235627408, ; 44: es\Humanizer.resources.dll => 0xe0b6390 => 330
	i32 246610117, ; 45: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 252082998, ; 46: fi-FI\Humanizer.resources.dll => 0xf067b36 => 332
	i32 254259026, ; 47: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 196
	i32 261689757, ; 48: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 255
	i32 275679612, ; 49: Humanizer => 0x106e897c => 192
	i32 276479776, ; 50: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 51: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 274
	i32 280482487, ; 52: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 271
	i32 287056530, ; 53: ko-KR\Humanizer.resources.dll => 0x111c2292 => 343
	i32 289313981, ; 54: he\Humanizer.resources => 0x113e94bd => 335
	i32 291076382, ; 55: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 56: System.Net.Ping.dll => 0x11d123fd => 69
	i32 311843456, ; 57: da\Humanizer.resources.dll => 0x12965a80 => 327
	i32 317674968, ; 58: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 399
	i32 318968648, ; 59: Xamarin.AndroidX.Activity.dll => 0x13031348 => 241
	i32 321597661, ; 60: System.Numerics => 0x132b30dd => 83
	i32 321963286, ; 61: fr\Microsoft.Maui.Controls.resources.dll => 0x1330c516 => 377
	i32 342366114, ; 62: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 273
	i32 347676595, ; 63: hy\Humanizer.resources => 0x14b91fb3 => 338
	i32 360082299, ; 64: System.ServiceModel.Web => 0x15766b7b => 131
	i32 364956269, ; 65: Grpc.Net.Common => 0x15c0ca6d => 191
	i32 367780167, ; 66: System.IO.Pipes => 0x15ebe147 => 55
	i32 371306672, ; 67: Grpc.Core.Api.dll => 0x1621b0b0 => 189
	i32 374914964, ; 68: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 69: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 70: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 71: System.Memory.dll => 0x16fe439a => 62
	i32 391886110, ; 72: Grpc.Net.Client.dll => 0x175bb51e => 190
	i32 392610295, ; 73: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 74: _Microsoft.Android.Resource.Designer => 0x17969339 => 403
	i32 403441872, ; 75: WindowsBase => 0x180c08d0 => 165
	i32 409257351, ; 76: tr\Microsoft.Maui.Controls.resources.dll => 0x1864c587 => 397
	i32 441335492, ; 77: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 256
	i32 442565967, ; 78: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 79: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 269
	i32 451504562, ; 80: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 81: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 82: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 83: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 84: System.dll => 0x1bff388e => 164
	i32 476646585, ; 85: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 271
	i32 486930444, ; 86: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 284
	i32 489220957, ; 87: es\Microsoft.Maui.Controls.resources.dll => 0x1d28eb5d => 375
	i32 498788369, ; 88: System.ObjectModel => 0x1dbae811 => 84
	i32 513247710, ; 89: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 224
	i32 515231018, ; 90: sr-Latn\Humanizer.resources => 0x1eb5cd2a => 358
	i32 526420162, ; 91: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 92: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 316
	i32 530272170, ; 93: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 538707440, ; 94: th\Microsoft.Maui.Controls.resources.dll => 0x201c05f0 => 396
	i32 539058512, ; 95: Microsoft.Extensions.Logging => 0x20216150 => 217
	i32 540030774, ; 96: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 97: System.Runtime.Extensions => 0x2080b118 => 103
	i32 545795345, ; 98: Microsoft.Extensions.Logging.Configuration.dll => 0x20882d11 => 219
	i32 546455878, ; 99: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 548916678, ; 100: Microsoft.Bcl.AsyncInterfaces => 0x20b7cdc6 => 202
	i32 549171840, ; 101: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 102: Jsr305Binding => 0x213954e7 => 309
	i32 569601784, ; 103: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 307
	i32 571435654, ; 104: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 212
	i32 577335427, ; 105: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 601371474, ; 106: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 107: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 613668793, ; 108: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 109: Xamarin.AndroidX.CustomView => 0x2568904f => 261
	i32 627931235, ; 110: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 388
	i32 639843206, ; 111: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 267
	i32 643868501, ; 112: System.Net => 0x2660a755 => 81
	i32 649338123, ; 113: de\Humanizer.resources => 0x26b41d0b => 328
	i32 660159802, ; 114: it\Humanizer.resources.dll => 0x27593d3a => 341
	i32 662205335, ; 115: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 116: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 303
	i32 666292255, ; 117: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 248
	i32 671889515, ; 118: hy\Humanizer.resources.dll => 0x280c386b => 338
	i32 672442732, ; 119: System.Collections.Concurrent => 0x2814a96c => 8
	i32 673765954, ; 120: ja\Humanizer.resources.dll => 0x2828da42 => 342
	i32 683518922, ; 121: System.Net.Security => 0x28bdabca => 73
	i32 683876966, ; 122: nl\Humanizer.resources.dll => 0x28c32266 => 350
	i32 690569205, ; 123: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 124: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 318
	i32 692151471, ; 125: Microsoft.Extensions.Logging.Console.dll => 0x294164af => 220
	i32 693804605, ; 126: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 127: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 128: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 313
	i32 700358131, ; 129: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 710618163, ; 130: Json.More => 0x2a5b2c33 => 193
	i32 717679319, ; 131: nl\Humanizer.resources => 0x2ac6ead7 => 350
	i32 720511267, ; 132: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 317
	i32 722857257, ; 133: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 731701662, ; 134: Microsoft.Extensions.Options.ConfigurationExtensions => 0x2b9ce19e => 223
	i32 735137430, ; 135: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 136: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 137: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 238
	i32 759454413, ; 138: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 139: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 773056463, ; 140: da\Humanizer.resources => 0x2e13e7cf => 327
	i32 775507847, ; 141: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 142: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 394
	i32 789151979, ; 143: Microsoft.Extensions.Options => 0x2f0980eb => 222
	i32 790371945, ; 144: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 262
	i32 804008546, ; 145: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 200
	i32 804715423, ; 146: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 147: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 276
	i32 809064393, ; 148: CodeBeam.MudBlazor.Extensions => 0x303957c9 => 176
	i32 823281589, ; 149: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 150: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 151: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 152: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 153: Xamarin.AndroidX.Print => 0x3246f6cd => 289
	i32 865465478, ; 154: zxing.dll => 0x3395f486 => 320
	i32 869139383, ; 155: hi\Microsoft.Maui.Controls.resources.dll => 0x33ce03b7 => 379
	i32 870817387, ; 156: th-TH\Humanizer.resources => 0x33e79e6b => 360
	i32 873119928, ; 157: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 158: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 159: System.Net.Http.Json => 0x3463c971 => 63
	i32 880668424, ; 160: ru\Microsoft.Maui.Controls.resources.dll => 0x347def08 => 393
	i32 887950070, ; 161: he\Humanizer.resources.dll => 0x34ed0af6 => 335
	i32 898440345, ; 162: CsvHelper => 0x358d1c99 => 177
	i32 904024072, ; 163: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 164: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 918734561, ; 165: pt-BR\Microsoft.Maui.Controls.resources.dll => 0x36c2c6e1 => 390
	i32 928116545, ; 166: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 312
	i32 948888637, ; 167: mt\Humanizer.resources.dll => 0x388ee43d => 347
	i32 952186615, ; 168: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 169: Newtonsoft.Json => 0x38f24a24 => 233
	i32 956575887, ; 170: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 317
	i32 961460050, ; 171: it\Microsoft.Maui.Controls.resources.dll => 0x394eb752 => 383
	i32 966729478, ; 172: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 310
	i32 967690846, ; 173: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 273
	i32 975236339, ; 174: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 175: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 176: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 177: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 990727110, ; 178: ro\Microsoft.Maui.Controls.resources.dll => 0x3b0d4bc6 => 392
	i32 992768348, ; 179: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 180: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 181: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 214
	i32 1001831731, ; 182: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 183: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 293
	i32 1019214401, ; 184: System.Drawing => 0x3cbffa41 => 36
	i32 1022129705, ; 185: fr\Humanizer.resources => 0x3cec7629 => 333
	i32 1028951442, ; 186: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 209
	i32 1031528504, ; 187: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 311
	i32 1035644815, ; 188: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 246
	i32 1036536393, ; 189: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1043950537, ; 190: de\Microsoft.Maui.Controls.resources.dll => 0x3e396bc9 => 373
	i32 1044663988, ; 191: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1049751285, ; 192: Google.Api.CommonProtos.dll => 0x3e91eef5 => 178
	i32 1052210849, ; 193: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 280
	i32 1067306892, ; 194: GoogleGson => 0x3f9dcf8c => 187
	i32 1073362791, ; 195: bg\Humanizer.resources.dll => 0x3ffa3767 => 324
	i32 1077869217, ; 196: Json.More.dll => 0x403efaa1 => 193
	i32 1082857460, ; 197: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 198: Xamarin.Kotlin.StdLib => 0x409e66d8 => 314
	i32 1098259244, ; 199: System => 0x41761b2c => 164
	i32 1106973742, ; 200: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 206
	i32 1108272742, ; 201: sv\Microsoft.Maui.Controls.resources.dll => 0x420ee666 => 395
	i32 1113498152, ; 202: de\Humanizer.resources.dll => 0x425ea228 => 328
	i32 1117529484, ; 203: pl\Microsoft.Maui.Controls.resources.dll => 0x429c258c => 389
	i32 1118262833, ; 204: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 385
	i32 1121599056, ; 205: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 279
	i32 1127624469, ; 206: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 221
	i32 1149092582, ; 207: Xamarin.AndroidX.Window => 0x447dc2e6 => 306
	i32 1168523401, ; 208: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 391
	i32 1170634674, ; 209: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 210: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 210
	i32 1175144683, ; 211: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 302
	i32 1178241025, ; 212: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 287
	i32 1203173028, ; 213: Grpc.Net.Client => 0x47b6f6a4 => 190
	i32 1204270330, ; 214: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 248
	i32 1205287066, ; 215: pt\Humanizer.resources.dll => 0x47d7389a => 352
	i32 1208641965, ; 216: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1210541641, ; 217: nb-NO\Humanizer.resources.dll => 0x48276649 => 349
	i32 1219128291, ; 218: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1243150071, ; 219: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 307
	i32 1253011324, ; 220: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 221: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 371
	i32 1264511973, ; 222: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 297
	i32 1267360935, ; 223: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 301
	i32 1273260888, ; 224: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 253
	i32 1275534314, ; 225: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 318
	i32 1278448581, ; 226: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 245
	i32 1293217323, ; 227: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 264
	i32 1302108338, ; 228: CloudNative.CloudEvents.dll => 0x4d9c98b2 => 174
	i32 1308624726, ; 229: hr\Microsoft.Maui.Controls.resources.dll => 0x4e000756 => 380
	i32 1309188875, ; 230: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1314676887, ; 231: af\Humanizer.resources => 0x4e5c6097 => 321
	i32 1322716291, ; 232: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 306
	i32 1324164729, ; 233: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 234: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1336711579, ; 235: zh-HK\Microsoft.Maui.Controls.resources.dll => 0x4fac999b => 400
	i32 1358651689, ; 236: cs\Humanizer.resources => 0x50fb6129 => 326
	i32 1364015309, ; 237: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 238: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 401
	i32 1376866003, ; 239: Xamarin.AndroidX.SavedState => 0x52114ed3 => 293
	i32 1377593304, ; 240: sk\Humanizer.resources => 0x521c67d8 => 355
	i32 1379779777, ; 241: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1392635248, ; 242: fi-FI\Humanizer.resources => 0x5301ed70 => 332
	i32 1402170036, ; 243: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 244: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 257
	i32 1408764838, ; 245: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 246: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 247: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 248: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 369
	i32 1434145427, ; 249: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 250: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 310
	i32 1436510490, ; 251: JsonPath.Net.dll => 0x559f691a => 194
	i32 1437713837, ; 252: Grpc.Auth => 0x55b1c5ad => 188
	i32 1439761251, ; 253: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1444091824, ; 254: Google.Cloud.Iam.V1.dll => 0x561317b0 => 184
	i32 1452070440, ; 255: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 256: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 257: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 211
	i32 1457743152, ; 258: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 259: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 260: es\Microsoft.Maui.Controls.resources => 0x57152abe => 375
	i32 1461234159, ; 261: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 262: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 263: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 264: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 247
	i32 1470490898, ; 265: Microsoft.Extensions.Primitives => 0x57a5e912 => 224
	i32 1479771757, ; 266: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 267: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 268: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 269: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 294
	i32 1507046254, ; 270: cs\Humanizer.resources.dll => 0x59d3b36e => 326
	i32 1521091094, ; 271: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 214
	i32 1526286932, ; 272: vi\Microsoft.Maui.Controls.resources.dll => 0x5af94a54 => 399
	i32 1536373174, ; 273: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1538374214, ; 274: ru\Humanizer.resources => 0x5bb1ba46 => 354
	i32 1541428564, ; 275: bn-BD\Humanizer.resources => 0x5be05554 => 325
	i32 1543031311, ; 276: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 277: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 278: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 200
	i32 1550322496, ; 279: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1563958912, ; 280: is\Humanizer.resources.dll => 0x5d381e80 => 340
	i32 1565862583, ; 281: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 282: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 283: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 284: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 285: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 263
	i32 1592978981, ; 286: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 287: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 311
	i32 1601112923, ; 288: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 289: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 290: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 291: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 283
	i32 1622358360, ; 292: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 293: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 305
	i32 1632842087, ; 294: Microsoft.Extensions.Configuration.Json => 0x61533167 => 207
	i32 1635184631, ; 295: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 267
	i32 1636350590, ; 296: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 260
	i32 1639515021, ; 297: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 298: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 299: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 300: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 199
	i32 1657153582, ; 301: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 302: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 299
	i32 1658251792, ; 303: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 308
	i32 1659836408, ; 304: vi\Humanizer.resources.dll => 0x62ef17f8 => 365
	i32 1670060433, ; 305: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 255
	i32 1675553242, ; 306: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 307: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 308: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 309: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 310: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 311: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 312: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 315
	i32 1701541528, ; 313: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 314: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 276
	i32 1726116996, ; 315: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 316: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 317: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 251
	i32 1743415430, ; 318: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 370
	i32 1744735666, ; 319: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 320: System.IO.Pipelines.dll => 0x68139a0d => 235
	i32 1746316138, ; 321: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 322: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 323: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 324: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 198
	i32 1762291890, ; 325: tr\Humanizer.resources.dll => 0x690a70b2 => 361
	i32 1763938596, ; 326: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 327: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 328: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 298
	i32 1766583818, ; 329: ms-MY\Humanizer.resources => 0x694bee0a => 346
	i32 1770582343, ; 330: Microsoft.Extensions.Logging.dll => 0x6988f147 => 217
	i32 1776026572, ; 331: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 332: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 333: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782161461, ; 334: Grpc.Core.Api => 0x6a39a035 => 189
	i32 1782862114, ; 335: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 386
	i32 1782870812, ; 336: PubsubExplorer => 0x6a44731c => 0
	i32 1788241197, ; 337: Xamarin.AndroidX.Fragment => 0x6a96652d => 269
	i32 1792549600, ; 338: fr-BE\Humanizer.resources => 0x6ad822e0 => 334
	i32 1793755602, ; 339: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 378
	i32 1796167890, ; 340: Microsoft.Bcl.AsyncInterfaces.dll => 0x6b0f58d2 => 202
	i32 1808609942, ; 341: Xamarin.AndroidX.Loader => 0x6bcd3296 => 283
	i32 1813058853, ; 342: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 314
	i32 1813201214, ; 343: Xamarin.Google.Android.Material => 0x6c13413e => 308
	i32 1818569960, ; 344: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 288
	i32 1818787751, ; 345: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 346: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 347: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 348: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 218
	i32 1847515442, ; 349: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 238
	i32 1853025655, ; 350: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 395
	i32 1858542181, ; 351: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 352: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 353: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 377
	i32 1879696579, ; 354: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1880706360, ; 355: Google.Cloud.PubSub.V1.dll => 0x70194d38 => 185
	i32 1885316902, ; 356: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 249
	i32 1888955245, ; 357: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 358: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1893218855, ; 359: cs\Microsoft.Maui.Controls.resources.dll => 0x70d83a27 => 371
	i32 1898237753, ; 360: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900519031, ; 361: Grpc.Auth.dll => 0x71479e77 => 188
	i32 1900610850, ; 362: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 363: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1927897671, ; 364: System.CodeDom.dll => 0x72e96247 => 234
	i32 1939592360, ; 365: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1953182387, ; 366: id\Microsoft.Maui.Controls.resources.dll => 0x746b32b3 => 382
	i32 1956758971, ; 367: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 368: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 295
	i32 1968388702, ; 369: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 203
	i32 1969929169, ; 370: ru\Humanizer.resources.dll => 0x756abbd1 => 354
	i32 1983156543, ; 371: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 315
	i32 1985761444, ; 372: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 240
	i32 2003115576, ; 373: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 374
	i32 2011961780, ; 374: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 375: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 280
	i32 2031763787, ; 376: Xamarin.Android.Glide => 0x791a414b => 237
	i32 2032926171, ; 377: zh-Hant\Humanizer.resources => 0x792bfddb => 368
	i32 2045470958, ; 378: System.Private.Xml => 0x79eb68ee => 88
	i32 2048278909, ; 379: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 205
	i32 2055257422, ; 380: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 275
	i32 2060060697, ; 381: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 382: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 373
	i32 2070352460, ; 383: bg\Humanizer.resources => 0x7b67124c => 324
	i32 2070888862, ; 384: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 385: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 213
	i32 2079903147, ; 386: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 387: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2119497010, ; 388: sl\Humanizer.resources.dll => 0x7e54f532 => 356
	i32 2127167465, ; 389: System.Console => 0x7ec9ffe9 => 20
	i32 2141344426, ; 390: ko-KR\Humanizer.resources => 0x7fa252aa => 343
	i32 2142473426, ; 391: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 392: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 393: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 394: Microsoft.Maui => 0x80bd55ad => 229
	i32 2169148018, ; 395: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 381
	i32 2178612968, ; 396: System.CodeDom => 0x81dafee8 => 234
	i32 2179122504, ; 397: fr-BE\Humanizer.resources.dll => 0x81e2c548 => 334
	i32 2181898931, ; 398: Microsoft.Extensions.Options.dll => 0x820d22b3 => 222
	i32 2192057212, ; 399: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 218
	i32 2193016926, ; 400: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2199971862, ; 401: is\Humanizer.resources => 0x8320e816 => 340
	i32 2201107256, ; 402: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 319
	i32 2201231467, ; 403: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 404: it\Microsoft.Maui.Controls.resources => 0x839595db => 383
	i32 2217644978, ; 405: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 302
	i32 2222056684, ; 406: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2237668184, ; 407: CodeBeam.MudBlazor.Extensions.dll => 0x85601b58 => 176
	i32 2242819349, ; 408: CloudNative.CloudEvents.SystemTextJson.dll => 0x85aeb515 => 175
	i32 2244775296, ; 409: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 284
	i32 2252106437, ; 410: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 411: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 412: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 413: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 204
	i32 2267999099, ; 414: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 239
	i32 2274498275, ; 415: nb-NO\Humanizer.resources => 0x879216e3 => 349
	i32 2278647370, ; 416: zh-Hans\Humanizer.resources => 0x87d1664a => 367
	i32 2279755925, ; 417: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 291
	i32 2290685808, ; 418: th-TH\Humanizer.resources.dll => 0x88891770 => 360
	i32 2293034957, ; 419: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 420: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 421: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 422: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 387
	i32 2305521784, ; 423: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 424: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 243
	i32 2320631194, ; 425: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2324758087, ; 426: uk\Humanizer.resources.dll => 0x8a90fe47 => 362
	i32 2340441535, ; 427: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 428: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 429: System.Net.Primitives => 0x8c40e0db => 70
	i32 2366048013, ; 430: hu\Microsoft.Maui.Controls.resources.dll => 0x8d07070d => 381
	i32 2368005991, ; 431: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 432: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 203
	i32 2378619854, ; 433: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 434: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 435: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 382
	i32 2401031729, ; 436: el\Humanizer.resources.dll => 0x8f1cd631 => 329
	i32 2401565422, ; 437: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 438: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 266
	i32 2406719501, ; 439: Ardalis.GuardClauses.dll => 0x8f73a00d => 173
	i32 2411328690, ; 440: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 196
	i32 2421380589, ; 441: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 442: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 253
	i32 2426501938, ; 443: az\Humanizer.resources.dll => 0x90a17b32 => 323
	i32 2427813419, ; 444: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 379
	i32 2435356389, ; 445: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 446: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 447: Microsoft.JSInterop.dll => 0x919672ca => 225
	i32 2454642406, ; 448: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 449: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 450: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 451: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 256
	i32 2471841756, ; 452: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 453: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 454: Microsoft.Maui.Controls => 0x93dba8a1 => 227
	i32 2481750429, ; 455: sk\Humanizer.resources.dll => 0x93ec819d => 355
	i32 2483903535, ; 456: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 457: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2486847491, ; 458: Google.Api.Gax => 0x943a4803 => 179
	i32 2490993605, ; 459: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 460: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2503351294, ; 461: ko\Microsoft.Maui.Controls.resources.dll => 0x95361bfe => 385
	i32 2505896520, ; 462: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 278
	i32 2514216601, ; 463: az\Humanizer.resources => 0x95dbe699 => 323
	i32 2522472828, ; 464: Xamarin.Android.Glide.dll => 0x9659e17c => 237
	i32 2537015816, ; 465: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 195
	i32 2538310050, ; 466: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 467: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 380
	i32 2562349572, ; 468: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 469: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2576534780, ; 470: ja\Microsoft.Maui.Controls.resources.dll => 0x9992ccfc => 384
	i32 2578202641, ; 471: fa\Humanizer.resources => 0x99ac4011 => 331
	i32 2581783588, ; 472: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 279
	i32 2581819634, ; 473: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 301
	i32 2585220780, ; 474: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 475: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 476: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 197
	i32 2589602615, ; 477: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 478: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 210
	i32 2593496499, ; 479: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 389
	i32 2605712449, ; 480: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 319
	i32 2614513330, ; 481: mt\Humanizer.resources => 0x9bd64eb2 => 347
	i32 2615233544, ; 482: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 270
	i32 2616218305, ; 483: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 221
	i32 2617129537, ; 484: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 485: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 486: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 260
	i32 2624644809, ; 487: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 265
	i32 2626831493, ; 488: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 384
	i32 2627185994, ; 489: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629116046, ; 490: ar\Humanizer.resources => 0x9cb5208e => 322
	i32 2629843544, ; 491: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 492: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 274
	i32 2660268199, ; 493: vi\Humanizer.resources => 0x9e9078a7 => 365
	i32 2663391936, ; 494: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 239
	i32 2663698177, ; 495: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 496: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 497: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2668047608, ; 498: CloudNative.CloudEvents => 0x9f072cf8 => 174
	i32 2676780864, ; 499: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 500: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 501: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 199
	i32 2693849962, ; 502: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 503: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 299
	i32 2715334215, ; 504: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 505: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 506: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 507: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 508: Xamarin.AndroidX.Activity => 0xa2e0939b => 241
	i32 2735172069, ; 509: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 510: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 195
	i32 2737747696, ; 511: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 247
	i32 2740698338, ; 512: ca\Microsoft.Maui.Controls.resources.dll => 0xa35bbce2 => 370
	i32 2740948882, ; 513: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2744327253, ; 514: Google.Api.Gax.Grpc.dll => 0xa3931c55 => 180
	i32 2748088231, ; 515: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 516: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 390
	i32 2757554483, ; 517: Google.Api.Gax.Grpc => 0xa45cf133 => 180
	i32 2758225723, ; 518: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 228
	i32 2764765095, ; 519: Microsoft.Maui.dll => 0xa4caf7a7 => 229
	i32 2765824710, ; 520: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 521: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 313
	i32 2778768386, ; 522: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 304
	i32 2779977773, ; 523: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 292
	i32 2785988530, ; 524: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 396
	i32 2788224221, ; 525: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 270
	i32 2801831435, ; 526: Microsoft.Maui.Graphics => 0xa7008e0b => 231
	i32 2803228030, ; 527: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2810250172, ; 528: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 257
	i32 2815265013, ; 529: zh-Hant\Humanizer.resources.dll => 0xa7cd88f5 => 368
	i32 2819470561, ; 530: System.Xml.dll => 0xa80db4e1 => 163
	i32 2820942282, ; 531: MudBlazor.dll => 0xa82429ca => 232
	i32 2821205001, ; 532: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 533: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 292
	i32 2822602214, ; 534: hr\Humanizer.resources.dll => 0xa83d7de6 => 336
	i32 2824502124, ; 535: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2830412389, ; 536: uz-Cyrl-UZ\Humanizer.resources.dll => 0xa8b4aa65 => 363
	i32 2833784645, ; 537: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 201
	i32 2838993487, ; 538: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 281
	i32 2849599387, ; 539: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 540: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 304
	i32 2855708567, ; 541: Xamarin.AndroidX.Transition => 0xaa36a797 => 300
	i32 2861098320, ; 542: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 543: Microsoft.Maui.Essentials => 0xaa8a4878 => 230
	i32 2868387235, ; 544: uz-Cyrl-UZ\Humanizer.resources => 0xaaf81da3 => 363
	i32 2870099610, ; 545: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 242
	i32 2875164099, ; 546: Jsr305Binding.dll => 0xab5f85c3 => 309
	i32 2875220617, ; 547: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2879159467, ; 548: ar\Humanizer.resources.dll => 0xab9c7cab => 322
	i32 2884993177, ; 549: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 268
	i32 2887636118, ; 550: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 551: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 198
	i32 2893550578, ; 552: Google.Apis.Core => 0xac7813f2 => 183
	i32 2898407901, ; 553: System.Management => 0xacc231dd => 236
	i32 2899753641, ; 554: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 555: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 556: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 557: mscorlib.dll => 0xad2a79b6 => 166
	i32 2909740682, ; 558: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 559: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 213
	i32 2912646636, ; 560: Google.Api.CommonProtos => 0xad9b75ec => 178
	i32 2916838712, ; 561: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 305
	i32 2919462931, ; 562: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2919948085, ; 563: it\Humanizer.resources => 0xae0adf35 => 341
	i32 2921128767, ; 564: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 244
	i32 2936416060, ; 565: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 566: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 567: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 568: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968332305, ; 569: ms-MY\Humanizer.resources.dll => 0xb0ed2811 => 346
	i32 2968338931, ; 570: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2971004615, ; 571: Microsoft.Extensions.Options.ConfigurationExtensions.dll => 0xb115eec7 => 223
	i32 2972252294, ; 572: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2972830657, ; 573: nb\Humanizer.resources.dll => 0xb131cbc1 => 348
	i32 2978675010, ; 574: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 264
	i32 2987532451, ; 575: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 295
	i32 2990604888, ; 576: Google.Apis => 0xb2410258 => 181
	i32 2996846495, ; 577: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 277
	i32 3016983068, ; 578: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 297
	i32 3023353419, ; 579: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 580: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 272
	i32 3038032645, ; 581: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 403
	i32 3053864966, ; 582: fi\Microsoft.Maui.Controls.resources.dll => 0xb6064806 => 376
	i32 3056245963, ; 583: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 294
	i32 3057625584, ; 584: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 285
	i32 3058644708, ; 585: pl\Humanizer.resources.dll => 0xb64f36e4 => 351
	i32 3059408633, ; 586: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 587: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3060069052, ; 588: MudBlazor => 0xb664f2bc => 232
	i32 3075834255, ; 589: System.Threading.Tasks => 0xb755818f => 144
	i32 3090735792, ; 590: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 591: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 592: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3106263381, ; 593: Grpc.Net.Common.dll => 0xb925d155 => 191
	i32 3109243939, ; 594: Microsoft.Extensions.Logging.Configuration => 0xb9534c23 => 219
	i32 3111772706, ; 595: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 596: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 597: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 598: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3147165239, ; 599: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 600: GoogleGson.dll => 0xbba64c02 => 187
	i32 3151916485, ; 601: zh-CN\Humanizer.resources => 0xbbde6dc5 => 366
	i32 3159123045, ; 602: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 603: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3177957132, ; 604: bn-BD\Humanizer.resources.dll => 0xbd6bc70c => 325
	i32 3178803400, ; 605: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 286
	i32 3192346100, ; 606: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 607: System.Web => 0xbe592c0c => 153
	i32 3198990134, ; 608: lv\Humanizer.resources => 0xbeacb736 => 345
	i32 3203277885, ; 609: Google.Api.Gax.dll => 0xbeee243d => 179
	i32 3204380047, ; 610: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 611: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 612: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 263
	i32 3215347189, ; 613: zxing => 0xbfa64df5 => 320
	i32 3220365878, ; 614: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 615: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3236685057, ; 616: uz-Latn-UZ\Humanizer.resources => 0xc0ebe501 => 364
	i32 3251039220, ; 617: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3255883881, ; 618: tr\Humanizer.resources => 0xc210d869 => 361
	i32 3258312781, ; 619: Xamarin.AndroidX.CardView => 0xc235e84d => 251
	i32 3265493905, ; 620: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 621: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3275336830, ; 622: sl\Humanizer.resources => 0xc339ac7e => 356
	i32 3276138634, ; 623: PubsubExplorer.dll => 0xc345e88a => 0
	i32 3277815716, ; 624: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 625: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 626: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 627: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3296560137, ; 628: sv\Humanizer.resources => 0xc47d8409 => 359
	i32 3299363146, ; 629: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 630: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3304979567, ; 631: Humanizer.dll => 0xc4fdfc6f => 192
	i32 3305363605, ; 632: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 376
	i32 3316684772, ; 633: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 634: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 261
	i32 3317144872, ; 635: System.Data => 0xc5b79d28 => 24
	i32 3322588991, ; 636: lv\Humanizer.resources.dll => 0xc60aaf3f => 345
	i32 3340431453, ; 637: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 249
	i32 3345895724, ; 638: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 290
	i32 3346324047, ; 639: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 287
	i32 3354927816, ; 640: Google.Cloud.Iam.V1 => 0xc7f822c8 => 184
	i32 3357674450, ; 641: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 393
	i32 3358260929, ; 642: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 643: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 242
	i32 3362522851, ; 644: Xamarin.AndroidX.Core => 0xc86c06e3 => 258
	i32 3366347497, ; 645: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 646: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 291
	i32 3381016424, ; 647: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 372
	i32 3395150330, ; 648: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 649: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 650: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 262
	i32 3406129585, ; 651: pl\Humanizer.resources => 0xcb0569b1 => 351
	i32 3406629867, ; 652: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 211
	i32 3421170118, ; 653: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 205
	i32 3427208810, ; 654: hr\Humanizer.resources => 0xcc470e6a => 336
	i32 3428513518, ; 655: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 208
	i32 3429136800, ; 656: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 657: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 658: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 265
	i32 3441432312, ; 659: fr\Humanizer.resources.dll => 0xcd2016f8 => 333
	i32 3445260447, ; 660: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 661: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 226
	i32 3453592554, ; 662: Google.Apis.Core.dll => 0xcdd9a3ea => 183
	i32 3458724246, ; 663: pt\Microsoft.Maui.Controls.resources.dll => 0xce27f196 => 391
	i32 3464190856, ; 664: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 197
	i32 3465327893, ; 665: el\Humanizer.resources => 0xce8cb515 => 329
	i32 3471940407, ; 666: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 667: Mono.Android => 0xcf3163e6 => 171
	i32 3484440000, ; 668: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 392
	i32 3485117614, ; 669: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 670: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 671: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 254
	i32 3499097210, ; 672: Google.Protobuf.dll => 0xd08ffc7a => 186
	i32 3500000672, ; 673: Microsoft.JSInterop => 0xd09dc5a0 => 225
	i32 3509114376, ; 674: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 675: System.Security.dll => 0xd1854eb4 => 130
	i32 3523102396, ; 676: Ardalis.GuardClauses => 0xd1fe46bc => 173
	i32 3530912306, ; 677: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 678: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 679: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 680: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3576974097, ; 681: af\Humanizer.resources.dll => 0xd5344b11 => 321
	i32 3580758918, ; 682: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 400
	i32 3587750475, ; 683: id\Humanizer.resources.dll => 0xd5d8ba4b => 339
	i32 3592228221, ; 684: zh-Hant\Microsoft.Maui.Controls.resources.dll => 0xd61d0d7d => 402
	i32 3592435036, ; 685: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 216
	i32 3597029428, ; 686: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 240
	i32 3598340787, ; 687: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 688: System.Linq.dll => 0xd715a361 => 61
	i32 3612435020, ; 689: System.Management.dll => 0xd751624c => 236
	i32 3614030538, ; 690: nb\Humanizer.resources => 0xd769baca => 348
	i32 3624195450, ; 691: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627119903, ; 692: ja\Humanizer.resources => 0xd831751f => 342
	i32 3627220390, ; 693: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 289
	i32 3633644679, ; 694: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 244
	i32 3638274909, ; 695: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 696: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 275
	i32 3643446276, ; 697: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 397
	i32 3643854240, ; 698: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 286
	i32 3645089577, ; 699: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3645630983, ; 700: Google.Protobuf => 0xd94bea07 => 186
	i32 3657292374, ; 701: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 204
	i32 3660523487, ; 702: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 703: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 704: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 250
	i32 3684561358, ; 705: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 254
	i32 3693073519, ; 706: fa\Humanizer.resources.dll => 0xdc1fd46f => 331
	i32 3700866549, ; 707: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 708: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 259
	i32 3711696859, ; 709: uz-Latn-UZ\Humanizer.resources.dll => 0xdd3bffdb => 364
	i32 3716563718, ; 710: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 711: Xamarin.AndroidX.Annotation => 0xdda814c6 => 243
	i32 3722202641, ; 712: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 207
	i32 3724971120, ; 713: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 285
	i32 3732100267, ; 714: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 715: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 201
	i32 3737834244, ; 716: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3746837316, ; 717: CloudNative.CloudEvents.SystemTextJson => 0xdf543344 => 175
	i32 3748608112, ; 718: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 719: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3751619990, ; 720: da\Microsoft.Maui.Controls.resources.dll => 0xdf9d2d96 => 372
	i32 3753152672, ; 721: zh-Hans\Humanizer.resources.dll => 0xdfb490a0 => 367
	i32 3753194597, ; 722: id\Humanizer.resources => 0xdfb53465 => 339
	i32 3758424670, ; 723: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 206
	i32 3766131739, ; 724: ku\Humanizer.resources => 0xe07a9c1b => 344
	i32 3776403777, ; 725: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 216
	i32 3786282454, ; 726: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 252
	i32 3792276235, ; 727: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3793997468, ; 728: Google.Apis.Auth.dll => 0xe223ce9c => 182
	i32 3799976085, ; 729: hu\Humanizer.resources => 0xe27f0895 => 337
	i32 3800979733, ; 730: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 226
	i32 3802395368, ; 731: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3818918118, ; 732: CsvHelper.dll => 0xe3a010e6 => 177
	i32 3819260425, ; 733: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 734: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 735: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 736: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 209
	i32 3844307129, ; 737: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 738: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 739: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 740: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 741: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3879070973, ; 742: hu\Humanizer.resources.dll => 0xe735ecfd => 337
	i32 3885497537, ; 743: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 744: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 300
	i32 3888767677, ; 745: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 290
	i32 3896106733, ; 746: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 747: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 258
	i32 3898971068, ; 748: Microsoft.Extensions.Localization.dll => 0xe86593bc => 215
	i32 3901907137, ; 749: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3909047057, ; 750: uk\Humanizer.resources => 0xe8ff5311 => 362
	i32 3920221145, ; 751: nl\Microsoft.Maui.Controls.resources.dll => 0xe9a9d3d9 => 388
	i32 3920810846, ; 752: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 753: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 303
	i32 3928044579, ; 754: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 755: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 756: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 288
	i32 3945713374, ; 757: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3947271234, ; 758: ro\Humanizer.resources => 0xeb469442 => 353
	i32 3953953790, ; 759: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3954195687, ; 760: Microsoft.Extensions.Localization => 0xebb03ce7 => 215
	i32 3955647286, ; 761: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 246
	i32 3958156203, ; 762: pt\Humanizer.resources => 0xebecabab => 352
	i32 3959773229, ; 763: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 277
	i32 4003436829, ; 764: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 765: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 245
	i32 4023392905, ; 766: System.IO.Pipelines => 0xefd01a89 => 235
	i32 4025784931, ; 767: System.Memory => 0xeff49a63 => 62
	i32 4044355444, ; 768: JsonPath.Net => 0xf10ff774 => 194
	i32 4046471985, ; 769: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 228
	i32 4054681211, ; 770: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4059682726, ; 771: Google.Apis.dll => 0xf1f9d7a6 => 181
	i32 4068434129, ; 772: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 773: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4075152723, ; 774: Microsoft.Extensions.Logging.Console => 0xf2e5e553 => 220
	i32 4082882467, ; 775: Google.Apis.Auth => 0xf35bd7a3 => 182
	i32 4091086043, ; 776: el\Microsoft.Maui.Controls.resources.dll => 0xf3d904db => 374
	i32 4094352644, ; 777: Microsoft.Maui.Essentials.dll => 0xf40add04 => 230
	i32 4099507663, ; 778: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 779: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 780: Xamarin.AndroidX.Emoji2 => 0xf479582c => 266
	i32 4103439459, ; 781: uk\Microsoft.Maui.Controls.resources.dll => 0xf4958463 => 398
	i32 4105707993, ; 782: ku\Humanizer.resources.dll => 0xf4b821d9 => 344
	i32 4126470640, ; 783: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 208
	i32 4127667938, ; 784: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 785: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 786: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 787: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 398
	i32 4151237749, ; 788: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 789: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 790: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 791: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 792: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 793: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 282
	i32 4185676441, ; 794: System.Security => 0xf97c5a99 => 130
	i32 4196529839, ; 795: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 796: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4228312955, ; 797: sr-Latn\Humanizer.resources.dll => 0xfc06ef7b => 358
	i32 4240157025, ; 798: sv\Humanizer.resources.dll => 0xfcbba961 => 359
	i32 4249188766, ; 799: nb\Microsoft.Maui.Controls.resources.dll => 0xfd45799e => 387
	i32 4256097574, ; 800: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 259
	i32 4258378803, ; 801: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 281
	i32 4260525087, ; 802: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 803: Microsoft.Maui.Controls.dll => 0xfea12dee => 227
	i32 4274976490, ; 804: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 805: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 282
	i32 4294648842, ; 806: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 212
	i32 4294763496 ; 807: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 268
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [808 x i32] [
	i32 68, ; 0
	i32 357, ; 1
	i32 67, ; 2
	i32 108, ; 3
	i32 278, ; 4
	i32 312, ; 5
	i32 48, ; 6
	i32 369, ; 7
	i32 233, ; 8
	i32 80, ; 9
	i32 378, ; 10
	i32 145, ; 11
	i32 357, ; 12
	i32 30, ; 13
	i32 402, ; 14
	i32 124, ; 15
	i32 231, ; 16
	i32 102, ; 17
	i32 386, ; 18
	i32 330, ; 19
	i32 296, ; 20
	i32 185, ; 21
	i32 107, ; 22
	i32 296, ; 23
	i32 139, ; 24
	i32 316, ; 25
	i32 401, ; 26
	i32 394, ; 27
	i32 77, ; 28
	i32 124, ; 29
	i32 13, ; 30
	i32 252, ; 31
	i32 132, ; 32
	i32 298, ; 33
	i32 151, ; 34
	i32 353, ; 35
	i32 18, ; 36
	i32 366, ; 37
	i32 250, ; 38
	i32 26, ; 39
	i32 272, ; 40
	i32 1, ; 41
	i32 59, ; 42
	i32 42, ; 43
	i32 330, ; 44
	i32 91, ; 45
	i32 332, ; 46
	i32 196, ; 47
	i32 255, ; 48
	i32 192, ; 49
	i32 147, ; 50
	i32 274, ; 51
	i32 271, ; 52
	i32 343, ; 53
	i32 335, ; 54
	i32 54, ; 55
	i32 69, ; 56
	i32 327, ; 57
	i32 399, ; 58
	i32 241, ; 59
	i32 83, ; 60
	i32 377, ; 61
	i32 273, ; 62
	i32 338, ; 63
	i32 131, ; 64
	i32 191, ; 65
	i32 55, ; 66
	i32 189, ; 67
	i32 149, ; 68
	i32 74, ; 69
	i32 145, ; 70
	i32 62, ; 71
	i32 190, ; 72
	i32 146, ; 73
	i32 403, ; 74
	i32 165, ; 75
	i32 397, ; 76
	i32 256, ; 77
	i32 12, ; 78
	i32 269, ; 79
	i32 125, ; 80
	i32 152, ; 81
	i32 113, ; 82
	i32 166, ; 83
	i32 164, ; 84
	i32 271, ; 85
	i32 284, ; 86
	i32 375, ; 87
	i32 84, ; 88
	i32 224, ; 89
	i32 358, ; 90
	i32 150, ; 91
	i32 316, ; 92
	i32 60, ; 93
	i32 396, ; 94
	i32 217, ; 95
	i32 51, ; 96
	i32 103, ; 97
	i32 219, ; 98
	i32 114, ; 99
	i32 202, ; 100
	i32 40, ; 101
	i32 309, ; 102
	i32 307, ; 103
	i32 212, ; 104
	i32 120, ; 105
	i32 52, ; 106
	i32 44, ; 107
	i32 119, ; 108
	i32 261, ; 109
	i32 388, ; 110
	i32 267, ; 111
	i32 81, ; 112
	i32 328, ; 113
	i32 341, ; 114
	i32 136, ; 115
	i32 303, ; 116
	i32 248, ; 117
	i32 338, ; 118
	i32 8, ; 119
	i32 342, ; 120
	i32 73, ; 121
	i32 350, ; 122
	i32 155, ; 123
	i32 318, ; 124
	i32 220, ; 125
	i32 154, ; 126
	i32 92, ; 127
	i32 313, ; 128
	i32 45, ; 129
	i32 193, ; 130
	i32 350, ; 131
	i32 317, ; 132
	i32 109, ; 133
	i32 223, ; 134
	i32 129, ; 135
	i32 25, ; 136
	i32 238, ; 137
	i32 72, ; 138
	i32 55, ; 139
	i32 327, ; 140
	i32 46, ; 141
	i32 394, ; 142
	i32 222, ; 143
	i32 262, ; 144
	i32 200, ; 145
	i32 22, ; 146
	i32 276, ; 147
	i32 176, ; 148
	i32 86, ; 149
	i32 43, ; 150
	i32 160, ; 151
	i32 71, ; 152
	i32 289, ; 153
	i32 320, ; 154
	i32 379, ; 155
	i32 360, ; 156
	i32 3, ; 157
	i32 42, ; 158
	i32 63, ; 159
	i32 393, ; 160
	i32 335, ; 161
	i32 177, ; 162
	i32 16, ; 163
	i32 53, ; 164
	i32 390, ; 165
	i32 312, ; 166
	i32 347, ; 167
	i32 105, ; 168
	i32 233, ; 169
	i32 317, ; 170
	i32 383, ; 171
	i32 310, ; 172
	i32 273, ; 173
	i32 34, ; 174
	i32 158, ; 175
	i32 85, ; 176
	i32 32, ; 177
	i32 392, ; 178
	i32 12, ; 179
	i32 51, ; 180
	i32 214, ; 181
	i32 56, ; 182
	i32 293, ; 183
	i32 36, ; 184
	i32 333, ; 185
	i32 209, ; 186
	i32 311, ; 187
	i32 246, ; 188
	i32 35, ; 189
	i32 373, ; 190
	i32 58, ; 191
	i32 178, ; 192
	i32 280, ; 193
	i32 187, ; 194
	i32 324, ; 195
	i32 193, ; 196
	i32 17, ; 197
	i32 314, ; 198
	i32 164, ; 199
	i32 206, ; 200
	i32 395, ; 201
	i32 328, ; 202
	i32 389, ; 203
	i32 385, ; 204
	i32 279, ; 205
	i32 221, ; 206
	i32 306, ; 207
	i32 391, ; 208
	i32 153, ; 209
	i32 210, ; 210
	i32 302, ; 211
	i32 287, ; 212
	i32 190, ; 213
	i32 248, ; 214
	i32 352, ; 215
	i32 29, ; 216
	i32 349, ; 217
	i32 52, ; 218
	i32 307, ; 219
	i32 5, ; 220
	i32 371, ; 221
	i32 297, ; 222
	i32 301, ; 223
	i32 253, ; 224
	i32 318, ; 225
	i32 245, ; 226
	i32 264, ; 227
	i32 174, ; 228
	i32 380, ; 229
	i32 85, ; 230
	i32 321, ; 231
	i32 306, ; 232
	i32 61, ; 233
	i32 112, ; 234
	i32 400, ; 235
	i32 326, ; 236
	i32 57, ; 237
	i32 401, ; 238
	i32 293, ; 239
	i32 355, ; 240
	i32 99, ; 241
	i32 332, ; 242
	i32 19, ; 243
	i32 257, ; 244
	i32 111, ; 245
	i32 101, ; 246
	i32 102, ; 247
	i32 369, ; 248
	i32 104, ; 249
	i32 310, ; 250
	i32 194, ; 251
	i32 188, ; 252
	i32 71, ; 253
	i32 184, ; 254
	i32 38, ; 255
	i32 32, ; 256
	i32 211, ; 257
	i32 103, ; 258
	i32 73, ; 259
	i32 375, ; 260
	i32 9, ; 261
	i32 123, ; 262
	i32 46, ; 263
	i32 247, ; 264
	i32 224, ; 265
	i32 9, ; 266
	i32 43, ; 267
	i32 4, ; 268
	i32 294, ; 269
	i32 326, ; 270
	i32 214, ; 271
	i32 399, ; 272
	i32 31, ; 273
	i32 354, ; 274
	i32 325, ; 275
	i32 138, ; 276
	i32 92, ; 277
	i32 200, ; 278
	i32 93, ; 279
	i32 340, ; 280
	i32 49, ; 281
	i32 141, ; 282
	i32 112, ; 283
	i32 140, ; 284
	i32 263, ; 285
	i32 115, ; 286
	i32 311, ; 287
	i32 157, ; 288
	i32 76, ; 289
	i32 79, ; 290
	i32 283, ; 291
	i32 37, ; 292
	i32 305, ; 293
	i32 207, ; 294
	i32 267, ; 295
	i32 260, ; 296
	i32 64, ; 297
	i32 138, ; 298
	i32 15, ; 299
	i32 199, ; 300
	i32 116, ; 301
	i32 299, ; 302
	i32 308, ; 303
	i32 365, ; 304
	i32 255, ; 305
	i32 48, ; 306
	i32 70, ; 307
	i32 80, ; 308
	i32 126, ; 309
	i32 94, ; 310
	i32 121, ; 311
	i32 315, ; 312
	i32 26, ; 313
	i32 276, ; 314
	i32 97, ; 315
	i32 28, ; 316
	i32 251, ; 317
	i32 370, ; 318
	i32 149, ; 319
	i32 235, ; 320
	i32 169, ; 321
	i32 4, ; 322
	i32 98, ; 323
	i32 198, ; 324
	i32 361, ; 325
	i32 33, ; 326
	i32 93, ; 327
	i32 298, ; 328
	i32 346, ; 329
	i32 217, ; 330
	i32 21, ; 331
	i32 41, ; 332
	i32 170, ; 333
	i32 189, ; 334
	i32 386, ; 335
	i32 0, ; 336
	i32 269, ; 337
	i32 334, ; 338
	i32 378, ; 339
	i32 202, ; 340
	i32 283, ; 341
	i32 314, ; 342
	i32 308, ; 343
	i32 288, ; 344
	i32 2, ; 345
	i32 134, ; 346
	i32 111, ; 347
	i32 218, ; 348
	i32 238, ; 349
	i32 395, ; 350
	i32 58, ; 351
	i32 95, ; 352
	i32 377, ; 353
	i32 39, ; 354
	i32 185, ; 355
	i32 249, ; 356
	i32 25, ; 357
	i32 94, ; 358
	i32 371, ; 359
	i32 89, ; 360
	i32 188, ; 361
	i32 99, ; 362
	i32 10, ; 363
	i32 234, ; 364
	i32 87, ; 365
	i32 382, ; 366
	i32 100, ; 367
	i32 295, ; 368
	i32 203, ; 369
	i32 354, ; 370
	i32 315, ; 371
	i32 240, ; 372
	i32 374, ; 373
	i32 7, ; 374
	i32 280, ; 375
	i32 237, ; 376
	i32 368, ; 377
	i32 88, ; 378
	i32 205, ; 379
	i32 275, ; 380
	i32 154, ; 381
	i32 373, ; 382
	i32 324, ; 383
	i32 33, ; 384
	i32 213, ; 385
	i32 116, ; 386
	i32 82, ; 387
	i32 356, ; 388
	i32 20, ; 389
	i32 343, ; 390
	i32 11, ; 391
	i32 162, ; 392
	i32 3, ; 393
	i32 229, ; 394
	i32 381, ; 395
	i32 234, ; 396
	i32 334, ; 397
	i32 222, ; 398
	i32 218, ; 399
	i32 84, ; 400
	i32 340, ; 401
	i32 319, ; 402
	i32 64, ; 403
	i32 383, ; 404
	i32 302, ; 405
	i32 143, ; 406
	i32 176, ; 407
	i32 175, ; 408
	i32 284, ; 409
	i32 157, ; 410
	i32 41, ; 411
	i32 117, ; 412
	i32 204, ; 413
	i32 239, ; 414
	i32 349, ; 415
	i32 367, ; 416
	i32 291, ; 417
	i32 360, ; 418
	i32 131, ; 419
	i32 75, ; 420
	i32 66, ; 421
	i32 387, ; 422
	i32 172, ; 423
	i32 243, ; 424
	i32 143, ; 425
	i32 362, ; 426
	i32 106, ; 427
	i32 151, ; 428
	i32 70, ; 429
	i32 381, ; 430
	i32 156, ; 431
	i32 203, ; 432
	i32 121, ; 433
	i32 127, ; 434
	i32 382, ; 435
	i32 329, ; 436
	i32 152, ; 437
	i32 266, ; 438
	i32 173, ; 439
	i32 196, ; 440
	i32 141, ; 441
	i32 253, ; 442
	i32 323, ; 443
	i32 379, ; 444
	i32 20, ; 445
	i32 14, ; 446
	i32 225, ; 447
	i32 135, ; 448
	i32 75, ; 449
	i32 59, ; 450
	i32 256, ; 451
	i32 167, ; 452
	i32 168, ; 453
	i32 227, ; 454
	i32 355, ; 455
	i32 15, ; 456
	i32 74, ; 457
	i32 179, ; 458
	i32 6, ; 459
	i32 23, ; 460
	i32 385, ; 461
	i32 278, ; 462
	i32 323, ; 463
	i32 237, ; 464
	i32 195, ; 465
	i32 91, ; 466
	i32 380, ; 467
	i32 1, ; 468
	i32 136, ; 469
	i32 384, ; 470
	i32 331, ; 471
	i32 279, ; 472
	i32 301, ; 473
	i32 134, ; 474
	i32 69, ; 475
	i32 197, ; 476
	i32 146, ; 477
	i32 210, ; 478
	i32 389, ; 479
	i32 319, ; 480
	i32 347, ; 481
	i32 270, ; 482
	i32 221, ; 483
	i32 88, ; 484
	i32 96, ; 485
	i32 260, ; 486
	i32 265, ; 487
	i32 384, ; 488
	i32 31, ; 489
	i32 322, ; 490
	i32 45, ; 491
	i32 274, ; 492
	i32 365, ; 493
	i32 239, ; 494
	i32 109, ; 495
	i32 158, ; 496
	i32 35, ; 497
	i32 174, ; 498
	i32 22, ; 499
	i32 114, ; 500
	i32 199, ; 501
	i32 57, ; 502
	i32 299, ; 503
	i32 144, ; 504
	i32 118, ; 505
	i32 120, ; 506
	i32 110, ; 507
	i32 241, ; 508
	i32 139, ; 509
	i32 195, ; 510
	i32 247, ; 511
	i32 370, ; 512
	i32 54, ; 513
	i32 180, ; 514
	i32 105, ; 515
	i32 390, ; 516
	i32 180, ; 517
	i32 228, ; 518
	i32 229, ; 519
	i32 133, ; 520
	i32 313, ; 521
	i32 304, ; 522
	i32 292, ; 523
	i32 396, ; 524
	i32 270, ; 525
	i32 231, ; 526
	i32 159, ; 527
	i32 257, ; 528
	i32 368, ; 529
	i32 163, ; 530
	i32 232, ; 531
	i32 132, ; 532
	i32 292, ; 533
	i32 336, ; 534
	i32 161, ; 535
	i32 363, ; 536
	i32 201, ; 537
	i32 281, ; 538
	i32 140, ; 539
	i32 304, ; 540
	i32 300, ; 541
	i32 169, ; 542
	i32 230, ; 543
	i32 363, ; 544
	i32 242, ; 545
	i32 309, ; 546
	i32 40, ; 547
	i32 322, ; 548
	i32 268, ; 549
	i32 81, ; 550
	i32 198, ; 551
	i32 183, ; 552
	i32 236, ; 553
	i32 56, ; 554
	i32 37, ; 555
	i32 97, ; 556
	i32 166, ; 557
	i32 172, ; 558
	i32 213, ; 559
	i32 178, ; 560
	i32 305, ; 561
	i32 82, ; 562
	i32 341, ; 563
	i32 244, ; 564
	i32 98, ; 565
	i32 30, ; 566
	i32 159, ; 567
	i32 18, ; 568
	i32 346, ; 569
	i32 127, ; 570
	i32 223, ; 571
	i32 119, ; 572
	i32 348, ; 573
	i32 264, ; 574
	i32 295, ; 575
	i32 181, ; 576
	i32 277, ; 577
	i32 297, ; 578
	i32 165, ; 579
	i32 272, ; 580
	i32 403, ; 581
	i32 376, ; 582
	i32 294, ; 583
	i32 285, ; 584
	i32 351, ; 585
	i32 170, ; 586
	i32 16, ; 587
	i32 232, ; 588
	i32 144, ; 589
	i32 125, ; 590
	i32 118, ; 591
	i32 38, ; 592
	i32 191, ; 593
	i32 219, ; 594
	i32 115, ; 595
	i32 47, ; 596
	i32 142, ; 597
	i32 117, ; 598
	i32 34, ; 599
	i32 187, ; 600
	i32 366, ; 601
	i32 95, ; 602
	i32 53, ; 603
	i32 325, ; 604
	i32 286, ; 605
	i32 129, ; 606
	i32 153, ; 607
	i32 345, ; 608
	i32 179, ; 609
	i32 24, ; 610
	i32 161, ; 611
	i32 263, ; 612
	i32 320, ; 613
	i32 148, ; 614
	i32 104, ; 615
	i32 364, ; 616
	i32 89, ; 617
	i32 361, ; 618
	i32 251, ; 619
	i32 60, ; 620
	i32 142, ; 621
	i32 356, ; 622
	i32 0, ; 623
	i32 100, ; 624
	i32 5, ; 625
	i32 13, ; 626
	i32 122, ; 627
	i32 359, ; 628
	i32 135, ; 629
	i32 28, ; 630
	i32 192, ; 631
	i32 376, ; 632
	i32 72, ; 633
	i32 261, ; 634
	i32 24, ; 635
	i32 345, ; 636
	i32 249, ; 637
	i32 290, ; 638
	i32 287, ; 639
	i32 184, ; 640
	i32 393, ; 641
	i32 137, ; 642
	i32 242, ; 643
	i32 258, ; 644
	i32 168, ; 645
	i32 291, ; 646
	i32 372, ; 647
	i32 101, ; 648
	i32 123, ; 649
	i32 262, ; 650
	i32 351, ; 651
	i32 211, ; 652
	i32 205, ; 653
	i32 336, ; 654
	i32 208, ; 655
	i32 163, ; 656
	i32 167, ; 657
	i32 265, ; 658
	i32 333, ; 659
	i32 39, ; 660
	i32 226, ; 661
	i32 183, ; 662
	i32 391, ; 663
	i32 197, ; 664
	i32 329, ; 665
	i32 17, ; 666
	i32 171, ; 667
	i32 392, ; 668
	i32 137, ; 669
	i32 150, ; 670
	i32 254, ; 671
	i32 186, ; 672
	i32 225, ; 673
	i32 155, ; 674
	i32 130, ; 675
	i32 173, ; 676
	i32 19, ; 677
	i32 65, ; 678
	i32 147, ; 679
	i32 47, ; 680
	i32 321, ; 681
	i32 400, ; 682
	i32 339, ; 683
	i32 402, ; 684
	i32 216, ; 685
	i32 240, ; 686
	i32 79, ; 687
	i32 61, ; 688
	i32 236, ; 689
	i32 348, ; 690
	i32 106, ; 691
	i32 342, ; 692
	i32 289, ; 693
	i32 244, ; 694
	i32 49, ; 695
	i32 275, ; 696
	i32 397, ; 697
	i32 286, ; 698
	i32 14, ; 699
	i32 186, ; 700
	i32 204, ; 701
	i32 68, ; 702
	i32 171, ; 703
	i32 250, ; 704
	i32 254, ; 705
	i32 331, ; 706
	i32 78, ; 707
	i32 259, ; 708
	i32 364, ; 709
	i32 108, ; 710
	i32 243, ; 711
	i32 207, ; 712
	i32 285, ; 713
	i32 67, ; 714
	i32 201, ; 715
	i32 63, ; 716
	i32 175, ; 717
	i32 27, ; 718
	i32 160, ; 719
	i32 372, ; 720
	i32 367, ; 721
	i32 339, ; 722
	i32 206, ; 723
	i32 344, ; 724
	i32 216, ; 725
	i32 252, ; 726
	i32 10, ; 727
	i32 182, ; 728
	i32 337, ; 729
	i32 226, ; 730
	i32 11, ; 731
	i32 177, ; 732
	i32 78, ; 733
	i32 126, ; 734
	i32 83, ; 735
	i32 209, ; 736
	i32 66, ; 737
	i32 107, ; 738
	i32 65, ; 739
	i32 128, ; 740
	i32 122, ; 741
	i32 337, ; 742
	i32 77, ; 743
	i32 300, ; 744
	i32 290, ; 745
	i32 8, ; 746
	i32 258, ; 747
	i32 215, ; 748
	i32 2, ; 749
	i32 362, ; 750
	i32 388, ; 751
	i32 44, ; 752
	i32 303, ; 753
	i32 156, ; 754
	i32 128, ; 755
	i32 288, ; 756
	i32 23, ; 757
	i32 353, ; 758
	i32 133, ; 759
	i32 215, ; 760
	i32 246, ; 761
	i32 352, ; 762
	i32 277, ; 763
	i32 29, ; 764
	i32 245, ; 765
	i32 235, ; 766
	i32 62, ; 767
	i32 194, ; 768
	i32 228, ; 769
	i32 90, ; 770
	i32 181, ; 771
	i32 87, ; 772
	i32 148, ; 773
	i32 220, ; 774
	i32 182, ; 775
	i32 374, ; 776
	i32 230, ; 777
	i32 36, ; 778
	i32 86, ; 779
	i32 266, ; 780
	i32 398, ; 781
	i32 344, ; 782
	i32 208, ; 783
	i32 50, ; 784
	i32 6, ; 785
	i32 90, ; 786
	i32 398, ; 787
	i32 21, ; 788
	i32 162, ; 789
	i32 96, ; 790
	i32 50, ; 791
	i32 113, ; 792
	i32 282, ; 793
	i32 130, ; 794
	i32 76, ; 795
	i32 27, ; 796
	i32 358, ; 797
	i32 359, ; 798
	i32 387, ; 799
	i32 259, ; 800
	i32 281, ; 801
	i32 7, ; 802
	i32 227, ; 803
	i32 110, ; 804
	i32 282, ; 805
	i32 212, ; 806
	i32 268 ; 807
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.1xx @ af27162bee43b7fecdca59b4f67aa8c175cbc875"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
