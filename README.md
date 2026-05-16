<h1 align="center">🤖 FPGA Maze Solver Robot</h1>

<p align="center">
Autonomous maze-solving robot implemented using Verilog HDL, FPGA-based control systems, ultrasonic sensors, PWM motor control, MQTT communication, and Python-based path visualization.
  <br><br>
<img width="40%" alt="Girando" src="https://github.com/user-attachments/assets/c9eb3668-44d1-422e-8ac2-8209ec1ff708" />

</p>

<hr>

<h2>📌 Project Overview</h2>

<p>
This project was focused on designing an autonomous robot capable of traversing and escaping a maze environment. The  was designed using a <b>Xilinx ZYBO Z7 FPGA</b>, implementing digital logic and control systems entirely in <b>Verilog HDL</b>, where the development tasks including code creation, compilation, synthesis, and FPGA programming were carried out using <b>Quartus</b>.
</p>

<p>
In addition, to allow autonomous movement without requiring a direct power connection, the robot was powered using a portable <b>power bank</b> mounted directly on the chassis.
</p>

<p>The system integrates:</p>

<ul>
  <li>FPGA-based autonomous navigation logic</li>
  <li>Three HC-SR04 ultrasonic sensors for wall detection</li>
  <li>PWM motor control for wheel movement</li>
  <li>Finite State Machines (FSM) for robot decision-making</li>
  <li>ESP32-based MQTT wireless communication</li>
  <li>Python Turtle graphics for maze trajectory visualization</li>
</ul>

<hr>

<h2>⚙️ Hardware Architecture</h2>

<h3>Ultrasonic Sensors</h3>

<p>
The robot used three ultrasonic sensors:
</p>

<ul>
  <li>Front sensor</li>
  <li>Left sensor</li>
  <li>Right sensor</li>
</ul>

<p>
These sensors allowed the robot to detect nearby walls and determine possible movement directions inside the maze.
</p>

<h3>Motor System</h3>

<p>
The movement system consisted of:
</p>

<ul>
  <li>Two DC motors connected to the main wheels</li>
  <li>An H-Bridge motor driver for motor power control</li>
  <li>Two auxiliary support wheels for balance</li>
  <li>PWM signals generated directly from the FPGA</li>
</ul>

https://github.com/user-attachments/assets/f923a08f-ce7a-4b78-b610-e14abe80abf8


<p>
The robot was capable of:
</p>

<ul>
  <li>Moving forward</li>
  <li>Turning left</li>
  <li>Turning right</li>
</ul>

<p align="center">
<img width="30%" alt="Robot" src="https://github.com/user-attachments/assets/82f143dc-8ffc-4930-a997-ed3f56cd9f32" />
</p>

<hr>

<h2>🧠 Finite State Machines (FSM)</h2>

<p>
Several FSMs were implemented to coordinate:
</p>

<ul>
  <li>Obstacle detection</li>
  <li>Movement decisions</li>
  <li>Motor synchronization</li>
  <li>Sensor reading states</li>
  <li>Maze navigation behavior</li>
</ul>

<p>
Different schematics and state diagrams were developed during the design process to model the robot behavior and subsystem interactions.
</p>

<hr>

<h2>📡 MQTT Communication</h2>

<p>
An ESP32 module was integrated for MQTT communication, allowing sensor information to be transmitted wirelessly during the maze traversal.
</p>

<p>
The transmitted values represented the ultrasonic sensor detections:
</p>

<table>
  <tr>
    <th>Value</th>
    <th>Direction</th>
  </tr>
  <tr>
    <td>0</td>
    <td>Left</td>
  </tr>
  <tr>
    <td>1</td>
    <td>Center</td>
  </tr>
  <tr>
    <td>2</td>
    <td>Right</td>
  </tr>
</table>

<p>
This data was later used for external visualization and path reconstruction.
</p>

<hr>

<h2>🐍 Python Visualization</h2>

<p>
Python scripts using the Turtle graphics library were developed to visualize the robot trajectory inside the maze.
</p>

<p>
The system:
</p>

<ul>
  <li>Read sensor logs stored in <code>.txt</code> files</li>
  <li>Interpreted movement information</li>
  <li>Drew the robot path inside the maze</li>
</ul>

<p>
Although real-time visualization was initially planned, the final implementation only allowed the trajectory to be displayed after stopping the Python execution.
</p>

<hr>

<h2>🎨 Color Detection Attempt</h2>

<p>
An additional subsystem using the <b>TCS3200 color sensor</b> was planned to allow color detection inside the maze.
</p>

<p>
However, due to the complexity of integrating the color detection module with the complete FPGA robotic system, this functionality could not be fully implemented.
</p>

<hr>

<h2>⚠️ Challenges</h2>

<p>
Some of the main development challenges included:
</p>

<ul>
  <li>Integrating multiple ultrasonic sensors simultaneously</li>
  <li>Synchronizing motor control with sensor readings</li>
  <li>Combining the TCS3200 color detection module with the complete FPGA system</li>
  <li>Achieving real-time maze visualization using Python and MQTT</li>
</ul>

<p>
Another major challenge was the robot's physical stability.
Due to the considerable weight of the FPGA board and the power bank mounted on the chassis, the robot became mechanically unstable during movement.
</p>

<p>
This instability affected:
</p>

<ul>
  <li>Ultrasonic sensor measurements</li>
  <li>Movement consistency</li>
  <li>Wall detection accuracy</li>
</ul>

<p>
As a result, the robot occasionally collided with maze walls or produced irregular movement behavior.
</p>

<hr>

<h2>🎥 Demonstration Videos</h2>

<h3>First test of the robot's movement</h3>

https://github.com/user-attachments/assets/98c5cdb7-cb9d-406e-a1f0-3bf14a09bf7a

<h3>Various functional tests in controlled mazes</h3>

https://github.com/user-attachments/assets/cbb3ff90-ad38-4496-a2b7-a074c4b2470b

<h3>Best test passed by the robot (Road closed)</h3>

https://github.com/user-attachments/assets/c32b81dc-f995-4fb1-bbc6-281772fb088d

<hr>

<h2>📚 Learning Outcomes</h2>

<p>
This project strengthened knowledge in:
</p>

<ul>
  <li>FPGA system integration</li>
  <li>Digital system architecture</li>
  <li>Autonomous robotics</li>
  <li>FSM design</li>
  <li>Embedded communication systems</li>
  <li>Sensor fusion</li>
  <li>Python data visualization</li>
  <li>Hardware/software integration</li>
</ul>

<h2>👤👤👤 Team</h2>
<ul>
  <li>Andrés Eduardo Guzmán Cuberos</li>
  <li>Maria Paula Pérez Vargas</li>
  <li>Isaac Ricardo Hernández Valdés</li>
</ul>

---
*Course: Electrónica Digital II – Universidad Nacional de Colombia (2024‑1)*  
*Professor: Óscar Julián Perdomo Charry*
