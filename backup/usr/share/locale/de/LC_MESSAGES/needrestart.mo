��    &      L  5   |      P  h   Q  �   �     V  "   m     �  1   �  -   �  #     !   0  /   R  �   �  4  W     �     �     �  F   �  &        <     S     o     �      �  *   �     �  C   	  S   H	  b   �	  g   �	  /   g
  (   �
     �
     �
     �
     �
               9    K     _  �   �     �  *   �  ,   �  D   
  8   O  0   �  -   �  8   �  �      )  �     (     >     Y  O   y      �     �     �          0  (   C  5   l  *   �  D   �  G     ]   Z  Z   �  $     *   8     c     w     �     �     �     �     �     #          
   &                !                                                                                             	   $   "                    %                         
This system runs {ehint}. For more details, run «needrestart -m a».

You should consider rebooting!

   (Y)es  - restart this service
  (N)o   - do not restart this service
  (A)uto - auto restart all remaining services
  (S)top - stop restarting services

 Available UI packages: Container restarts being deferred: Containers to be restarted: Failed to check for processor microcode upgrades. Failed to retrieve available kernel versions. No containers need to be restarted. No services need to be restarted. No user sessions are running outdated binaries. Pending kernel upgrade!

Running kernel version:
  {kversion}

Diagnostics:
  {message}

Restarting the system to load the new kernel will not be handled automatically, so you should consider rebooting. [Return]
 Pending processor microcode upgrade!

Diagnostics:
  The currently running processor microcode revision is {current} which is not the expected microcode revision {avail}.

Restarting the system to load the new processor microcode will not be handled automatically, so you should consider rebooting. [Return]
 Restart «{rc}»? Restarting containers... Restarting services... Running kernel seems to be up-to-date (ABI upgrades are not detected). Running kernel seems to be up-to-date. Scanning candidates... Scanning kfreebsd images... Scanning linux images... Scanning processes... Service restarts being deferred: Service restarts being refused by systemd: Services to be restarted: The currently running kernel has an ABI compatible upgrade pending. The currently running kernel version is not the expected kernel version {eversion}. The currently running kernel version is {kversion} and there is an ABI compatible upgrade pending. The currently running kernel version is {kversion} which is not the expected kernel version {eversion}. The processor microcode seems to be up-to-date. User sessions running outdated binaries: Your outdated processes: an outdated kernel image and outdated binaries outdated containers outdated processor microcode outdated sessions Project-Id-Version: needrestart 2.8
Report-Msgid-Bugs-To: thomas@fiasko-nw.net
PO-Revision-Date: 2018-02-11 15:10+0100
Last-Translator: Thomas Liske <thomas@fiasko-nw.net>
Language: de
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
 
Das System verwendet {ehint}. Der Befehl »needrestart -m a« zeigt mehr Details.

Ein Neustart sollte durchgeführt werden!

   ja (Y) - diesen Dienst neu starten
  (N)ein - diesen Dienst nicht neu starten
  (A)uto - alle weiteren Dienste automatisch neu starten
  (S)top - keine weiteren Dienste neu starten

 Verfügbare Oberflächen: Container deren Neustart verschoben wurde: Container, die neu gestartet werden müssen: Fehler beim Ermitteln von verfügbaren Prozessor Mikrocode-Upgrades. Fehler beim Ermitteln der verfügbaren Kernel-Versionen. Es müssen keine Container neu gestartet werden. Es müssen keine Dienste neugestartet werden. Es gibt keine Nutzer-Sitzungen mit veralteten Prozessen. Ausstehendes Kernel-Upgrade!

Laufende Kernel-Version:
  {kversion}

Diagnose:
  {message}

Das System wird nicht automatisch neu gestartet um den neuen Kernel zu laden. Ein Neustart sollte durchgeführt werden. [Return]
 Ausstehendes Prozessor Mikrocode-Upgrade!

Diagnose:
  Die aktuelle Prozessor Mikrocode-Revision ist {current} statt der erwarteten Mikrocode-Revision {avail}.

Das System wird nicht automatisch neu gestartet um den Prozessor Mikrocode zu laden. Ein Neustart sollte durchgeführt werden. [Return]
 »{rc}« neu starten? Neustart von Containern... Dienste werden neu gestartet... Der laufende Kernel ist aktuell (ABI Änderungen können nicht erkannt werden). Der laufende Kernel ist aktuell. Prüfe Kandidaten... Prüfe kFreeBSD-Kernel... Prüfe Linux-Kernel... Prüfe Prozesse... Dienste deren Neustart verschoben wurde: Dienste die durch systemd nicht neu gestartet werden: Dienste, die neu gestartet werden müssen: Für den laufende Kernel ist ein ABI-kompatibles Upgrade ausstehend. Die aktuelle Kernel-Version ist nicht die erwartete Version {eversion}. Die aktuelle Kernel-Version ist {kversion} und es ist ein ABI-kompatibles Upgrade ausstehend. Die aktuelle Kernel-Version ist {kversion} was nicht die erwartete Version {eversion} ist. Der Prozessor Mikrocode ist aktuell. Nutzer-Sitzungen mit veralteten Prozessen: Veraltete Prozesse: eine veraltete Kernel-Version und veraltete Programme veraltete Containern veralteter Prozesse Mikrocode veraltete Sitzungen 