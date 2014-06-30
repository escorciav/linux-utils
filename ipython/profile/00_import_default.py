import math
import matplotlib as mpl
import matplotlib.pyplot as plt
import os
import sys

# It allows to insert breakpoints as breakpoint()()
from IPython.core.debugger import Tracer as breakpoint

# The following lines call magic commands
from IPython.core.interactiveshell import InteractiveShell
get_ipython().run_line_magic(u"matplotlib", u"inline")
get_ipython().run_line_magic(u"pdb", u"")
