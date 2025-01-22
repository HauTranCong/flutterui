import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterui/src/widgets/textbox.dart';


enum MenuEntryRightClick {
    about('About'),
    showMessage('Show Message', SingleActivator(LogicalKeyboardKey.keyS, shift: true)),
    hideMessage('Hide Message', SingleActivator(LogicalKeyboardKey.keyS, shift: true)),
    colorMenu('Color Menu'),
    colorRed('Dark Red Background', SingleActivator(LogicalKeyboardKey.keyR, shift: true)),
    colorGreen('Dark Green Background', SingleActivator(LogicalKeyboardKey.keyG, shift: true)),
    colorBlue('Dark Blue Background', SingleActivator(LogicalKeyboardKey.keyB, shift: true));

    const MenuEntryRightClick(this.label, [this.shortcut]);
    final String label;
    final MenuSerializableShortcut? shortcut;
}

class MenuAppRigtClick extends StatelessWidget {
    const MenuAppRigtClick({super.key});

    static const String kMessage = '"Learning by doing." - Someone';

    @override
    Widget build(BuildContext context) {
        return const Scaffold(body: SafeArea(child: MyCascadingMenu(message: kMessage)));
    }
}


class MyCascadingMenu extends StatefulWidget {
  const MyCascadingMenu({super.key, required this.message});

  final String message;

  @override
  State<MyCascadingMenu> createState() => _MyCascadingMenuState();
}

class _MyCascadingMenuState extends State<MyCascadingMenu> {
  MenuEntryRightClick? _lastSelection;
  final FocusNode _buttonFocusNode = FocusNode(debugLabel: 'Menu Button');
  final MenuController _menuController = MenuController();
  ShortcutRegistryEntry? _shortcutsEntry;
  bool _menuWasEnabled = false;

  Color get backgroundColor => _backgroundColor;
  Color _backgroundColor = Colors.red[50]!;
  set backgroundColor(Color value) {
    if (_backgroundColor != value) {
      setState(() {
        _backgroundColor = value;
      });
    }
  }

  bool get showingMessage => _showingMessage;
  bool _showingMessage = false;
  set showingMessage(bool value) {
    if (_showingMessage != value) {
      setState(() {
        _showingMessage = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _disableContextMenu();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Dispose of any previously registered shortcuts, since they are about to
    // be replaced.
    _shortcutsEntry?.dispose();
    // Collect the shortcuts from the different menu selections so that they can
    // be registered to apply to the entire app. Menus don't register their
    // shortcuts, they only display the shortcut hint text.
    final Map<ShortcutActivator, Intent> shortcuts =
        <ShortcutActivator, Intent>{
      for (final MenuEntryRightClick item in MenuEntryRightClick.values)
        if (item.shortcut != null)
          item.shortcut!: VoidCallbackIntent(() => _activate(item)),
    };
    // Register the shortcuts with the ShortcutRegistry so that they are
    // available to the entire application.
    _shortcutsEntry = ShortcutRegistry.of(context).addAll(shortcuts);
  }

  @override
  void dispose() {
    _shortcutsEntry?.dispose();
    _buttonFocusNode.dispose();
    _reenableContextMenu();
    super.dispose();
  }

  Future<void> _disableContextMenu() async {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    _menuWasEnabled = BrowserContextMenu.enabled;
    if (_menuWasEnabled) {
      await BrowserContextMenu.disableContextMenu();
    }
  }

  void _reenableContextMenu() {
    if (!kIsWeb) {
      // Does nothing on non-web platforms.
      return;
    }
    if (_menuWasEnabled && !BrowserContextMenu.enabled) {
      BrowserContextMenu.enableContextMenu();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: GestureDetector(
        onTapDown: _handleTapDown,
        onSecondaryTapDown: _handleSecondaryTapDown,
        child: MenuAnchor(
          controller: _menuController,
          menuChildren: <Widget>[       
            MenuItemButton(
              child: Text(MenuEntryRightClick.about.label),
              onPressed: () => _activate(MenuEntryRightClick.about),
            ),
            if (_showingMessage)
              MenuItemButton(
                onPressed: () => _activate(MenuEntryRightClick.hideMessage),
                shortcut: MenuEntryRightClick.hideMessage.shortcut,
                child: Text(MenuEntryRightClick.hideMessage.label),
              ),
            if (!_showingMessage)
              MenuItemButton(
                onPressed: () => _activate(MenuEntryRightClick.showMessage),
                shortcut: MenuEntryRightClick.showMessage.shortcut,
                child: Text(MenuEntryRightClick.showMessage.label),
              ),
            SubmenuButton(
              menuChildren: <Widget>[
                MenuItemButton(
                  onPressed: () => _activate(MenuEntryRightClick.colorRed),
                  shortcut: MenuEntryRightClick.colorRed.shortcut,
                  child: Text(MenuEntryRightClick.colorRed.label),
                ),
                MenuItemButton(
                  onPressed: () => _activate(MenuEntryRightClick.colorGreen),
                  shortcut: MenuEntryRightClick.colorGreen.shortcut,
                  child: Text(MenuEntryRightClick.colorGreen.label),
                ),
                MenuItemButton(
                  onPressed: () => _activate(MenuEntryRightClick.colorBlue),
                  shortcut: MenuEntryRightClick.colorBlue.shortcut,
                  child: Text(MenuEntryRightClick.colorBlue.label),
                ),
              ],
              child: const Text('Background Color'),
            ),
          ],
          child: Container(
            alignment: Alignment.center,
            color: backgroundColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                      'Right-click anywhere on the background to show the menu.'),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    showingMessage ? widget.message : '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
                Text(_lastSelection != null
                    ? 'Last Selected: ${_lastSelection!.label}'
                    : ''),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _activate(MenuEntryRightClick selection) {
    setState(() {
      _lastSelection = selection;
    });
    switch (selection) {
      case MenuEntryRightClick.about:
        showAboutDialog(
          context: context,
          applicationName: 'MenuBar Sample',
          applicationVersion: '1.0.0',
        );
      case MenuEntryRightClick.showMessage:
      case MenuEntryRightClick.hideMessage:
        showingMessage = !showingMessage;
      case MenuEntryRightClick.colorMenu:
        break;
      case MenuEntryRightClick.colorRed:
        backgroundColor = Colors.red[50]!;
      case MenuEntryRightClick.colorGreen:
        backgroundColor = Colors.green[50]!;
      case MenuEntryRightClick.colorBlue:
        backgroundColor = Colors.blue[50]!;
    }
  }

  void _handleSecondaryTapDown(TapDownDetails details) {
    _menuController.open(position: details.localPosition);
  }

  void _handleTapDown(TapDownDetails details) {
    if (_menuController.isOpen) {
      _menuController.close();
      return;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        // Don't open the menu on these platforms with a Ctrl-tap (or a
        // tap).
        break;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        // Only open the menu on these platforms if the control button is down
        // when the tap occurs.
        if (HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlLeft) ||
            HardwareKeyboard.instance.logicalKeysPressed
                .contains(LogicalKeyboardKey.controlRight)) {
          _menuController.open(position: details.localPosition);
        }
    }
  }
}
