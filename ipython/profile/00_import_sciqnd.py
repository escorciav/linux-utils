import cPickle as pickle
import glob
import json
import math
import os
import sys

import cv2
import h5py
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd
import scipy as sp
import scipy.io
import scipy.stats
import skimage
import skimage.transform
import skimage.io

# The following lines call magic commands
get_ipython().run_line_magic(u"pdb", u"")
# Insert breakpoints as breakpoint()() instead of Tracer()() 
from IPython.core.debugger import Tracer as breakpoint
