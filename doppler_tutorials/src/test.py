import mitsuba as mi
mi.set_variant('cuda_rgb')
import os
import numpy as np
from utils.image_utils import *
from tqdm import tqdm, trange
from program_runner import *
for n in range (0,7):
    scene=mi.load_file("./scenes/cornell-box/doppler_point_correlated_sampler_ball"+str(n)+".xml")
    scene_name="velocity"
    run_scene_velocity(
        scene, 
        scene_name,
        base_dir="./result",
        output_file_name="test"+str(n),
        exit_if_file_exists=False,
        vmin_percentile=1,
        vmax_percentaile=99
    )