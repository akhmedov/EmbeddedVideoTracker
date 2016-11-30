#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>

int main(int argc, char* argv[]) 
{
	cv::Mat test = cv::Mat::zeros(1,1,CV_64F);
	/*cv::Mat image = cv::imread("camera_isn_available.jpg");
	cv::namedWindow("Image");
	cv::imshow("Image", image); */
	std::cout << "Hello, World!" << std::endl;
	return 0;
}
