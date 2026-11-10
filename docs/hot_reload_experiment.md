# Week 2 Practical Record: Hot Reload, Hot Restart and Full Restart

**Project:** `week2_hello`  
**Exercise:** Hello World and Stateful Counter

> Important: This is the expected observation record. Run the experiment on your own emulator or physical device and confirm the observations before submitting it as a personal practical record.

## 1. Hello World screen

The app displays:
- An AppBar titled `Week 2 | Hello World`
- Centered `Hello World` text
- A larger, bold font (`34`, `FontWeight.w800`)
- A Stateful counter with Increase, Decrease and Reset buttons

## 2. Counter and setState()

1. Start the app. The counter should show `0`.
2. Press **Increase** twice. The counter should show `2`.
3. Each button press calls `setState()`.
4. Flutter schedules another `build()` so the updated value appears.

## 3. Hot Reload experiment

1. Leave the counter at `2`.
2. In `lib/main.dart`, change the `Hello World` font size from `34` to `40`.
3. Save the file and trigger Hot Reload:
   - Terminal: press lowercase `r` while `flutter run` is active.
   - VS Code: use the Hot Reload control.
4. Expected result: the text becomes larger and the counter remains `2`.

**Observation to confirm:** Hot Reload updates the UI while preserving the current State object and its counter value.

## 4. Hot Restart experiment

1. With the counter at `2`, trigger Hot Restart:
   - Terminal: press uppercase `R` while `flutter run` is active.
   - IDE: use the Hot Restart control.
2. Expected result: the app starts again and the counter returns to `0`.

**Observation to confirm:** Hot Restart reruns `main()` and recreates the widget State, so the in-memory counter value is reset.

## 5. Change that requires restarting

In `main.dart`, find:

```dart
debugPrint('APP STARTUP: Week 2 Hello World');
```

Change the message to:

```dart
debugPrint('APP STARTUP: Restart test');
```

Save and press lowercase `r` for Hot Reload. The new startup message is not printed because Hot Reload does not rerun `main()`.

Now press uppercase `R` for Hot Restart. The changed startup message should appear in the Debug Console.

This demonstrates a code change in the app startup sequence that requires Hot Restart to execute.

## 6. Full restart experiment

1. Press `q` in the terminal to stop the running app.
2. Run `flutter run` again.
3. Increase the counter before stopping, then observe it after launching again.

Expected result: the counter starts at `0`, because a new app process and widget State are created. A full stop-and-run also rebuilds/relaunches the app through the normal launch process.

## 7. Comparison

| Feature | Hot Reload | Hot Restart | Full Restart |
|---|---|---|---|
| Applies Dart code changes | Yes, where supported | Yes | Yes |
| Reruns `main()` | No | Yes | Yes |
| Preserves current widget State | Usually yes | No | No |
| Counter after starting from `2` | `2` | `0` | `0` |
| Restarts native app process | No | Not a full native relaunch | Yes |
| Typical use | UI/style edits | Startup/initialization changes | Native/platform changes or clean relaunch |

**Note:** Hot Reload has limitations. Changes to native Android/iOS code, plugins, platform configuration, and some initialization patterns may require a full restart or rebuild. Exact behavior can depend on the change and Flutter tooling version.

## 8. Short conclusion

Hot Reload applies supported Dart code changes quickly and preserves the current widget State, so the counter remains unchanged. Hot Restart restarts the Dart application, reruns `main()`, and recreates the State objects, so the counter returns to its initial value. A Full Restart stops and launches the application again, including the native app process, and is needed for changes that Hot Reload or Hot Restart cannot apply, such as certain native platform or plugin changes.
