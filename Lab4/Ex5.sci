clf
// Read the RGB image
rawImage = imread("C:\HCMUT\HK232\CO2036\Lab4\exampleImage.jpg");

// Convert to grayscale
grayImage = rgb2gray(rawImage);

// Visualize: RED
subplot(2, 2, 1)
imhist(rawImage(:, :, 1), 10, 'red');
title("RED")
ylabel("Occurrence")

// Visualize: GREEN
subplot(2, 2, 2)
imhist(rawImage(:, :, 2), 10, 'green');
title("GREEN")
ylabel("Occurrence")

// Visualize: BLUE
subplot(2, 2, 3)
imhist(rawImage(:, :, 3), 10, 'blue');
title("BLUE")
ylabel("Occurrence")

// Visualize: GRAY
subplot(2, 2, 4)
imhist(grayImage, 10, 'gray');
title("GRAY")
ylabel("Occurrence")
