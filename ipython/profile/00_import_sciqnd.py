import cPickle as pickle
import os
import sys

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

import cv2

# The following lines call magic commands
get_ipython().run_line_magic(u"pdb", u"")
# Insert breakpoints as breakpoint()() instead of Tracer()() 
from IPython.core.debugger import Tracer as breakpoint
