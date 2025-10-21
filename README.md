
# AbsorbPointer Widget Demo

This Flutter demo showcases the **AbsorbPointer** widget: a widget that prevents its child widgets from receiving any touch interactions, making it useful for temporarily disabling parts of the UI.

---

##  Project Overview

This mini app demonstrates a **real-world use case** of the AbsorbPointer widget using a simple form.  
When the user clicks the **Submit** button:
- A loading spinner appears.
- The form and button become **unresponsive** for a few seconds.
- After loading completes, the form becomes active again.

This simulates how developers can prevent **multiple form submissions** or unwanted taps during processing.


## How to Run the Project

1. Clone this repository:
   ```bash
   git clone https://github.com/Otani-ibe/absorbpointer_widget.git
````

2. Open the folder in **Visual Studio Code** or **Android Studio**.
3. Run the app on an emulator or physical device:

   ```bash
   flutter run
   ```


## Widget: AbsorbPointer

**Definition:**
A widget that prevents its child from receiving pointer events (taps, drags, gestures, etc.).

**Real-life Example:**
Used to disable buttons, forms, or sections of an app during loading or processing.

---

##  Three Key Attributes

| Property            | Description                                                                               | Effect in Demo                                                                   |
| ------------------- | ----------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| `absorbing`         | A boolean that determines whether to block touch events.                                  | When `true`, all touches are ignored. When `false`, user input works normally.   |
| `child`             | The widget subtree wrapped inside AbsorbPointer.                                          | Wraps the form and button in this demo.                                          |
| `ignoringSemantics` | Determines whether to exclude the widget from the semantics tree for accessibility tools. | Set to `false` so screen readers still recognize the button while it’s disabled. |

---
## 🖼️ Screenshot

Here’s what the final UI looks like:

![App Screenshot](assets/screenshot.png)