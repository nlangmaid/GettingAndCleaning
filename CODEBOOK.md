#Codebook for course project - Getting and Cleaning Data

The R script for this course project produces two files "result1" and "result2".

Both files are derived from original data downloaded from the Machine Learning Repository at UC Irvine. The original data are of measurements taken using the accelerometers and gyro in Samsung Galaxy S smartphones carried by test subjects while they performed a range of activities. Refer to the codebook accompanying the original data in the data folder for further details of thge experiment, the data, and the preliminary analysis already carried out.  

The file "result1" is derived from the original data and includes every variable in the original data that is contains the mean and standard deviation for a particular series of measurements. 

The file "result2" summarizes "result1" by providing the average of each variable over all observations for the same subject and activity.

Both files contain the same variables. They difer only in the degree of summarisation.

The variables follow a systematic naming convention to make them easier to understand:

* The first part of the name is either "time" or "freq". This indicates whether the variable is a measurement in the time domain or the result of a fast fourier transform into the frequency domain
* The second part of the name is the acceleration component or gyro angle that is being measured.
* The third part of the name is "X", "Y", "Z" or "Mag". This indicates the whether the measurement is directiona in the X,Y, or Z dimensions or is the magnitude calculated as the Euclidean norm.
* The fourth part of the name is either "mean" or "stdev". This indicates whether the data is a mean or standard deviation of the measured values over a particular experiment. 

For example, "time.GravityAcc.X.mean" is the mean value of measurements in the time domain of the acceleration due to gravity in the X dimension. And "time.GravityAcc.X.stdev" is the standard deviation of those same measurments.

The complete list of features is:

1. subject
2. activity
3. time.BodyAcc.X.mean 
4. time.BodyAcc.Y.mean
5. time.BodyAcc.Z.mean 
6. time.BodyAcc.X.stdev 
7. time.BodyAcc.Y.stdev 
8. time.BodyAcc.Z.stdev
9. time.GravityAcc.X.mean 
10. time.GravityAcc.Y.mean 
11. time.GravityAcc.Z.mean 
12. time.GravityAcc.X.stdev 
13. time.GravityAcc.Y.stdev 
14. time.GravityAcc.Z.stdev
15. time.BodyAccJerk.X.mean 
16. time.BodyAccJerk.Y.mean 
17. time.BodyAccJerk.Z.mean 
18. time.BodyAccJerk.X.stdev 
19. time.BodyAccJerk.Y.stdev 
20. time.BodyAccJerk.Z.stdev
21. time.BodyGyro.X.mean 
22. time.BodyGyro.Y.mean 
23. time.BodyGyro.Z.mean 
24. time.BodyGyro.X.stdev 
25. time.BodyGyro.Y.stdev 
26. time.BodyGyro.Z.stdev
27. time.BodyGyroJerk.X.mean 
28. time.BodyGyroJerk.Y.mean 
29. time.BodyGyroJerk.Z.mean 
30. time.BodyGyroJerk.X.stdev 
31. time.BodyGyroJerk.Y.stdev 
32. time.BodyGyroJerk.Z.stdev
33. time.BodyAcc.Mag.mean 
34. time.BodyAcc.Mag.stdev
35. time.GravityAcc.Mag.mean 
36. time.GravityAcc.Mag.stdev
37. time.BodyAccJerk.Mag.mean 
38. time.BodyAccJerk.Mag.stdev
39. time.BodyGyro.Mag.mean 
40. time.BodyGyro.Mag.stdev
41. time.BodyGyroJerk.Mag.mean 
42. time.BodyGyroJerk.Mag.stdev
43. freq.BodyAcc.X.mean 
44. freq.BodyAcc.Y.mean 
45. freq.BodyAcc.Z.mean 
46. freq.BodyAcc.X.stdev 
47. freq.BodyAcc.Y.stdev 
48. freq.BodyAcc.Z.stdev
49. freq.BodyAccJerk.X.mean 
50. freq.BodyAccJerk.Y.mean 
51. freq.BodyAccJerk.Z.mean 
52. freq.BodyAccJerk.X.stdev 
53. freq.BodyAccJerk.Y.stdev 
54. freq.BodyAccJerk.Z.stdev
55. freq.BodyGyro.X.mean 
56. freq.BodyGyro.Y.mean 
57. freq.BodyGyro.Z.mean 
58. freq.BodyGyro.X.stdev 
59. freq.BodyGyro.Y.stdev 
60. freq.BodyGyro.Z.stdev
61. freq.BodyAcc.Mag.mean 
62. freq.BodyAcc.Mag.stdev
63. freq.BodyAccJerk.Mag.mean 
64. freq.BodyAccJerk.Mag.stdev
65. freq.BodyGyro.Mag.mean 
66. freq.BodyGyro.Mag.stdev
67. freq.BodyGyroJerk.Mag.mean 
68. freq.BodyGyroJerk.Mag.stdev
