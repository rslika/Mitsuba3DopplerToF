import mitsuba as mi
mi.set_variant('cuda_rgb')
import os
import numpy as np
from utils.image_utils import *
from tqdm import tqdm, trange
from program_runner import *
for n in range (0,7):
    scene=mi.load_file("./scenes/cornell-box/doppler_point_correlated_sampler_backward"+str(n)+".xml")
    scene_name="velocity"
    run_scene_velocity(
        scene, 
        scene_name,
        base_dir="./results/gt_images/cornell-box/sinusoidal/depth_2_backward_512",
        output_file_name=str(n)+"_speed_gt",
        exit_if_file_exists=False,
        vmin_percentile=1,
        vmax_percentaile=99
    )