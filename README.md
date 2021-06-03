# Training von Modellen mit YOLO, benötigt NVIDIA® - GPU mit CUDA® und cuDNN®
### Installation von YOLO (Tiny, v3 und v4) unter Ubuntu 18.04 / 20.04 LTS


#### Nach der Installation dieser Software könnt Ihr:
* Die Beispiele des WIEGEHTKI.DE - Videos zum Thema trainieren von YOLO-Modellen selbst nachvollziehen
* Eure eigenen YOLO-Modelle trainieren und nutzen


#### Videos zu diesem Projekt (und weitere) findet Ihr auf https://wiegehtki.de
* **Einführung in das Projekt:** https://youtu.be/l5IeFMQ0iQc
* **Installation des Betriebssystems:** https://youtu.be/_P9d5rERbBA


#### Aufsetzen des Systems:
Benötigt wird eine Ubuntu 18.04 / 20.04 LTS Umgebung. Empfohlen wird 20.04 da hier die Auslastung der GPU optimiert wurde. Ihr solltet eine Maschine explizit und nur dafür vorsehen (virtuell oder physisch) welche NICHT im produktiven Einsatz ist! Das System wird durch die nachfolgenden Schritte erheblich verändert und daher solltet Ihr dies ausschließlich auf dafür eiegns bereitgestellten Test-Systemen durchführen.

Ihr könnt den Ubuntu Server unter https://releases.ubuntu.com/18.04/ bzw https://releases.ubuntu.com/20.04/ runter laden. Anschließend das Image auf einen USB-Stick übertragen, zum Beispiel mit balenaEtcher (https://www.balena.io/etcher/) oder einem anderem Tool welches dafür geeignet ist.

Unter WIEGEHTKI.DE (https://www.youtube.com/channel/UC_OeEKyvDfCVdhYrEKYf1lA) findet Ihr den Video zur Installation


#### Notwendige Schritte VOR der weiteren Installation:
In diesem Projekt kommt eine NVIDIA® Grafikkarte zum Einsatz um den Prozessor von rechenintensiven Verarbeitungen zu befreien. Dazu setzen wir NVIDIA®'s CUDA® und cuDNN® ein. CUDA® ist eine Technologie, die es erlaubt Programmteile durch den Grafikprozessor abarbeiten zu lassen während die NVIDIA® CUDA® Deep Neural Network Bibliothek (cuDNN) eine GPU-beschleunigte Bibliothek mit Primitiven für tiefe neuronale Netzwerke darstellt. Solche Primitive, typischerweise neuronale Netzwerkschichten genannt, sind die grundlegenden Bausteine tiefer Netzwerke.

cuDNN® ist insofern nicht frei verfügbar als dass man sich bei NVIDIA® registrieren muss. Das ist aktuell kostenlos, nach der Registrierung startet eine sehr kurze Umfrage, wozu man das einsetzt und dann kommt man auf die Download-Site.

1. Der Link zur Registrierung: https://developer.nvidia.com/CUDNN. Dort auf **Download cuDNN** klicken und anschließend registrieren.
2. Nach erfolgreicher Reistrierung bitte in der Sektion **Download cuDNN v8.0.5 (November 9th, 2020), for CUDA 10.2** (das kann sich natürlich ggfs. ändern und etwas anders heißen) unter **Library for Linux, Ubuntu(x86_64 & PPC architecture)** die Datei **cuDNN Library for Linux (x86)** runter laden; **NICHT die Ubuntu-Dateien!** 
3. Die Datei per `scp` oder einem entsprechenden Tool direkt in das `/root/` - Verzeichnis kopieren.
4. Auf der Maschine anmelden und folgende Schritte ausführen, wobei `sudo su` nicht notwendig ist, wenn Ihr bereits **root** sein solltet.
```
       sudo su
       cd ~
       sudo chmod +x cudnn*     
```
Anschließend kommen wir zur eigentlichen Installation des Systems. Diese ist in zwei Stufen unterteilt: In Stufe 1 installieren wir einige Standard-Pakete und de-aktivieren den bisherigen Grafiktreiber, anschließend startet das System neu. Der Script geht davon aus, dass es sich um eine neu aufgesetzte Maschine handelt, falls nicht, müsst Ihr entsprechende Anpassungen machen oder die Befehle per Hand ausführen um sicher zu gehen, dass eine vorhandene Installation nicht beeinträchtigt wird. Empfohlen wird daher, ein verfügbares Testsystem zu nutzen welches neu aufgesetzt werden kann.

#### Zur Installation könnt ihr wie folgt vorgehen, dazu alle Befehle im Terminal ausführen:
Einloggen und dann die erste Stufe der Installation starten, der Rechner rebootet danach automatisch:
```
       sudo su
       cd ~
       git clone https://github.com/wiegehtki/yolo_training.git
       cp yolo_training/*sh .
       sudo chmod +x *sh
       ./Initial.sh      
```


**Wichtig:** Der Installationsprozess ist in 2 Schritte unterteilt, **Initial.sh** und **Final.sh** und erfordert ein paar Betsätigungen durch den Benutzer.
1.  Nach der Ausführung von Initial.sh und anschließendem Neustart: Erneut Einloggen und dann die zweite und letzte Stufe der Installation starten:
```
       sudo su
	   cd ~
       ./Final.sh  
```


#### Kontrolle des Installationsfortschritts

Ein weiteres Terminalfenster öffnen und mit `cat Installation.log` bzw. `cat FinalInstall.log` den Fortschritt der Installationen kontrollieren.
   
Nach der Installation einen `reboot` ausführen.
  
Die **.weights - Dateien** sollten über den Installationsscript geladen werden.
Falls nicht, hier die Download-Links:

1. Download yolov3.weights: https://drive.google.com/file/d/10NEJcLeMYxhSx9WTQNHE0gfRaQaV8z8A/view?usp=sharing
2. Download yolov3-tiny.weights: https://drive.google.com/file/d/12R3y8p-HVUZOvWHAsk2SgrM3hX3k77zt/view?usp=sharing
3. Download yolov4.weights: https://drive.google.com/file/d/1Z-n8nPO8F-QfdRUFvzuSgUjgEDkym0iW/view?usp=sharing

### Optimierungen

### Bekannte Fehler und deren Behebungen
1. **Beim Aufruf eines Installationsscripts kommt die Fehlermeldung `/usr/bin/env: ‘bash\r’: No such file or directory`** 
   Wenn dieser Fehler auftritt, dann folgende Schritte durchführen:
	* sed $'s/\r$//' -Script bei dem der Fehler auftriit, z.B. Initial.sh- > -Neues Script, z.B. InitialNeu.sh-
	* chmod +x *
	* Aufruf des neuen Scripts, z.B.: ./InitialNeu.sh


