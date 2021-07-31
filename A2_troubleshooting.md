# Appendix - Troubleshooting 


## Running the (Ruby) Sample Code / Scripts

Q:  I try to run a script and I get an **"cannot load such file -- pixelart (LoadError)"**. 
Could somebody please help me out getting the script to run?

A:  The **"cannot load such file -- pixelart (LoadError)"**
error tells you that you need to install the [pixelart package](https://rubygems.org/gems/pixelart) called gems in rubyland. 

Try:

     $ gem install pixelart

To check all gems (ruby packages) that you have installed locally try:

     $ gem list

Now retry running your (ruby) script

