import waypoints as wp
import kg_robot as kgr
import time
import serial
import numpy as np
import random
import nidaqmx as ni
from nidaqmx.constants import TerminalConfiguration

timebefore = 1
timedown = 1.5
timepressed = 5
timeup = 1.5
timeafter = 6
dt = 0.05


duration = timebefore + timeafter + timedown + timeup + timepressed
samplesdown = int(timedown/dt)
samplesup = int(timeup/dt)

#  Connect to UR5
urnie = kgr.kg_robot(port=30010, db_host="169.254.150.50")
urnie.set_tcp(wp.probing_tcp)

# zeropose = [-0.216919, -0.543357, 0.160562, 3.12999, 0.13056, -0.00871447]
zeropose = urnie.getl()
print(urnie.getl())
# zeropose = [-0.196863, -0.488613, 0.211921, 3.13003, 0.130494, -0.00867028]


def probe(x, y, depth):
    x = x/1000
    y = y/1000
    depth = depth/1000

    # Control press using defined variables
    startingpose = np.add(zeropose, [x, y, 0.01, 0, 0, 0])
    urnie.movel(startingpose, acc=0.01, vel=0.01)

    poses = 0
    poses = np.ones((int(duration/dt), 1))*startingpose

    for j in range(int(timebefore/dt), int(timebefore/dt) + samplesdown):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01)*(j - int(timebefore/dt))/samplesdown, 0, 0, 0])

    for j in range(int(timebefore/dt) + samplesdown, int((timebefore+timedown+timepressed)/dt)):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01), 0, 0, 0])

    for j in range(int((timebefore+timedown+timepressed)/dt), int((timebefore+timedown+timepressed)/dt) + samplesup):
        poses[j] = np.add(poses[j], [0, 0, -(depth+0.01) + ((depth+0.01)*(j - int((timebefore+timedown+timepressed)/dt))/samplesup),
                                     0, 0, 0])

    urnie.movel(poses[0], acc=0.02, vel=0.02)

    urnie.movel(poses[0], acc=0.02, vel=0.02)
    t0 = time.time()

    for k in range(0, int(duration/dt)):
        urnie.servoj(poses[k], control_time=dt, lookahead_time=0.2)
        while time.time() - t0 < dt*(k+1):
            continue

    urnie.movel(startingpose, acc=0.02, vel=0.02)


def probe5(x, y, depth):
    for i in range(5):
        probe(x, y, depth)

#
# for depth in range(1, 23):
#     probe(18, 18, depth/10)
#
# for depth in range(1, 23):
#     probe(18, 18, (23-depth)/10)

print('A')
probe5(4.5, 4.5, 2)
probe5(4.5, 4.5, 1)
print('B')
probe5(4.5, 18, 2)
probe5(4.5, 18, 1)
print('C')
probe5(27, 9, 2)
probe5(27, 9, 1)
print('D')
probe5(18, 18, 2)
probe5(18, 18, 1)



urnie.close()
