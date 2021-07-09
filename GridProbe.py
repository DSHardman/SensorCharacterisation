import waypoints as wp
import kg_robot as kgr
import time

#position = [-0.126935, -0.329702, 0, 1.89085, -2.50308, 0.0134363]  #left sensor
position = [0.00354907, -0.330353, 0, 1.8911, -2.50304, 0.0130892]  #right sensor

def newspot(x, y, position=position):
    input()
    urnie.movel([position[0] + x / 1000, position[1] + y / 1000, position[2] +0.0235, position[3], position[4], position[5]], acc=0.02, vel=0.02)
    urnie.translatel_rel([0, 0, -0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    time.sleep(2)
    urnie.translatel_rel([0, 0, 0.0235, 0, 0, 0], acc=0.02, vel=0.02)
    #while time.time() - time_start < 10:
    #    continue

urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.probing_tcp)

for i in range(5):
    newspot(14, 31)

for i in range(5):
    newspot(27, 31)

for i in range(5):
    newspot(18, 10)

for i in range(5):
    newspot(27, 18)


# newspot(10, 10)
# newspot(15, 10)
# newspot(20, 10)
# newspot(25, 10)
# newspot(30, 10)
# newspot(35, 10)
#
# newspot(10, 15)
# newspot(15, 15)
# newspot(20, 15)
# newspot(25, 15)
# newspot(30, 15)
# newspot(35, 15)
#
# newspot(10, 20)
# newspot(15, 20)
# newspot(20, 20)
# newspot(25, 20)
# newspot(30, 20)
# newspot(35, 20)
#
# newspot(10, 25)
# newspot(15, 25)
# newspot(20, 25)
# newspot(25, 25)
# newspot(30, 25)
# newspot(35, 25)
#
# newspot(10, 30)
# newspot(15, 30)
# newspot(20, 30)
# newspot(25, 30)
# newspot(30, 30)
# newspot(35, 30)
#
# newspot(10, 35)
# newspot(15, 35)
# newspot(20, 35)
# newspot(25, 35)
# newspot(30, 35)
# newspot(35, 35)

urnie.close()
