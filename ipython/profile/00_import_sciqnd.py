import cPickle
import cv2
import matplotlib as mpl
import matplotlib.pyplot as plt
import numpy as np
import os
import scipy as sp
import skimage
import sys

# The following lines call magic commands
from IPython.core.interactiveshell import InteractiveShell
get_ipython().run_line_magic(u"matplotlib", u"inline")
get_ipython().run_line_magic(u"pdb", u"")

# It allows to insert breakpoints as Tracer()()                                 
from IPython.core.debugger import Tracer as breakpoint
