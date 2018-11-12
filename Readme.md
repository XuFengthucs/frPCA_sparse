#Programs of fast randomized PCA algorithms for Sparse Data
---
##1.Main Algorithms

1.matlab/eigSVD.m  ---- the algorithm used for doing ecnomic/truncated singular value decomposition by using eigendecomposition in [1] implemented by Matlab, and the parameter k is used for truncated singular value decomposition

2.matlab/frPCA.m ---- the algorithm used for fast randomized PCA for sparse data in [1] implemented by Matlab, and the parameter mode is used for the different size of the initial data matrix

3.matlab/frpca.c ---- the frPCA and frPCAt algorithms in [1] which is implemented with ICC and OpenMP, the basic rPCA in [2] is included in the file. 

##2.Experiments of testing

(1)The ICC compiler needs the support of Intel MKL [3], and when all the things have been prepared, first run "source source_script.sh", and then run the "source compile.sh", then the excutable program will be compiled. The resuled program is an example of testing the dataset SNAP [4].

(2)The SNAP dataset is included in the the icc folder, and the Movielens datasets [5] can be downloaded from the website https://grouplens.org/datasets/movielens/.

(3)The matrix index should begin with 1 when using those programs, or the reuslts may become false.

##Rederence

[1] Xu Feng, Yuyang Xie, and Yaohang Li, "Fast Randomzied PCA for Sparse Data," in Proc. the 10th Asian Conference on Machine Learning (ACML), Beijing, China, Nov. 2018 (accepted).

[2] N Halko, P. G Martinsson, and J. A Tropp. Finding structure with randomness: Probabilistic algorithms for constructing approximate matrix decompositions. Siam Review, 53(2):217-288, 2011. 

[3] Intel parallel studio xe cluster edition for linux. https://software.intel.com/en-us/intel-parallel-studio-xe, 2018.

[4] Jure Leskovec and Andrej Krevl. SNAP Datasets: Stanford large network dataset collection. http://snap.stanford.edu/data, June 2014.

[5] F. Maxwell Harper and Joseph A. Konstan. The movielens datasets: History and context. ACM Transactions on Interactive Intelligent Systems (TiiS), 5(4):19, 2016.
