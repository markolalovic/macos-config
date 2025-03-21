# Keyboard Configuration for Durgod Taurus K320 using Karabiner

## Backtick and tilde
Selecting "ISO / ANSI" in "Karabiner-Elements Settings / Virtual Keyboard" maps back "§" to "`" and "±" to "~" as explained in [Karabiner-Elements/issues](https://github.com/pqrs-org/Karabiner-Elements/issues/345) - doesn't work after reboots.

### Better alternative:
- Find key codes
    * Pressing "§" gives "key_code":"non_us_backslash"; usage page: 7 (0x0007) usage: 100 (0x0064)
    * Pressing "`" gives "key_code":"grave_accent_and _tilde" usage page: 7 (0x0007) usage: 53 (0x0035)
    * Map "§" key to "`" key by mapping "0x700000064" to "0x700000035"
        ```
        hidutil property --set '{"UserKeyMapping":
            [{"HIDKeyboardModifierMappingSrc":0x700000064,
            "HIDKeyboardModifierMappingDst":0x700000035}]
        }'
        ```

- Permanent solution (Source [How to remap single Mac keyboard key](https://www.grzegorowski.com/how-to-remap-single-mac-keyboard-key))
    * Create plist file `/Library/LaunchDaemons/org.custom.keyboard-remap.plist` with

        ```
        <?xml version="1.0" encoding="UTF-8"?>
        <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
        <plist version="1.0">
        <dict>
            <key>Label</key>
            <string>org.custom.keyboard-remap</string>
            <key>ProgramArguments</key>
            <array>
            <string>/usr/bin/hidutil</string>
            <string>property</string>
            <string>--set</string>
            <string>{"UserKeyMapping": [{"HIDKeyboardModifierMappingSrc":0x700000064, "HIDKeyboardModifierMappingDst":0x700000035}] }</string>
            </array>
            <key>RunAtLoad</key>
            <true/>
            <key>KeepAlive</key>
            <false/>
        </dict>
        </plist>
        ```
    * Then load it with `sudo launchctl load -w /Library/LaunchDaemons/org.custom.keyboard-remap.plist` so it will be loaded on each system reboot.

    * To check if it is loaded successfully `sudo launchctl list | grep org.custom.keyboard-remap.plist`

    * To reset, execute:
    
        ```
        hidutil property --set '{"UserKeyMapping": 
            []
        }'
        ```

## Simple Modifications
These modifications make the keyboard layout (control, command, option) as on Mac keyboards:

* application -> right_option
* right_option -> right_command

## Complex Modifications
Modifications in [`keyboard-mappings.json`](https://raw.githubusercontent.com/markolalovic/my-macos-config-files/main/keyboard/keyboard-mappings.json) make the navigation keys, and shortcuts to take screenshots, just like on Ubuntu Linux:

* shift+print_screen to command+shift+4
* print_screen to command+shift+3
* Change caps_lock to command+control+shift
* PC-Style Control+Delete
* PC-Style Copy/Paste/Cut
* End key to the end of the line (Control + e)
* Home key to the beginning of the line (Control + a)
* Swap left_command with left_option
