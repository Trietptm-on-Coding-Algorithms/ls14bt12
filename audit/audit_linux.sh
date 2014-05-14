#! /bin/shell

##R1 : Ports ouvert :
netstat -anptue > ports.txt

##R2 : Routes
netstat -rn > routes.txt

##R3 : Dossiers partage

##R4 : Config interfaces
netstat -ie > interfaces.txt

##R5 : Stat protocole reseau
netstat -s > statproto.txt

##L1 : Services / Daemon
for user in $(cut -f1 -d: /etc/passwd); do echo -e "\n\n==> $user:" && crontab -u $user -l; done 2>> crontab.txt >> crontab.txt

##L2 : Logiciel
dpkg -l > paquets.txt

##L3 : Tâche
ls -al /etc/cron.* > taches.txt
tar -czvf cron.tar.gz /etc/cron*

##L4 : processus
ps -aux > ps.txt

##L5 : Vulnérabilité

##C1 : Démarrage
ls -l /etc/init/ /etc/init.d/ > startup.txt
tar -czvf init.tar.gz /etc/init/* /etc/init.d/*

##C2 : plugin IE & Firefox

##C3 : users & group
cp /etc/passwd /etc/shadow /etc/group ./

##C4 : SUID & SGUID
find / -type f \( -perm -004000 -o -perm -002000 \) -exec ls -lg {} \; 2>/dev/null >suidfiles.txt

