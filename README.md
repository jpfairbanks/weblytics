# Weblytics

A Docker image for writing web applications for analytics and data science.

## Contents

This image contains libraries for data analysis in python along with their
binary dependencies, the deb packages in ./packages are built on ubuntu and
vendored here for consistency.

We use apt-get to install some dependencies and pip to install the rest.

## Uses

This image can be used to write a webserver that talks to databases and
performance data analysis and machine learning. You can serve up the results of
this analysis. 

## Contributing

If you think this image can be improved let me know by filing an issue on
github. The purpose of this image is to be generally useful for analysis web
applications. I would like to keep it lightweight, but if it contains things you
need, feel free to fork it and remove them. 
