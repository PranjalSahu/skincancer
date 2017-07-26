#ruby copyfile.rb "melanoma_negative_test"

require 'fileutils'
filename = ARGV[0]
foldername = ""
if filename.include?("_negative_")
foldername = "melanoma_negative"
else
foldername = "melanoma_positive"
end
a = File.read(filename)
a = a.split("\n")
a.each do |s|
name = s
src_filename  = "/home/psahu/DATASETS/ISIC-images/#{name}"
image_name    = filename.split("/")[1]
dest_filename = "/home/psahu/DATASETS/ISIC-images/#{foldername}/#{image_name}"  
FileUtils.cp(src_filename, dest_filename)
end

