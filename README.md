# Three Buttons Task

This project demonstrates the implementation of an interactive UI component with three adaptive buttons. Each button has a unique label, an icon, and includes dynamic animations for a smooth user experience.

![ScreenRecording2024-11-06at16 33 52-ezgif com-video-to-gif-converter (1)](https://github.com/user-attachments/assets/f4780480-1106-4baf-a54e-4331dd2689b8)

## Overview

The main objective of this project is to add three buttons to the screen with the following key features:

- **Adaptive Width**: Each button resizes automatically based on its text length.
- **Padding**: The content within each button has padding of 10pt vertically and 14pt horizontally for a consistent appearance.
- **Animated Button Press**: On tap, each button scales down with an animation, and scales back up when released. This animation is smooth and interruptible. If a user taps the button again while it's animating, it will resume from its current size without any jarring jumps.
- **Icon Alignment**: An icon is displayed to the right of each button's text. The icon is integrated using the button’s system `imageView` (custom `imageView` instances are not allowed), with an 8pt space between the text and the icon.
- **Modal Controller Trigger**: Pressing the third button displays a modal controller. While the modal is visible, the button changes its appearance.

## Button State in Modal View

When the modal controller is shown, the third button's appearance updates to provide visual feedback:
- **Background**: Changes to `.systemGray2`.
- **Text and Icon Color**: Updates to `.systemGray3`.
These visual changes are implemented without tying to the view controller's lifecycle methods.
