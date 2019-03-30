import numpy as np


# helper function used to convert Xtrn into X - M-by-D data matrix of doubles(floats)
def convertX (X):
    X = X.astype(np.float)
    for i in range(len(X)):
        X[i, :] = X[i, :] / 255.0
    return X