import numpy as np
import scipy as sc
from convertX import *
#from montage import *


# DELETE
from load_my_data_set import *
from disp_one import *

dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\cwk2\d\s1705544'
Xtrn, Ytrn, Xtst, Ytst = load_my_data_set(dset_dir)



# USES HELPER FUNCTION convertX
# to convert Xtrn into X - M-by-D data matrix of doubles(floats)

# output was generated using task1_1(convertX(Xtrn), Ytrn)
def task1_1(X, Y):
    # Input:
    # X : M-by-D data matrix (double)
    # Y : M-by-1 label vector (uint8)

# create a zero 10-by-784 matrix to represent first 1- samples of the class
    class_X = np.zeros((10,784), float)
    # keeps track of the number of samples
    count = 0
    class_label = 0
    for i in range(len(Y)):
        # find the first 10 samples of a class
        if Y[i] == class_label :
            class_X[count, :] = X[i,:]
            count += 1
        if count >= 10 :
            # present the 10 first samples of a class before moving onto the next one
            montage(class_X)
            count = 0
            class_label += 1
            class_X = np.zeros((10,784), float)
            i = 0
            if class_label >= 10 : break
