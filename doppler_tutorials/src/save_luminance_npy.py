
import mitsuba as mi
import time
mi.set_variant('cuda_rgb')
import os
import numpy as np
from utils.image_utils import *
from tqdm import tqdm, trange
import main_experiment

lt=time.strftime("%H.%M.%S", time.localtime())
img_dop= np.load("results/gt_images/living-room-2/sinusoidal/freq_1.000_offset_0.000/reference.npy")
img_dop=img_dop*0.01
name="test "+lt+"1.png"
save_tof_image(to_tof_image(img_dop, 0.0015), "results",name,vmax_percentaile=99.5,vmin_percentile=0.5) 