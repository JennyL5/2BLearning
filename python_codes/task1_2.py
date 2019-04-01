def task1_2(X, Y):
    # Input:
    # X : M-by-D data matrix (double)
    # Y : M-by-1 label vector (uint8)
    # Output:
    # M : (K+1)-by-D mean vector matrix (double)
    # Note that M[K+1, :] is the mean vector of X
    M = []
    data = np.array([my_mean(np.array([x for i, x in enumerate(X) if Y[i] == c][:10]), axis=0) for c in range(10)])
    whole_average = my_mean(Xtrn, axis=0)
    M = np.vstack((data, whole_average))

    return M


dtype = np.float64
dset_dir = 'C:\Users\Jenny\Documents\INF2B-CW2\Original\d\s1705544'
Xtrn, Ytrn, Xtst, Ytst = load_my_data_set(dset_dir)

M = task1_2(Xtst, Ytst)
# Create a montage of the result
montage(M)
# Save result to .mat
sio.savemat("task1_2_M.mat",{"M":M})