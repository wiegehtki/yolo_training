rm ~/autorennbahn
touch ~/autorennbahn
echo $(date -u) "start"  | tee -a  ~/autorennbahn
./darknet detector train ~/darknet/data/obj.data ~/darknet/cfg/autorennbahn.cfg ~/darknet/data/darknet53.conv.74 -map
echo $(date -u) "Ende"  | tee -a  ~/autorennbahn
