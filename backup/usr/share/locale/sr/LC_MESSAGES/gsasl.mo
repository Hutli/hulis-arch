��    2      �  C   <      H  )   I     s     �     �  3   �  (   �  B     B   ]  '   �     �      �  3        9     N     c  3        �  /   �  /   �  &   (     O  &   a  *   �  !   �  ,   �  +        .     A  '   ^  %   �  "   �     �  #   �     	     "	     <	  .   M	     |	     �	  #   �	  ,   �	  !   �	     
  (   &
  "   O
  #   r
  '   �
  %   �
     �
  �    R   �  2   F  (   y  (   �  d   �  G   0  �   x  �   �  J   ~  7   �  9     X   ;     �     �  4   �  d     &   h  F   �  D   �  A        ]  6   {  A   �  C   �  N   8  I   �  !   �  2   �  V   &  >   }  F   �  %     6   )     `  (   ~  #   �  H   �  B     E   W  3   �  H   �  <        W  G   s  _   �  4     ?   P  H   �  :   �            '   -               	                  &   .              %                 (               /          2             
      #               1                 "   !       +   )   *                                0   $      ,       Base64 encoded application data to send:
 Cannot find mechanism...
 Choose SASL mechanism:
 Chose SASL mechanisms:
 Client authentication finished (server trusted)...
 Enter application data (EOF to finish):
 Enter base64 authentication data from client (press RET if none):
 Enter base64 authentication data from server (press RET if none):
 GnuTLS global initialization failed: %s GnuTLS handshake failed: %s GnuTLS initialization failed: %s Input list of SASL mechanisms supported by server:
 Output from client:
 Output from server:
 SASL record too large: %zu
 Server authentication finished (client trusted)...
 Session finished...
 This client supports the following mechanisms:
 This server supports the following mechanisms:
 Try `%s --help' for more information.
 Using mechanism:
 allocating X.509 GnuTLS credential: %s allocating anonymous GnuTLS credential: %s cannot use both --smtp and --imap cannot use both --starttls and --no-starttls could not verify server certificate (rc=%d) encoding error: %s error listing mechanisms: %s error: could not parse server data:
%s
 error: server did not return a token
 getting channel binding failed: %s initialization failure: %s loading X.509 GnuTLS credential: %s mechanism error: %s mechanism unavailable: %s missing argument need both --x509-cert-file and --x509-key-file no X.509 CAs found no X.509 CAs found: %s server certificate has been revoked server certificate hasn't got a known issuer server certificate is not trusted server error setting GnuTLS cipher priority (%s): %s
 setting GnuTLS defaults failed: %s setting X.509 GnuTLS credential: %s setting anonymous GnuTLS credential: %s terminating GnuTLS session failed: %s verifying peer certificate: %s Project-Id-Version: gsasl-1.7.4
Report-Msgid-Bugs-To: bug-gsasl@gnu.org
POT-Creation-Date: 2012-05-28 19:14+0200
PO-Revision-Date: 2012-05-24 22:19+0200
Last-Translator: Мирослав Николић <miroslavnikolic@rocketmail.com>
Language-Team: Serbian <gnu@prevod.org>
Language: sr
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Plural-Forms: nplurals=3; plural=(n%10==1 && n%100!=11 ? 0 : n%10>=2 && n%10<=4 && (n%100<10 || n%100>=20) ? 1 : 2);
 Кодирани подаци програма у основи64 за слање:
 Не могу да пронађем метод...
 Изаберите САСЛ метод:
 Изаберите САСЛ метод:
 Потврђивање клијента је завршено (серверу се верује)...
 Унесите податке за обраду (<EOF> за крај):
 Унесите податке за потврду клијента у основи64 (притисните <RET> за ништа):
 Унесите податке за потврду сервера у основи64 (притисните <RET> за ништа):
 није успело глобално ГнуТЛС покретање: %s није успело ГнуТЛС руковање: %s није успело ГнуТЛС покретање: %s Улазни списак САСЛ метода које подржава сервер:
 Излаз клијента:
 Излаз сервера:
 Снимак САСЛ-а је превелик: %zu
 Потврђивање сервера је завршено (клијенту се верује)...
 Сесија је завршена...
 Овај клијент подржава следеће методе:
 Овај сервер подржава следеће методе:
 Пробајте „%s --help“ за више података.
 Користим метод:
 добављам X.509 ГнуТЛС уверење: %s добављам анонимно ГнуТЛС уверење: %s не могу да користим и „--smtp“ и „--imap“ не могу да користим и „--starttls“ и „--no-starttls“ не могу да проверим уверење сервера (rc=%d) грешка кодирања: %s грешка исписивања метода: %s грешка: не могу да рашчланим податке сервера:
%s
 грешка: сервер није вратио симбол
 није успело добављање везова канала: %s неуспех покретања: %s учитавам X.509 ГнуТЛС уверење: %s грешка метода: %s метод није доступан: %s недостаје аргумент потребни су и „--x509-cert-file“ и „--x509-key-file“ нисам пронашао Х.509 издаваче уверења нисам пронашао X.509 издаваче уверења: %s уверење сервера је повучено уверење сервера нема познатог издавача уверење сервера није од поверења грешка сервера задајем приоритет ГнуТЛС шифрера (%s): %s
 није успело подешавање основних ГнуТЛС вредности: %s задајем X.509 ГнуТЛС уверење: %s задајем анонимно ГнуТЛС уверење: %s није успело завршавање ГнуТЛС сесије: %s проверавам парњаково уверење: %s 