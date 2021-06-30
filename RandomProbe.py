import waypoints as wp
import kg_robot as kgr
import time
import random

#upper_bound = 30
#lower_bound = 15
upper_bound = 60
lower_bound = 20

def newspot(x, y, time_start):
    #urnie.movel([0.439+x/1000, -0.200+y/1000, 0, -3.142, 0, 0], acc=0.02, vel=0.02)
    urnie.movel([-0.0721 + x / 1000, -0.316 + y / 1000, 0.0260109, 1.87748, -2.50178, 0.0212946], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(2)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    while time.time() - time_start < 10:
        continue


file = open("RandomLocations.txt", 'w')
urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)

#urnie.movel([0.439, -0.200, 0, -3.142, 0, 0], acc=0.02, vel=0.02)
#urnie.movel([-0.0721309, -0.316214, 0.0260109, 1.87748, -2.50178, 0.0212946], acc=0.02, vel=0.02)

for i in range(50):
    time_start = time.time()
    x = random.random()*(upper_bound-lower_bound) + lower_bound
    y = random.random()*(upper_bound-lower_bound) + lower_bound
    newspot(x, y, time_start)
    line = str(x) + "," + str(y) + "\n"
    file.write(line)
    print(i)


urnie.close()
file.close()
