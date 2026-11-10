# Final Widget Tree

```text
Week2HelloApp (StatelessWidget)
└── MaterialApp
    ├── title: "Week 2 - Hello World"
    ├── ThemeData
    └── home: HelloCounterScreen (StatefulWidget)
        └── Scaffold
            ├── AppBar
            │   └── Text("Week 2 | Hello World")
            └── body: Center
                └── SingleChildScrollView
                    └── ConstrainedBox
                        └── Column
                            ├── Icon(waving_hand)
                            ├── Text("Hello World")
                            ├── Text("My first Flutter screen")
                            ├── Card
                            │   └── Padding
                            │       └── Column
                            │           ├── Text("STATEFUL COUNTER")
                            │           ├── Text(counter)
                            │           ├── Wrap
                            │           │   ├── OutlinedButton("Decrease")
                            │           │   └── FilledButton("Increase")
                            │           └── TextButton("Reset counter")
                            ├── Text("Build method calls")
                            └── Text("Hot Reload instruction")
```

## Explanation

- `Week2HelloApp` is a `StatelessWidget` that configures the app's theme and home screen.
- `HelloCounterScreen` is a `StatefulWidget` because its counter value changes.
- `Scaffold` provides the standard page structure.
- `AppBar` displays the screen title.
- `Center` places the main content in the center of the available screen.
- `Column` arranges the greeting and counter vertically.
- `FilledButton` calls `setState()` through `_incrementCounter()`.
- When `setState()` runs, Flutter schedules `build()` again with the updated counter.
