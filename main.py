import waypoints as wp
import kg_robot as kgr
import time
import numpy

urnie = kgr.kg_robot(port=30010, db_host="169.254.155.50")
urnie.set_tcp(wp.scooping_tcp)

theta = 45 # in degrees
theta = numpy.pi*theta/180  # convert to radians

urnie.movel([-0.0420294, -0.605, 0.10, 1.25404, -2.83583, 0.0308071], 0.01, 0.01)

urnie.movel_tool([0, 0, 0, theta/numpy.sqrt(2), -theta/numpy.sqrt(2), 0], acc=0.01, vel=0.01)
urnie.translatel_rel([0.04,0,0.08,0,0,0], 0.5, 0.01)

urnie.close()
