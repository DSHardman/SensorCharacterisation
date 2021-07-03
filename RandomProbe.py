import waypoints as wp
import kg_robot as kgr
import time
import random
from datetime import datetime

#upper_bound = 30
#lower_bound = 15
upper_bound = 45
lower_bound = 15

def newspot(x, y, time_start):
    #urnie.movel([-0.0489+x/1000, -0.321+y/1000, 0.021, 1.88051, -2.51452, 0.0161891], acc=0.02, vel=0.02)
    #urnie.movel([-0.0721 + x / 1000, -0.316 + y / 1000, 0.0260109, 1.87748, -2.50178, 0.0212946], acc=0.02, vel=0.02)
    urnie.movel([-0.0580 + x / 1000, -0.3546 + y / 1000, 0.0255, 1.8981, -2.5004, 0.00901938], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(2)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue

urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)

for i in range(50):
    file = open("RandomLocations.txt", 'a')
    time_start = time.time()
    x = random.random()*(upper_bound-lower_bound) + lower_bound
    y = random.random()*(upper_bound-lower_bound) + lower_bound
    newspot(x, y, time_start)

    #now = datetime.now()
    #dt_string = now.strftime("%d/%m/%Y %H:%M:%S")
    #line = str(x) + "," + str(y) + "," + dt_string + "\n"
    line = str(x) + "," + str(y) + "\n"
    file.write(line)
    print(i)
    file.close()

urnie.close()