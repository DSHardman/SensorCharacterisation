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

urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)


#for i in range(10):
#    newspot(22.5, 22.5)
    #newspot(30.5, 30.5)

urnie.movel([-0.0721309, -0.316214, 0.0260109, 1.87748, -2.50178, 0.0212946], acc=0.02, vel=0.02)
urnie.close()

