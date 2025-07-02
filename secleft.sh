time_arrive="9:15"
h_a=$(echo $time_arrive | cut -d":" -f1)
m_a=$(echo $time_arrive | cut -d":" -f2)
time_leave=$((($h_a + 9) * 3600 + $m_a * 60))

h=$(date +%k)
m=$(date +%-M)
s=$(date +%-S)
time_now=$(($h * 3600 + $m * 60 + $s))
time_left=$(($time_leave - $time_now))
echo "($time_left)"
