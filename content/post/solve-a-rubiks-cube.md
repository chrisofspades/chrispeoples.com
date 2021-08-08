---
title: A Fun Way to Solve a Rubik's Cube
date: 2021-08-08
tags: 
- rubiks-cube
---
[Giovanni Contardi](https://www.jvenb.com/learn) shared this great video on [how to solve a Rubik's Cube](https://youtu.be/MpHQa-306C4). It is far and away the easiest beginner's method I have ever seen. Most beginner methods still require you to memorize tons of algorithms, but with Giovanni's method you only need to remember **two**! Despite it's simplicity, there are still lot of steps to remember and it's easy to forget the order of execution without watching the whole video again, so I thought I'd convert the stickier parts into cube notation.

## Cube Notation
Cube notation describes which portion of the cube to move, and in which direction. Ruwix has a great [tutorial](https://ruwix.com/the-rubiks-cube/notation/) with all of the different notations. Here are the ones needed for Giovanni's method.

<dl>
<dt>R</dt>
<dd>Rotate the R face 90 degrees clockwise</dd>
<dt>R'</dt>
<dd>Said as R-prime or R-inverted</dd>
<dd>Rotate the R face 90 degrees counterclockwise</dd>
<dt>L</dt>
<dd>Rotate the L face 90 degrees clockwise</dd>
<dt>L'</dt>
<dd>Rotate the L face 90 degrees counterclockwise</dd>
<dt>U</dt>
<dd>Rotate the U face 90 degrees clockwise</dd>
<dt>U'</dt>
<dd>Rotate the U face 90 degrees counterclockwise</dd>
<dt>F</dt>
<dd>Rotate the F face 90 degrees clockwise</dd>
<dt>F'</dt>
<dd>Rotate the F face 90 degrees counterclockwise</dd>
<dt>x</dt>
<dd>Rotate the entire cube 90 degrees on it's x axis (do an R move without holding the two other layers)</dd>
<dt>y</dt>
<dd>Rotate the entire cube 90 degrees on it's y axis (do a U move without holding the two other layers)</dd>
<dt>z</dt>
<dd>Rotate the entire cube 90 degrees on it's z axis (do an F move without holding the two other layers)</dd>
</dl>

## Algorithms
In cube-solving, an algorithm is made up of a sequence of moves defined by the aforementioned notations. Algorithms can be as short as two turns and as long as 73,483,199! Fortunately, Giovanni's method is based upon two algorithms, each with only four moves. Giovanni refers to them as "sexy moves", because of the ease and fluidity with which they can be executed :). They are:

- **Right Hand Sexy Move (RHSM)**:  R U R' U'
- **Left Hand Sexy Move (LHSM)**: L' U' L U

## Steps 1-4
These steps are fairly straight forward so I won't convert them to cube notation. The following steps get more complicated in terms of whole cube rotations and executing an algorithm multiple times.

## Step 5 - Yellow Cross
There are three configurations of the cube to be aware of when you get to this step:

### Line
- Position the line so it horizontal to you
- Do one **F** turn
- Do <abbr title="Right Hand Sexy Move">RHSM</abbr> once
- Do one **F'** turn

### "L"
- Position the "L" so it faces backwards
- Do one **F** turn
- Do <abbr title="Right Hand Sexy Move">RHSM</abbr> twice
- Do one **F'** turn

### Dot
- Do one **F** turn
- Do <abbr title="Right Hand Sexy Move">RHSM</abbr> once
- Do one **F'** turn
- This will leave with a line or an "L", follow the steps for the resulting shape

# Step 6 - Corner Permutation
Turn the top layer (**U**) until at least two corners are in the correct location. Now there are two potential cases to solve for:

### Two adjacent corners
- Rotate the entire cube so the correct corners are on the left hand side
- Execute  <abbr title="Right Hand Sexy Move">RHSM</abbr> three times 
- Do one **y** rotation
- <abbr title="Left Hand Sexy Move">LHSM</abbr> three times 
- **U** until all corners are aligned correctly

### Two opposite corners
- Execute  <abbr title="Right Hand Sexy Move">RHSM</abbr> three times 
- Do one **y** rotation
- <abbr title="Left Hand Sexy Move">LHSM</abbr> three times 
- <abbr title="Right Hand Sexy Move">RHSM</abbr> three more times 
- Do one **y** rotation
- <abbr title="Left Hand Sexy Move">LHSM</abbr> three times 
- **U** until all corners are aligned correctly

# Step 7 - Corner Orientation
- Flip the cube over
- Hold the cube so one unsolved corner is in the bottom right position
- <abbr title="Right Hand Sexy Move">RHSM</abbr> until corner is solved
- Do one **D** rotation
- Repeat above two steps until all corners are solved

# Final Step - Edge Permutation
Turn the top layer (**U**) until all corners are in the correct location.  If there is one edge that is already solved, position the cube so that edge faces you. Then locate the edge with the same color as the side opposite you. 

## Right hand permutation
When the edge is on your right side, execute the following 1-1-5-5 sequence:
- 1 <abbr title="Right Hand Sexy Move">RHSM</abbr>
- 1 <abbr title="Left Hand Sexy Move">LHSM</abbr>
- 5 <abbr title="Right Hand Sexy Move">RHSM</abbr>s
- 5 <abbr title="Left Hand Sexy Move">LHSM</abbr>s

## Left hand permutation
When the edge is on your left side, execute the following 1-1-5-5 sequence:
- 1 <abbr title="Left Hand Sexy Move">LHSM</abbr>
- 1 <abbr title="Right Hand Sexy Move">RHSM</abbr>
- 5 <abbr title="Left Hand Sexy Move">LHSM</abbr>s
- 5 <abbr title="Right Hand Sexy Move">RHSM</abbr>s

If there are no solved edges, execute the 1-1-5-5 sequence one time. This will solve one edge.

And that's it, the cube is solved!