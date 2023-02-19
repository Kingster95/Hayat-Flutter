import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

String getRandomQuote() {
  // can you make a function in flutter to return a random quote from a list without repeating
  List<String> quotes = [
    "Puterea mea stă in liniștea mea!",
    "Eu sunt copila iubită a Universului.",
    "Puterea stă in interiorul meu, nu in exteriorul meu.",
    "Feminitatea este cartea mea de vizită.",
    "Eu iubesc oamenii! ",
    "Oamenii gândesc despre mine ceea ce gândesc eu despre mine. Eu sunt minunată! ",
    "Eu mă iubesc necondiționat , doar pentru ca sunt! ",
    "Eu materializez tot ce-mi doresc. ",
    "Emoția mea autentică este iubirea.",
    "Eu trăiesc in plăcere și satisfacție. Corpul meu este relaxat. ",
    "Universul este foarte abundent cu mine.",
    "Astăzi se vor întâmpla 3 minuni.",
    "Eu sunt pregătită să primesc ceea ce mi se cuvine.",
    "Tot ce este nou e binevenit in viața mea.",
    "Astăzi trăiesc din binele meu.",
    "Eu vreau. Eu pot. Eu sunt! Universul ma aude. ",
    "Eu respect și admir bărbații.",
    "Iubirea mea sunt aripile mele.",
    "Eu îmi accept corpul. Prin el simt plăcerea. ",
    "Mă iubesc, mă respect și îmi sunt recunoscătoare pentru ceea ce sunt. ",
    "Eu sunt responsabilă de un singur lucru. De fericirea mea. ",
    "Astăzi eliberezi in Univers iubire, fericire și recunoștință. Viața este minunată.",
    "Astăzi aleg să mă concentrez doar pe lucrurile pozitive. Nimic nu mă scoate din echilibru. ",
    "Eu sunt recunoscătoare pentru această zi. Simt bucuria vieții. ",
    "Astăzi spre mine vor veni oportunități și eu le voi accepta cu bucurie. ",
    "Eu știu adevarul. Sunt o femeie puternică,fericită și liberă in manifestare. ",
    "Astăzi îmi accept “ Eu-l” suprem. Trăiesc pentru a aduce liniște, bucurie, plăcere in viața mea și a  celor din jur. ",
    "Astăzi nu vreau sa fiu bună, vreau sa fiu eu însumi. Nu voi face nimic împotriva mea. ",
    "Eu sunt minunată și merit cele mai frumoase lucruri in viața. ",
    "Viața mea este despre mine, nu despre părerile celorlalți despre mine. ",
    "Ziua de astăzi este șansa de a deveni mai bună decât cea de ieri. ",
    "Viața începe acum și aici. In acest moment decid să fiu fericită și voi face acțiunile necesare. ",
    "Astăzi îmi voi asculta intuiția și voi lua cele mai corecte decizii. ",
    "De astăzi nu mai trăiesc in trecut, trecutul nu există. Nu mai trăiesc cu neliniște pentru viitor, viitorul încă nu există.Tot ce am este acum și aici. ",
    "Astăzi am doar atitudine pozitivă, indiferent de dificultățile care apar in calea mea. Am absolut tot ce este nevoie pentru succes. ",
    "Eu sunt la timpul și locul potrivit. Aleg sa trăiesc in bucurie. ",
    "In orice situație, aleg gândurile care îmi amplifică liniștea interioară. ",
    "Începe chiar acum! Nu amâna binele. ",
    "Îmi trăiesc fiecare zi așa cum îmi doresc.",
    "Viața mea este plină de abundență.",
    "Eu las sa intre in viața mea liniștea și bucuria. ",
    "Eu mereu fac cea mai buna alegere.",
    "Modelarea realității începe prin modelarea gândurilor. ",
    "Sunt pregătită să ies la alt nivel, la o altă dimensiune a realității.",
    "Am suficient pentru cei pe care îi iubesc.",
    "Eu sunt Femeie! Sunt forța creatoare a Universului. ",
    "Eu nu mă grăbesc și sunt atentă la Frumusețea parcursului meu. ",
    "Abandonez gândurile și îmi ascult inima.",
    "Ca să am viitorul ideal, mai întâi trebuie sa-l vizualizez. ",
    "Eu sunt autoarea propriei vieți.",
    "Eu sunt arhitecta propriei realități. ",
    "Nu vreau să demonstrez nimănui - nimic. Eu îmi cunosc realitatea. ",
    "Un drum de mii de kilometri începe de la primul pas. Eu astăzi fac primul pas. ",
    "Universul mă susține și mă iubește necondiționat. ",
    "Eu îmi permit sa fiu fericită.",
    "Îmi sunt recunoscătoare pentru fiecare mică victorie.",
    "Eu simt in mine bucuria vieții.",
    "Virtutea mea este iubirea. ",
    "Nu există înălțime de la care voi începe să mă iubesc. Eu ma iubesc chiar acum. ",
    "Eu mereu aleg să trăiesc din binele meu.",
    "Eu niciodată nu acționez împotriva mea și știu să zic “Nu”.",
    "Am nevoie de aceste întâmplări pentru evoluția mea.",
    "Eu plutesc prin viață.Totul vine spre mine cu ușurință.",
    "Eu merg în întâmpinarea succesului. ",
    "Schimbările depind doar de mine. Sunt responsabilă pentru ele. ",
    "Eu sunt femeia magnetică. Nu trec neobservată. ",
    "Eu merit viața la care visez. ",
    "Noul meu nivel este plin de magie. ",
    "Doar eu decid nivelul la care vreau să mă aflu. ",
    "Aleșii se aleg singuri. Eu m-am ales pentru fericire. ",
    "Eu acționez cu o putere moale, doar prin iubire. ",
    " Eu nu îi cred pe cei care zic că este imposibil. Doar eu îmi construiesc realitatea. ",
    "Eu am un sens pe acest pământ. Am venit să-mi trăiesc vocația. ",
    "Astăzi nu permit nimănui sa-mi influențeze gândurile și dispoziția. ",
    "Eu sclipesc. Am de oferit foarte multe acestei lumi. ",
    "Trăiesc sentimentul de plinătate și încredere in sine.",
    "Eu cu ușurintă îmi  îndeplinesc dorințele pentru că Universul este foarte generos cu mine. ",
    "Dacă mie mi-a venit ideea, înseamnă că eu o pot realiza. ",
    "Intuiția este șoapta îngerilor. Mereu îmi ascult intuiția. ",
    "Peste tot văd posibilități și oportunitatea de creștere. ",
    "Astăzi sunt cea mai bună variantă a mea și in fiecare zi evoluez. ",
    "Cea mai bună varianta a mea se manifestă din ce in ce mai mult în fiecare zi. ",
    "Eu cer cu ușurință ce-mi doresc, pentru ca merit. Imi respect dorințele. ",
    "Simt recunoștință pentru fiecare zi din viața mea. Mă simt protejată de Univers. ",
    "Eu nu încetez sa cresc și să mă dezvolt in ciuda tuturor evenimentelor.",
    "Eu nu mă cert pentru greșeli. Învăț din greșeli.În orice situație îmi acord susținere. ",
    "Eu îmi permit să-mi urmez propria cale, indiferent de părerea celor din jur. ",
    "Eu mă iert pe mine și iert pe cei din jur. Nu trăiesc in trecut. Nu trăiesc in durere. ",
    "În fiecare zi eu nu aleg sa sufăr. ",
    "Nimic nu mă încurcă să cresc și să evoluez. Sunt doar eu responsabilă pentru propria evoluție. ",
    "Eu trăiesc în acceptare. Nu mă consum pentru ceea ce nu pot schimba.",
    "Evenimentele care nu intra in zona mea de control, nu mă privesc. Doar accept. ",
    "Astăzi fac pasul către visul meu. Nimic nu mă va opri să-mi desfac aripile. ",
    "Eu nu mai controlez pe nimeni. Accept oamenii așa cum sunt. ",
    "Chiar dacă greșesc, mă întorc și o iau pe alt drum. Nu mă opresc niciodată. ",
    "Sunt de acord sa mă dedic vieții mele ideale și Universul mă susține. Fac primul pas și restul se aranjează de la sine. ",
    "Eu nu sunt in poziția de victimă. Nu învinuiesc pe nimeni pentru eșecurile mele. ",
    "Posibilitățile mele sunt nelimitate. Sunt ceea ce vreau să fiu. ",
    "Sunt curajoasă și în sfârșit sunt pregătită sa-mi manifest adevarata putere. ",
    "Eu sunt cel mai important om din viața mea. Am încredere deplina in mine.",
  ];
  String showQuote = "Quote";
  showQuote = quotes[math.Random().nextInt(quotes.length)];
  return showQuote;
}

