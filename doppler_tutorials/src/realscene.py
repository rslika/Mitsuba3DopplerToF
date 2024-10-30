import mitsuba as mi
from program_runner import *
mi.set_variant("cuda_rgb")
scene = mi.load_file("./scenes/cornell-box/doppler_point_correlated_sampler_forward_real.xml")
image = mi.render(scene, spp=256)

mi.util.write_bitmap("my_first_render.png", image)