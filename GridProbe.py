import waypoints as wp
import kg_robot as kgr
import time

def newspot(x, y):
    time_start = time.time()
    urnie.movel([0.439+x/1000, -0.200+y/1000, 0, -3.142, 0, 0], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    while time.time() - time_start < 15:
        continue

urnie = kgr.kg_robot(port=30010, db_host="169.254.226.50")
urnie.set_tcp(wp.probing_tcp)

urnie.movel([0.439, -0.200, 0, -3.142, 0, 0], acc=0.02, vel=0.02)
newspot(0, 0)
newspot(9, 0)
newspot(18, 0)
newspot(27, 0)
newspot(36, 0)
newspot(45, 0)

newspot(0, 9)
newspot(9, 9)
newspot(18, 9)
newspot(27, 9)
newspot(36, 9)
newspot(45, 9)

newspot(0, 18)
newspot(9, 18)
newspot(18, 18)
newspot(27, 18)
newspot(36, 18)
newspot(45, 18)

newspot(0, 27)
newspot(9, 27)
newspot(18, 27)
newspot(27, 27)
newspot(36, 27)
newspot(45, 27)

newspot(0, 36)
newspot(9, 36)
newspot(18, 36)
newspot(27, 36)
newspot(36, 36)
newspot(45, 36)

newspot(0, 45)
newspot(9, 45)
newspot(18, 45)
newspot(27, 45)
newspot(36, 45)
newspot(45, 45)

urnie.close()
