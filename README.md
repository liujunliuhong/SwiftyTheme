# SwiftyTheme
轻量级主题、皮肤管理库，兼容OC

# 背景
项目开发进入后期，为了提升用户体验，一般而言都会增加换肤、切换主题这么个功能。对于一个已经开发完成的APP而言，增加换肤功能，工作量是比较大的。换肤包括颜色切换以及图片切换。iOS 13开始，Apple增加了暗黑模式。某些情况下可能临时会增加换肤、切换主题功能，比如春节、圣诞节。用过淘宝、京东应该会有印象的。还有种情况，就是有多个主题可供用户切换，而不是局限于暗黑模式，比如网易云音乐。<br>
假如现在产品说我需要加几个主题供用户切换，作为开发人员该怎么做呢？也许可能会立刻想到，嗯，我发个通知，每个页面去接收通知，然后进行相应的图片、颜色替换。这个方法本身是可行的，但是要做的工作量非常之大，特别是对于一个开发完成的APP而言。<br>
本人目前开发的项目还没有切换主题这么个需求，但是我看到很多APP都增加了这么个功能，为了预防将来可能会出现切换主题这么个需求，本人进行了相关研究。<br>
GitHub搜索"换肤"、"主题"，相关的代码还是比较多的，本人着重研究了下:[LEETheme](https://github.com/lixiang1994/LEETheme)、[SwiftTheme](https://github.com/wxxsw/SwiftTheme)、[JXTheme](https://github.com/pujiaxin33/JXTheme)、[FluentDarkModeKit](https://github.com/microsoft/FluentDarkModeKit)这些开源库。研究之后，个人觉得这些三方库有些限制。
- [LEETheme](https://github.com/lixiang1994/LEETheme):采用的是链式编程+NSInvocation消息转发。所有控件属性内部都转到了`LEEThemeConfigModel`，这个类包含了大量的属性设置，没有区分对应的控件，也就是说，任意`NSObject`对象都能调用，没有做区分。最终的结果就是：代码不报错，但是运行会崩溃。
- [SwiftTheme](https://github.com/wxxsw/SwiftTheme):


# 正在完善中...
