#Example usage
#ruby prepare.rb "melanoma_positive_train" "melanoma_negative_train" "../training_groundtruth.csv"
#ruby prepare.rb "melanoma_positive_validation" "melanoma_negative_validation" "../training_groundtruth.csv"
#ruby prepare.rb "melanoma_positive_test" "melanoma_negative_test" "../training_groundtruth.csv"


train     = "../training_groundtruth.csv"
test      = "../test_ground_600.csv"
validate  = "../test_groundtruth.csv"


h = {}
a = Dir.glob("**/*.jpg");
a.each do |f|
p  = f.split("/")
h[p[1]] = f
end
positive = []
negative = []
filename1 = ARGV[0] #positive
filename2 = ARGV[1] #negative
csvfile   = ARGV[2] #inputfile
s = File.read(csvfile);
s = s.split("\r\n");
s = s[1..-1]
s.each do |t|
pt = t.split(",")
if pt[1] == "1.0"
positive << h[pt[0]+".jpg"]
else
negative << h[pt[0]+".jpg"]
end
end
File.open(filename1, 'w') { |file| file.write(positive.join("\n")) }
File.open(filename2, 'w') { |file| file.write(negative.join("\n")) }
