RunMpeg_MCC 是基于correntropy的仿射配准，程序运行过程中需要手动调节ICP.m中sigma值得大小以获得更好的配准结果。
RunMpeg_MSE是传统的仿射ICP配准算法。

注意：程序运行时，需要手动给定初值。即先在蓝色点集中取不共线的3个点，紧接着在红色点集中按顺序取其对应的3个点。