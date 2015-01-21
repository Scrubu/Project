Project Wayez Chowdhury and Kyle Lai
=======


AP Computer Science final project for Fall Term 2014<br>
Anti-gravity platform game. <bl>
<ul><li>
Player cannot jump.</li>
<li>Can only reverse gravity</li>
</ul><br><br>
Features:
<ol>
<li>Press 'A' and 'D' buttons to move left and right respectively</li>
<li>Press spacebar to reverse gravity of yourself</li>
<li>Press 'R' to restart map</li>
<li>obstacles that try to collide with player</li>
<li>Player must last as long as possible while avoiding obstacles, similar to gravity guy</li>
<li>Score will increase the longer the player stays alive</li>
<li>Powerups randomly spawn, increase score, spawn more obstacles or gives more lives</li>
<li>Player starts with three lives</li>
</ol>

January 7, 2015:<ul>
<li>Created processing file Gravity.pde</li>
<li>Learned some processing tricks</li>
<li>Added basic movement for protagonist</li>
<li>Created Gravity that affects the protaganist</li>
</ul><br><br>

January 8, 2015:<ul>
<li>Updated Gravity to run smoother, used KeyRelease instead of KeyPressed</li>
<li>Fixed bug that led to infinite gravity change</li>
<li>Created Hero.pde</li>
</ul><br><br>

January 9, 2015:<ul>
<li>Fixed bug that prevented movement</li>
<li>Updated movement to run smoother</li>
<li>Added gravitational acceleration by using velocity and gravity</li>
</ul><br><br>

January 10, 2015:<ul>
<li>Made transition from moving left to right smooth without any delays</li>
<li>Fixed gravity bug where player would go offscreen by reversing gravity midair</li>
</ul><br><br>

January 12, 2015<ul>
<li>Fixed bug that did not allow player to reverse gravity</li>
<li>Gravitational acceleration is now canceled after player switches gravitational direction</li>
<li>Integrated Hero class into code</li>
<li>Created obstacle class</li>
</ul><br><br>

January 14, 2015<ul>
<li>Started cleaning up main gravity class by moving functions to the Hero class</li>
</ul><br><br>

January 15, 2015<ul>
<li>Finished cleaning up main class</li>
<li>Added mutator and accessor methods in Hero class to get its properties</li>
<li>began working on collision with obstacles</li>
</ul><br><br>

January 17, 2015<ul>
<li>worked more on collision, lots of bugs where collision does not register obstacles</li>
<li>implemented sprite</li>
<li>generated invisible rectangle that stays on sprite to register when it touches obstacles</li>
</ul><br><br>

January 18, 2015<ul>
<li>collision works now</li>
<li>minor bug where player can accidentally be teleported to one side of a block when hit at a certain angle</li>
<li>Not sure how to fix bug, but am sure it has something to do with the specific areas in which collision registers not being specific enough</li>
<li>started obstacle moving from one side of map to other</li>
<li>obstacles are generated randomly with random size</li>
<li>Worked on having generated obstacles be put into array and looped to see if player is colliding</li>
<li>player now rotates when gravity is reversed</li>
</ul><br><br>

January 19, 2015<ul>
<li>added player losing if he goes off the map</li>
<li>implemented some aesthetics such as background, music, and sprites</li>
<li>music track is 20 minutes long</li>
<li>implemented score system based on survival time, highscore will be recorded</li>
<li>implemented a restart button</li>
<li>started introduction screen</li>
<li>changed score system to be based on time in contact with obstacles</li>
<improved on high score system to save on txt file</li>
</ul><br><br>

January 20, 2015<ul>
<li>finished introduction screen</li>
<li>added power-ups</li>
<li>fixed score bug</li>
<li>added frequency variable to limit amount of obstacles as player progresses</li>
<li>implemented a life system, player now starts off with 3 lives</li>
<li>fixed audio bug</li>
<li>bug found where occasionally player does not die when falls off screen unless spacebar is pressed, not sure how to fix</li>
</ul><br><br>
