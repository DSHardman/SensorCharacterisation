import waypoints as wp
import kg_robot as kgr
import time
import random
from datetime import datetime

#upper_bound = 30
#lower_bound = 15

upper_bound = 35
lower_bound = 10

#upper_bound = 45
#lower_bound = 15

#position = [-0.126935, -0.329702, 0.00108133, 1.89085, -2.50308, 0.0134363]  #left sensor
position = [-0.0140974, -0.32761, 0.00108133, 1.89078, -2.50325, 0.0131431]  #right sensor

def newspot(x, y, time_start, position):
    urnie.movel([position[0] + x / 1000, position[1] + y / 1000, position[2] +0.0235, position[3], position[4], position[5]], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(2)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue

urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)
print(urnie.getl())
time.sleep(100)

for i in range(50):
    file = open("RandomLocations.txt", 'a')
    time_start = time.time()
    x = random.random()*(upper_bound-lower_bound) + lower_bound
    y = random.random()*(upper_bound-lower_bound) + lower_bound
    newspot(x, y, time_start, position)

    #now = datetime.now()
    #dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    #line = str(x) + "," + str(y) + "," + dt_string + "\n"
    line = str(x) + "," + str(y) + "\n"
    file.write(line)
    print(i)
    file.close()

urnie.close()