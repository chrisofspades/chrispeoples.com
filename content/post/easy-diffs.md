---
title: "Quick and Easy Diffs Using Visual Studio Code"
date: 2022-07-03
tags:
    - vs-code
---

Jim Nielsen asked the following [question on Twitter](https://twitter.com/jimniels/status/1526752234079281152?s=20&t=MrgLEjcQBKZ80XPtZsbmyw): 

> "I’ve used the online diff checker a few times, but does anybody know of or use a simple utility for Mac that will do this? Example. Copy/paste text to doc 1. Copy paste text to doc 2. Then say “diff these two” without having to check into git etc."

As a matter of fact, Jim, I do! Visual Studio Code allows you to diff, or compare, two open documents without first saving them or checking them into git.

## Diff using Command Palette 

My preferred method of diffing uses the command palette, since I can do it entirely from the keyboard. Here's what to do:

1. Create a new file (`Ctrl+N`) and paste text (`Ctrl+V`). This file will be called "Untitled-1" or something similar.
2. Repeat for the text to compare it to, usually named "Untitled-2". 
3. Open the command palette (`Ctrl+Shift+P`), type "Compare active file with", and press `Enter`. 
4. Arrow down to "Untitled-1" and press `Enter`.

VS Code will then open a new pane with a side-by-side diff!

## Diff using Explorer Panel

For those situations where keyboard shortcuts aren't accessible, files can also be compared using VS Code's explorer panel. The steps are very similar:

1. Create a new file (File Menu > File > New Text File) and paste text (File Menu > Edit > Paste). This file will be called "Untitled-1" or something similar.
2. Repeat for the text to compare it to, usually named "Untitled-2". 
3. Open the explorer panel (File Menu > View > Explorer) if it's not already open.
4. Right-click on "Untitled-1", then click "Select for Compare".
5. Right-click on "Untitled-2", then click "Compare with Selected".

And once again, VS Code will open a new pane with a side-by-side diff!


