import waypoints as wp
import kg_robot as kgr
import time

def newspot(x, y):
    urnie.movel([0.439+x/1000, -0.200+y/1000, 0, -3.142, 0, 0], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(5)

urnie = kgr.kg_robot(port=30010, db_host="169.254.226.50")
urnie.set_tcp(wp.probing_tcp)

#urnie.movel([0.439, -0.200, -0.01, -3.142, 0, 0], acc=0.02, vel=0.02)

#urnie.movel([0.484, -0.155, -0.01, -3.142, 0, 0], acc=0.02, vel=0.02)

urnie.movel([0.484, -0.200, -0.01, -3.142, 0, 0], acc=0.02, vel=0.02)

urnie.close()