String getRandomChallenge() {
  // can you make a function in flutter to return a random quote from a list without repeating
  List<String> quotes = [
    "Astăzi zâmbește la trei bărbați necunoscuți. ",
    "Astăzi poartă ceva roșu.",
    "Astăzi mergi la coafor sau coafează-ți părul într-un mod deosebit.",
    "Astăzi poartă ruj roșu.",
    "ccesorizează-ți ținuta cu bijuterii.",
    "Astăzi schimbă-ți geanta. ",
    "Astăzi poartă tocuri. ",
    "Astăzi ieși in oraș. ",
    "Astăzi fii inspirată.Mergi in locuri frumoase. De exemplu la muzeu. ",
    "Astăzi urmărește 10 lucruri pozitive care se vor întâmpla.",
    "La finalul zilei scrie 15 recunoștințe.",
    "Astăzi vizualizează un episod de pe canalul meu de YouTube. Fii atentă ce subiect te atrage și ce conștientizări vei avea. ",
    "Astăzi pune-ți o dorință și acordă-ți  7 minute să o vizualizezi.",
    "Astăzi meditează dimineața și seara. Rezultatele nu se vor lăsa așteptate. ",
    "Astăzi fii curajoasă.Fă ceva ieșit din tipar. ",
    "Astăzi cumpără-ți  ceva care sa-ți bucure simțul estetic. ",
    "Astăzi îmbrățișează 5 persoane.",
    "Astăzi notează-ți in agendă 10 lucruri pe care ți le dorești cel mai mult in viața. ",
    "Astăzi sună-ți părinții, frații, surorile. Spune-le  ca-i iubești. ",
    "Programează-ți o ședința de masaj pentru următoarele zile. ",
    "În seara de astăzi uită-te la un film despre femeia care te inspira. Vei avea multe conștientizări. ",
    "Astăzi dedică timp și caută informații despre destinația pe care îți dorești sa o vizitezi. ",
    "Astăzi fă-ți un plic în care vei pune lună de lună 10% din venitul tău lunar. ",
    "Programează-ți o ședință foto. Alege-ți ținutele și tematica ședinței. Pentru ca meriți sa sclipești. ",
    "Astăzi privește in ochi 10 bărbați. Analizează ce tipologie de bărbat îți place cel mai mult. ",
    "Astăzi începe să citești cartea mult dorită.",
    "Astăzi analizează ce îți plăcea sa faci la vârsta de 6 ani. Notează și analizează dacă faci in viata de zi cu zi ceva asemănător cu acele activități. ",
    "Astăzi servește cina într-un mod deosebit. Ascultă muzică, aprinde lumânări și aranjează masa ca la restaurant. ",
    "Astăzi planifică-ți vacanța de vară.Buget, locație, perioadă.",
    "Astăzi cumpără-ți un set sexy de lenjerie intimă. ",
    "Astăzi poartă cea mai frumoasă rochie a ta. ",
    "Astăzi planifică-ți o ieșire in următoarea perioada. ",
    "Astăzi sună pe cineva căreia îi ești foarte recunoscătoare. Spune-i.",
    "Astăzi ascultă melodia ta preferată de mai multe ori. ",
    "Astăzi nu fi modestă.Fă ceva altfel. Manifestă-te liber. ",
    "Astăzi fă o acțiune prin care îți vei demonstra cat de mult te iubești.",
    "Astăzi dă-mi tag pe story și eu îți voi da un sfat. ",
    "Astăzi alege-ți o practică energetică feminină pe care o vei face 21 de zile consecutiv. Sa-ți pui o intenție. Sa înceapă magia! ",
    "Astăzi cumpără-ți un buchet de flori sau cere-l  de la iubit.",
    "Astăzi fii atentă la informația care vine spre tine. Vei găsi răspunsuri. La final de zi,notează-ți toate informațiile care au venit. ",
    "Astăzi propune-ți un premiu pentru ceea ce vei face. Alege o acțiune pe care o tot amâni. Să nu te trădezi. Oferă-ți cadoul, pentru ca meriți. ",
    "Astăzi fă o postare în care vei povesti despre o reușită de a ta. Te va ajuta să scapi de frica de critică.",
    "Astăzi desenează cea mai mare frică a ta și apoi arde foaia. ",
    "Astăzi scrie 10 lucruri pe care vrei să le elimini din viața ta și arde foaia. ",
    "Astăzi adu-ți aminte de momentele in care iubeai foarte mult. Pune-ți melodia preferata, aprinde o lumânare și trăiește această emoție.",
    "Astăzi fă cadă cu sare sau aroma de uleiuri.Crează-ți o atmosferă romantică și fă poze. ",
    "Astăzi aruncă 10 lucruri din camera ta. Astfel vei elibera energie pentru următoarele realizări. ",
    "Astăzi copiază o femeie pe care o admiri mult. Stilul, atitudinea, imaginea. Intra in rolul ei. Fii actriță! Joacă-te! Manifestă-te ! ",
    "Astăzi pregătește mâncarea ta preferata. În timp ce gătești, gândește-te doar la lucruri frumoase. Încarcă mâncarea cu energia ta pozitivă. ",
    "Astăzi respectă bărbații. Încearcă sa vezi la fiecare pentru ce ar putea fi respectat si admirat. Această provocare îți va amplifica mult energia feminina. ",
    "Astăzi fii in echilibru. Fă cinci lucruri pe care trebuie să le faci si echilibrează cu cinci lucruri pe care vrei să le faci. ",
    "Privește-te in oglindă.Găsește trei lucruri pentru care te admiri. Zâmbește-ți cu toată iubirea si sinceritatea.",
  ];
  String showQuote = "Quote";
  showQuote = quotes[math.Random().nextInt(quotes.length)];
  return showQuote;
}

String? numberOfItems(String? jsonString) {
  // get the number of items from json string
  final jsonMap = json.decode(jsonString!);
  final items = jsonMap['data'];
  final size = items.length;
  return size.toString();
}

String? newCustomFunction(
  DateTime lastCycleDate,
  int cycleDuration,
) {
  //  calculates the number of days from today until lastCycleDate + cycleDuration + 28 days
  final now = DateTime.now();
  DateTime addDuration = lastCycleDate.add(Duration(days: cycleDuration));
  addDuration = addDuration.add(Duration(days: 28));
  final difference = (now.difference(addDuration).inDays);
  int days = difference.abs();
  return days.toString();
}

String? cleanString(String? htmlString) {
  // clean a html string and return just the text
  return Bidi.stripHtmlIfNeeded(htmlString!);
}
