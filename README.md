# Week 2 — Hello World and Stateful Counter

This Flutter assignment demonstrates a centered Hello World screen, an AppBar, text styling, a Stateful counter using `setState()`, and the differences among Hot Reload, Hot Restart, and a full restart.

## Project contents

```text
week2_hello/
├── lib/
│   └── main.dart
├── test/
│   └── widget_test.dart
├── docs/
│   ├── final_widget_tree.md
│   └── hot_reload_experiment.md
├── pubspec.yaml
├── analysis_options.yaml
├── run_on_ubuntu.sh
└── README.md
```

## Requirements

- Flutter SDK installed and available on PATH
- Android emulator or a USB-connected Android device with USB debugging enabled
- Android SDK/toolchain configured for Android runs

Check your setup:

```bash
flutter doctor
flutter devices
```

## Run on Ubuntu

From this project directory:

```bash
chmod +x run_on_ubuntu.sh
./run_on_ubuntu.sh
```

The script generates Android and Web platform scaffolding if missing, downloads dependencies, lists available devices, and runs the app.

To select a particular device:

```bash
flutter devices
flutter run -d DEVICE_ID
```

Replace `DEVICE_ID` with the ID shown by `flutter devices`.

## Run tests

```bash
flutter pub get
flutter test
```

## Assignment checklist

- [x] Create project named `week2_hello`
- [x] Create a simple Hello World screen
- [x] Add an AppBar
- [x] Center the main text
- [x] Change font size and font weight
- [x] Create a Stateful counter screen
- [x] Increase/decrease/reset the counter using `setState()`
- [x] Show build method call count
- [x] Draw the final Widget Tree in `docs/final_widget_tree.md`
- [ ] Run on your emulator or physical device and record your actual observations
- [ ] Perform Hot Reload and confirm state preservation
- [ ] Perform Hot Restart and confirm state reset
- [ ] Perform the startup-message restart experiment
- [ ] Perform a full stop-and-run and record the result

## Hot Reload / Hot Restart / Full Restart

See `docs/hot_reload_experiment.md` for step-by-step instructions, an observation record, the comparison table, and a short conclusion.
