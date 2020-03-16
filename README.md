博客链接，[Cocoa App 开发进一步，表视图 TableView 、文件管理与拖拽](https://juejin.im/post/5e6dffe66fb9a07cbb6e543f)


开始时，

![Drag Fold Table](https://raw.github.com/coyingcat/AboutInfoWindow/master/imgs/1_0.png)


拖入文件后，

![Drag Fold Table](https://raw.github.com/coyingcat/AboutInfoWindow/master/imgs/1.png)


<hr>



博客链接，[认识 Cocoa App 的开发：Cocoa Binding 、Window Control 、菜单栏...](https://juejin.im/post/5e68fa5be51d45270764f0e4)

# AboutInfoWindow
Swift 5 updated , DangerCove/DCOAboutWindow



# Overview

a replacement for the standard About dialog.

It adds the option to open acknowledgments and visit the website by clicking a button.

![AboutWindow in action](https://raw.github.com/coyingcat/AboutInfoWindow/master/imgs/0.png)


## Showing acknowledgments

You can point to and maintain a custom `Acknowledgments.rtf` file

# Setup & Usage

### Manually, and enjoy the DIY

Remember to hook it up to the 'About [app name]' menu item or a button.

<hr>


You can change values by setting properties on `AboutWindowController`:

```

    /**
     *  应用名，The application name.
     *  Default: CFBundleName
     */
    let appName = BundleInfo.get.appName

    /**
     *  应用版本，The application version.
     *  Default: "Version %@ (Build %@)", CFBundleVersion, CFBundleShortVersionString
     */
    let appVersion = BundleInfo.get.appVersion
    /**
     *  应用版权，The copyright line.
     *  Default: NSHumanReadableCopyright
     */
    let appCopyright = BundleInfo.get.appCopyright

    /**
     *  应用信用: The credits.
     *  Default: contents of file at [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
     */
    let appCredits = BundleInfo.get.appCredits

    /**
     *  应用网址： The URL pointing to the app's website.
     *  Default: none
     */
    var appWebsiteURL: URL?

    /**
     *  感谢： The path to the file that contains the acknowledgments.
     *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
     */
    let acknowledgmentPath = BundleInfo.get.acknowledgmentPath
    let acknowledgment = BundleInfo.get.acknowledgment

    /**
     *  设置致谢文件的打开方式，打开文件，还是窗口内展示
     *  If set to YES acknowledgments are shown in a text view, inside the window. Otherwise an external editor is launched.
     *  Default: NO;
     */
    var useTextViewForAcknowledgments = false

```