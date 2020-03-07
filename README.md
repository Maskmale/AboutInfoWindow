# AboutInfoWindow
Swift 5 updated , DangerCove/DCOAboutWindow



# Overview

a replacement for the standard About dialog.

It adds the option to open acknowledgments and visit the website by clicking a button.

![DCOAboutWindow in action](https://raw.github.com/DangerCove/DCOAboutWindow/master/screenshots/DCOAboutWindow.png)
![DCOAboutWindow in Dark Mode](https://raw.github.com/DangerCove/DCOAboutWindow/master/screenshots/DCOAboutWindow-DarkMode.png)

## Showing acknowledgments

You can point to and maintain a custom `Acknowledgments.rtf` file

# Setup & Usage

### Manually, and enjoy the DIY

Remember to hook it up to the 'About [app name]' menu item or a button.

<hr>


You can change values by setting properties on `DCOAboutWindowController`:

```
/**
 *  The application name.
 *  Default: CFBundleName
 */
@property (copy) NSString *appName;

/**
 *  The application version.
 *  Default: "Version %@ (Build %@)", CFBundleVersion, CFBundleShortVersionString
 */
@property (copy) NSString *appVersion;

/**
 *  The copyright line.
 *  Default: NSHumanReadableCopyright
 */
@property (copy) NSString *appCopyright;

/**
 *  The credits.
 *  Default: [[NSBundle mainBundle] pathForResource:@"Credits" ofType:@"rtf"];
 */
@property (copy) NSAttributedString *appCredits;

/**
 *  The URL pointing to the app's website.
 *  Default: none
 */
@property (strong) NSURL *appWebsiteURL;

/**
 *  The path to the file that contains the acknowledgments.
 *  Default: [[NSBundle mainBundle] pathForResource:@"Acknowledgments" ofType:@"rtf"];
 */
@property (nonatomic, copy) NSString *acknowledgmentsPath;

/**
 *  If set to YES acknowledgments are shown in a text view, inside the window. Otherwise an external editor is launched.
 *  Default: NO;
 */
@property (assign) BOOL useTextViewForAcknowledgments;
```

## Pre-processing (for Dark Mode)

You can pre-process the `NSAttributedString` containing the app credits using a delegate. This is great for making the about window play nice with Mojave's Dark Mode. Here's how it works:

```objc
// Conform to the DCOStringPreprocessingProtocol
@interface DCDAppDelegate() <DCOStringPreprocessingProtocol>

self.aboutWindowController = [[DCOAboutWindowController alloc] init];
// Set the delegate
self.aboutWindowController.delegate = self;

#pragma mark - DCOStringPreprocessingProtocol

- (NSAttributedString *)preprocessAppCredits:(NSAttributedString *)appCredits {
    NSMutableAttributedString *mutableCredits = [appCredits mutableCopy];
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [NSColor textColor] };
    [mutableCredits addAttributes:attributes range:NSMakeRange(0, mutableCredits.length)];
    
    return [mutableCredits copy];
}

// Optionally pre-process the acknowledgments as well
- (NSAttributedString *)preprocessAppAcknowledgments:(NSAttributedString *)appAcknowledgments {
    NSMutableAttributedString *mutableAcknowledgments = [appAcknowledgments mutableCopy];
    
    NSDictionary *attributes = @{ NSForegroundColorAttributeName : [NSColor textColor] };
    [mutableAcknowledgments addAttributes:attributes range:NSMakeRange(0, mutableCredits.length)];
    
    return [mutableAcknowledgments copy];
}
```

Thanks to [@balthisar](https://github.com/balthisar) for adding this.

# Localization

Add the following lines to your Localizable.string to change these values, or localize them.

```
/* Version %@ (Build %@), displayed in the about window */
"Version %@ (Build %@)" = "v%@ (%@)";

/* Caption on the 'Visit the %@ Website' button in the about window */
"Visit the %@ Website" = "Visit %@'s Website";

/* Caption of the 'Acknowledgments' button in the about window */
"Acknowledgments" = "Acknowledgments";

/* Caption of the 'Credits' button in the about window when acknowledgments are shown when useTextViewForAcknowledgments is YES. */
"Credits" = "Credits";
```
