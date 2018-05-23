#
# Batch email tester for terminal (mac)
# v0.1 by Patrick Cash
# 
# Populate emails.txt with one test email per line
# Use 'dig +short MX mydomain.com' to determine target
#   mx server and populate below
# Run from terminal and pipe output to file
#
# Note: USE CAREFULLY. May get your IP banned.
#

cat emails.txt | while read i; do
	echo $i
	(
		echo "HELO sample.com" # dummy, no need to replace
		sleep 0.05
		echo "MAIL FROM:<postman@sample.com>" # dummy, no need to replace
		sleep 0.05
		echo "RCPT TO:<"$i">"
		sleep 0.05
		echo "QUIT"
	) | nc MX.MYDOMAIN.COM 25 # replace with target MX server
done