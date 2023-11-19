import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myskul/utilities/colors.dart';
import 'package:myskul/utilities/gradients.dart';
import 'package:myskul/utilities/icons.dart';
import 'package:myskul/utilities/texts.dart';

class Term extends StatefulWidget {
  @override
  State<Term> createState() => _TermState();
}

class _TermState extends State<Term> {
  var couleurs = ColorHelper();

  var textes = TextHelper();

  var icones = IconHelper();

  var gradients = GradientHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 2,
              margin: EdgeInsets.only(
                top: (MediaQuery.of(context).size.height / 12),
              ),
              decoration: BoxDecoration(
                color: couleurs.white.withOpacity(0.5),
                image: DecorationImage(
                    image: AssetImage("assets/images/math.png"),
                    opacity: 0.04,
                    fit: BoxFit.cover),
              ),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/images/logo.png',
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'En vigueur à compter du 01 MARS 2023',
                        style: textes.h2b,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Les présentes conditions d'utilisation (le présent « Contrat ») sont un accord juridique entre vous (« vous ») et DIGIHEALTH, Inc., une société basée a Douala,Cameroun (« Société », « nous » ou « nos ») concernant l'utilisation de l'application mobile academique (MySKUL), des cours du site Web , des serveurs utilisés par l'application, des fichiers informatiques stockés sur ces serveurs, de tous les services connexes, ainsi que de toutes les fonctionnalités et de tous les contenus connexes proposés par la Société (collectivement dénommés « Application ») Le présent Contrat n'est conclu ni avec Apple, Inc. ou ses filiales, ni avec Google ou ses filiales, ni avec aucune autre entité, le cas échéant.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '1. Acceptation des conditions',
                        style: textes.h2b,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Veuillez lire attentivement le présent Contrat. En créant un compte, en accédant à l'Application ou en l'utilisant, vous reconnaissez que vous acceptez d'être lié par les termes du présent Contrat. SI VOUS N'ACCEPTEZ PAS LES PRÉSENTES CONDITIONS, VOUS NE DEVEZ PAS UTILISER L'APPLICATION OU Y ACCÉDER. Nous pouvons modifier le présent Contrat de temps à autre. Si nous apportons des changements qui modifient de manière substantielle vos droits, nous vous en informerons par courrier électronique, via l'Application ou en vous présentant une nouvelle version du Contrat soumise à votre acceptation. Si vous continuez à utiliser l'Application après la date d'entrée en vigueur d'une version actualisée du Contrat vous serez réputé avoir accepté le Contrat tel que modifié.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '2. Clause de non responsabilité des services académiques',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "LA SOCIÉTÉ N'EST PAS UN FOURNISSEUR DE PROGRAMMES ACADEMIQUES  AGRÉÉ ET L'APPLICATION N'EST PAS DESTINÉE À REMPLACER LE SUIVI DU PROGRAMME ACADEMIQUE INSTITUE PAR VOTRE INSTUTITION ETATIQUE. NOUS DÉCLINONS TOUTE RESPONSABILITÉ POUR TOUTES ERREURS OU OMISSIONS, POUR LES INEXACTITUDES TECHNIQUES NON-INTENTIONELLES OU LES ERREURS TYPOGRAPHIQUES DANS LES MATÉRIAUX FOURNIS, AINSI QUE POUR LA VIOLATION DE TOUTE NORME ÉTHIQUE OU MORALE APPLICABLE DANS VOTRE COMMUNAUTÉ EN MATIÈRE D'ÉDUCATION SCOLAIRE ET DES MATÉRIAUX CONNEXES.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '3. Inscription et éligibilité',
                        style: textes.h2b,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Pour utiliser l'Application, vous pouvez être amené à créer ou à mettre à jour un compte (« Compte ») et à fournir certaines informations personnelles, telles que votre nom, votre sexe, votre date de naissance et votre adresse électronique. Ces informations seront conservées et utilisées conformément à notre Politique de confidentialité, qui peut être consultée en contactant notre service client. Vous acceptez de fournir des informations exactes et complètes à la Société et de mettre à jour ces informations rapidement après leur modification. Pour créer un Compte et accéder à l'Application, vous devez avoir au moins 13 ans et la législation en vigueur ne doit pas vous interdire son utilisation.Si vous avez moins de 13 ans, votre parent ou tuteur doit consulter et accepter les conditions du présent Contrat, et en utilisant l'Application, vous confirmez que votre parent ou tuteur an ainsi lu et accepté le présent Contrat. Concernant les utilisateurs de moins de 18 ans, nous réservons le droit de limiter votre accessibilité à certains contenus de l'Application, à notre seule discrétion.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '4. Votre utilisation de l\'Application',
                        style: textes.h2b,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Tout contenu que vous soumettez par le biais de l'Application est régi par la Politique de confidentialité de la Société DIGIHEALTH. En cas d'incohérence entre le présent Contrat et la Politique de confidentialité de la Société, les présentes Conditions prévaudront. Si vous soumettez une question ou une réponse, vous êtes seul responsable de vos communications personnelles, des conséquences de leur publication et de la confiance que vous accordez à toutes les communications trouvées dans les espaces publics. La Société et ses concédants de licence ne sont pas responsables des conséquences de toute communication dans les espaces publics. Si vous sentez menacé ou si vous pensez que quelqu'un d'autre est en danger, vous devez contacter immédiatement votre service de police local. En tant qu'utilisateur de l'Application, vous acceptez de ne pas l'utiliser à des fins interdites par le présent Contrat. Vous êtes responsable de toutes vos activités en relation avec l'Application et vous devez vous conformer à toutes les lois et réglementations locales, étatiques, nationales et internationales, ainsi qu'à tous les codes de réglementation applicables. Vous convenez que si vous livrez à l'une des actions suivantes, vous violerez alors le présent Contrat, et vous acceptez de NE PAS : \n а. revendre, louer, louer à bail, prêter, sous-licencier, distribuer ou autrement transférer des droits sur l'Application ;\n b. modifier, rétro-concevoir, décompiler ou désassembler l'Application ;\n c. copier, adapter, altérer, modifier, traduire l'Application ou en créer des œuvres dérivées sans l'autorisation écrite de la Société ;\n d. permettre à d'autres personnes d'utiliser l'Application, y compris, mais sans s'y limiter, une utilisation partagée via une connexion réseau, sauf en vertu des termes du présent Contrat ;\n e. contourner ou désactiver toute fonctionnalité ou moyen technologiques de l'Application dédiés à la protection des droits de propriété intellectuelle ;\n f. utiliser l'Application pour tenter de contourner les moyens technologiques employés pour contrôler l'accès à un fichier de contenu ou autre œuvre protégés par les lois sur les droits d'auteur de toute juridiction ainsi que les droits sur ceux-ci ou utiliser l'Application en association avec tout appareil, programme ou service conçu aux fins de ce type de contournement ;\n g. utiliser l'Application ou accéder à celle-ci pour compiler des données d'une manière qui est utilisée ou utilisable par un produit ou service concurrentiel ;\n h. utiliser votre Compte pour annoncer, solliciter ou transmettre des publicités commerciales, y compris des chaînes de lettres, des courriers électroniques indésirables ou des messages répétitifs à quiconque ;\n i. utiliser votre Compte pour adopter une conduite illégale ;\n j. téléverser pour transmettre toute communication enfreignant ou violant les droits d'une partie ;\n k. téléverser des supports de toute nature contenant des expressions de haine, d'abus, des images ou des comportements offensants, de l'obscénité, de la pornographie, du materiel sexuellement explicite, ou tout matériel pouvant entraîner une responsabilité civile ou pénale en vertu de la loi ou de la réglementation en vigueur ou qui pourrait autrement être en conflit avec le présent Contrat et la Politique de confidentialité de la Société ; ou\n l. téléverser tout matériel contenant des virus logiciels ou tout autre code informatique, fichiers ou programmes conçus pour interrompre, détruire ou limiter la fonctionnalité de tout logiciel informatique ou de ce site Web.\n Toute utilisation interdite de ce type mettra immédiatement fin à votre licence d'utilisation de l'Application.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '5. Vie privée des enfants et restrictions concernant l\'âge',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Nous nous engageons à protéger la vie privée des enfants( moins de 13 ans). Vous devez savoir que cette Application n'est pas destinée ou conçue pour être utilisée par les enfants de moins de 13 ans. Nous ne collectons aucune donnée personnelle concernant une personne dont nous savons qu'elle est un enfant de moins de 13 ans. Si vous êtes résident de l’Afrique Central, vous devez avoir au moins 18 ans pour utiliser l'Application. Dans la mesure interdite par la loi applicable, nous n'autorisons pas l'utilisation de l'Application par les résidents de l'Afrique Central âgés de moins de 16 ans. Vous devez avoir au moins 18 ans pour utiliser certaines fonctionnalités de l'Application (par exemple, certains cours, contenus ou sujets de discussion dans le Forum anonyme). Si vous connaissez quelqu'un qui ne respecte pas ces limitations, veuillez nous contacter sur notre service client, et nous prendrons des mesures pour supprimer ou résilier son compte.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '6. Licence limitée pour l\'Application',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Nous vous concédons une licence personnelle, mondiale, révocable, non transférable et non exclusive pour accéder à l'Application et l'utiliser à des fins personnelles et non commerciales conformément aux termes du présent Contrat.Tous les droits, titres et intérêts relatifs à l'Application non expressément concédés dans le présent Contrat sont réservés par la Société. Si vous souhaitez utiliser le logiciel, le titre, le nom commercial, la marque commerciale, la marque de service, le logo, le nom de domaine de la Société et/ou toute autre identification avec des caractéristiques de marque notables ou tout autre contenu appartenant à la Société, vous devez obtenir l'autorisation écrite de la Société. Les demandes d'autorisation peuvent être envoyées a notre service client. Pour lever tout doute, la Société détient les droits sur tous les textes, toutes les images, toutes les photos, tout ce qui est audio ou vidéo, toutes les données de localisation et toutes autres formes de données ou de communication que la Société crée et met à disposition en relation avec l'Application, y compris, sans toutefois s'y limiter, les interfaces visuelles, les fonctionnalités interactives, les graphiques, la conception, la compilation du Contenu utilisateur et la compilation des évaluations agrégées des utilisateurs et tous les autres éléments et composants de l'Application, à l'exclusion du Contenu utilisateur (tel que défini ci-dessous). Sauf disposition expresse et non ambiguë des présentes, nous ne vous accordons aucun droit explicite ou implicite, et nous conservons tous les droits relatifs à l'Application et au contenu de la Société.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '7. Licence du Contenu utilisateur',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "L'Application vous permet de saisir des notes personnelles, de partager vos histoires, de publier ou de téléverser du contenu, de soumettre du contenu (y compris dans des espaces publics tels que Forum anonyme) et d'enregistrer certaines informations dans l'application (« Contenu utilisateur »). Vous conservez tous les droits sur le Contenu utilisateur que vous publiez, partagez ou enregistrez dans l'Application. En fournissant votre Contenu utilisateur à l'Application, vous (a) concédez à la Société une licence non exclusive, transférable, sous-licenciable, mondiale, libre de droits pour utiliser, copier, exploiter, modifier, afficher ou exécuter publiquement, dériver de nouvelles œuvres, intégrer à d’autres travaux, changer, reformater et distribuer votre Contenu utilisateur dans le cadre de la fourniture et de l’exploitation de l’Application et des services connexes et/ou à des fins promotionnelles de la Société (par exemple, en l'affichant sur notre site Web, dans l’Application, sur les réseaux sociaux, sur tout site Web ou plate-forme sur Internet, selon ce que nous jugerons approprié), sous réserve de la Politique de confidentialité ; et (b) vous acceptez d’indemniser la Société et ses sociétés affiliées, administrateurs, dirigeants et employés et de les tenir à couvert de toute réclamation et de toute dépense, y compris les frais d’avocat, découlant des supports et/ou de votre non-respect des conditions énoncées dans le présent Contrat. La Société se réserve le droit d'étudier tout le Contenu utilisateur avant de le soumettre à l'Application et de supprimer tout support pour quelque raison que ce soit, à tout moment, sans préavis, à notre seule discrétion.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '8. Utilisation à vos propres risques',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Notre objectif est d'aider à rendre certaines informations relatives à la santé plus facilement disponibles et utilisables pour vous. Cependant, concernant la santé, l'Application ne peut pas et ne garantit pas des améliorations ou des résultats. L'utilisation que vous faites de l'Application ainsi que toute information, prédiction ou suggestion fournie dans l'Application sont à vos seuls risques. Nous n'assumons aucune responsabilité et n'offrons aucune garantie quant à l'exactitude des données, informations, estimations et prédictions que nous pourrions vous fournir par le biais de l'Application et vous acceptez et comprenez que l'Application n'est pas conçue pour correspondre au même objectif ou y répondre qu'un appareil médical ou scientifique.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '9. Clause de non-responsabilité lors d\'utilisation par les mineurs',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "LES INFORMATIONS CONTENUES DANS L'APPLICATION N'INCITENT, N'INDUISENT NI N'ENCOURAGENT DE COMPORTEMENT SEXUEL OU D'ACTIVITÉ SEXUELLE ENTRE LES MINEURS, ET NE DIRIGENT PAS LE CONTENU DE LA COMMUNICATION VERS UNE PERSONNE EN PARTICULIER. TOUTES LES INFORMATIONS FOURNIES DANS L’APPLICATION SONT UNIQUEMENT DONNÉES À TITRE INFORMATIF.Nous examinons attentivement les documents que nous mettons à la disposition des personnes entre 13 et 17 ans par le biais de l'Application, afin d'éviter tout contenu inapproprié ou nuisible. Nous comprenons parfaitement qu'en matière de définition des informations relatives à la sexualité pouvant être admissibles aux mineurs, les règles morales et éthiques peuvent différer d'un pays à l'autre.Nous ne publions ni n'avons l'intention de publier du contenu sexuellement explicite ou du contenu qui pourrait autrement être considéré comme nuisible aux mineurs en vertu de la législation en vigueur. Nous faisons des efforts raisonnables pour nous assurer que tout le materiel que nous fournissons sur l'Application est basé sur des faits uniquement et sont scientifiquement exacts.Veuillez noter que les opinions éthiques individuelles sur ce qui est offensant ou préjudiciable aux mineurs peuvent différer des exigences fixées en matière de contenu pouvant être mis à la disposition des mineurs en vertu de la législation en vigueur. ",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '10. Abonnements',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "L'application mobile propose des abonnements qui vous donne accès à des fonctionnalités completes. Nous proposons des options d'abonnement mensuel et a vie. Dès que vous aurez choisi l'un de nos abonnements et confirmé votre achat, le paiement sera débité de votre carte de crédit/débit via votre compte MOMO(MTN mobil money) ou OM( orange money). Les abonnements payants ne sont pas automatiquement renouvelés, sauf si le renouvellement automatique est activé, Nous vous informerons si le prix de l'abonnement augmente et, si nécessaire, nous demanderons votre consentement pour continuer. Vous serez facturé dans les 24 heures précédents le début de la dernière période d'abonnement payant.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '11. Forum anonyme',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "MySKUL Forum anonyme (Forum anonyme) est une fonctionnalité spécifique de l'Application permettant aux utilisateurs de communiquer entre eux sur un ensemble de sujets différents liés a l’education. Tous les commentaires des utilisateurs formulés dans Forum anonyme sont publiés de manière anonyme. Si vous supprimez votre compte, vos commentaires resteront visibles pour les autres utilisateurs de Forum anonyme.En tant qu'utilisateur de Forum anonyme, vous ne devez pas :•	Laisser des commentaires et des déclarations impolis, harcelants, insultants, provocateurs, discriminants, non tolérants, religieux, racistes, politiques, homophobes ou offensants ;•	Publier des images abusives, offensantes, obscènes, pornographiques, illicites, sexuellement explicites ou tout autre contenu (y compris des liens vers de tels contenus) interdit par la loi ou la réglementation en vigueur ou pouvant autrement être en conflit avec le présent Contrat ;•	Faire de la publicité pour n'importe quel produit ou service.•	Vous livrer à d'autres actions interdites telles que définies dans lesRègles de Forum anonyme. À notre seule discrétion, nous nous réservons le droit de :•	Supprimer tout commentaire ou matériel inapproprié ou non pertinent ;•	Supprimer ou modifier des commentaires contenant des données personnelles, telles que le nom, l'adresse ou l'adresse électronique ;•	Restreindre ou interdire votre accès à Forum anonyme à tout moment et sans préavis si nous déterminons que votre contenu ou votre utilisation de Forum anonyme enfreint le présent Contrat ;•	Utiliser, copier, modifier, remanier, déplacer, changer, afficher publiquement, organiser et diffuser publiquement des discussions, des commentaires et des documents ;•	Bloquer vos commentaires pour quelque motif que ce soit ou les modérer lorsque nous le jugerons opportun ;•	Désactiver Forum anonyme à tout moment sans notification préalable.Vous pouvez en savoir plus sur les règles applicables à la communication dans Forum anonyme en lisant nos Règles de Forum anonyme. Les Règles de Forum anonyme font partie intégrante du présent Contrat. En acceptant le présent Contrat, vous acceptez également les Règles de Forum anonyme.DANS LES LIMITES PRÉVUES PAR LA LÉGISLATION APPLICABLE (INCLUANT, MAIS SANS S'Y LIMITER, LA LOI SUR LA DÉCENCE DANS LES COMMUNICATIONS DE 1996 (COMMUNICATIONS DECENCY ACT)), LA SOCIÉTÉ DÉCLINE LA RESPONSABILITÉ DE TOUTE CONSÉQUENCE DIRECTE OU INDIRECTE RÉSULTANT DES INFORMATIONS, DES LIENS ET DES DOCUMENTS PUBLIÉS PAR LES UTILISATEURS, DE TOUTE ACTION OU INACTION DES UTILISATEURS, DE TOUTE VIOLATION DES LOIS ET RÈGLEMENTS APPLICABLES.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '12. Mots de passe',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "La responsabilité de prendre toutes les mesures raisonnables pour s'assurer qu'aucune personne non autorisée n'aura accès à vos mots de passe de l'Application ou à votre compte vous incombe. Il est de votre seule responsabilité (1) de contrôler la diffusion et l'utilisation du nom de connexion, du pseudonyme et des mots de passe ; (2) d'autoriser, de surveiller et de contrôler l'accès et l'utilisation de votre compte et mot de passe dans l'Application ; (3) d'informer rapidement la Société si vous pensez que votre compte ou votre mot de passe a été compromis ou s'il y a une autre raison pour laquelle vous devez désactiver un mot de passe. Envoyez-nous un courrier électronique à notre service client. Vous concédez à la Société et à toutes les autres personnes ou entités impliquées dans le fonctionnement de l'Application le droit de transmettre, surveiller, récupérer, stocker et utiliser vos informations en rapport avec le fonctionnement de l'Application. La Société ne peut assumer et n'assume aucune responsabilité pour les informations que vous soumettez, ni pour votre utilisation ou celle de tiers, ou pour une mauvaise utilisation des informations transmises ou reçues à l'aide de l'Application.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '13. Exclusion de garantie',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "La Société contrôle et exploite l'Application à partir de divers emplacements et ne déclare aucunement que l'Application est appropriée ou disponible pour une utilisation sur tout site. L'Application ou certaines de ses fonctionnalités peuvent ne pas être disponibles dans votre pays ou peuvent varier d'un pays à un autre.L'APPLICATION EST FOURNIE « TELLE QUELLE », « TELLE QUE PROPOSÉE » ET SANS AUCUNE REPRÉSENTATION OU GARANTIE D'AUCUNE SORTE, EXPRESSE OU IMPLICITE, Y COMPRIS, MAIS SANS S'Y LIMITER, LES GARANTIES IMPLICITES DE TITRE, DE NON-CONTREFAÇON, DE QUALITÉ MARCHANDE ET D'ADÉQUATION POUR UN USAGE PARTICULIER ET TOUTE GARANTIE IMPLIQUÉE PAR TOUTE EXÉCUTION OU UTILISATION COMMERCIALE, TOUTES ÉTANT EXPRESSÉMENT EXCLUES, SAUF DANS LA MESURE REQUISE PAR LA LOI. LA SOCIÉTÉ ET SES ADMINISTRATEURS, EMPLOYÉS, AGENTS, REPRÉSENTANTS, FOURNISSEURS, PARTENAIRES ET FOURNISSEURS DE CONTENU NE GARANTISSENT PAS QUE : (A) L'APPLICATION SERA SÉCURISÉE OU DISPONIBLE À TOUT MOMENT OU À TOUT ENDROIT PARTICULIER ; (B) TOUT DÉFAUT OU TOUTE ERREUR SERA CORRIGÉ ; (C) TOUT CONTENU OU LOGICIEL DISPONIBLE SUR OU PAR L'APPLICATION EST EXEMPT DE VIRUS OU D'AUTRES COMPOSANTS NOCIFS ; (D) LES RÉSULTATS DE L'UTILISATION DE L'APPLICATION RÉPONDRONT À VOS BESOINS. VOTRE UTILISATION DE L'APPLICATION SE FAIT UNIQUEMENT À VOS PROPRES RISQUES ; OU (E) L'EXACTITUDE, LA FIABILITÉ OU L'EXHAUSTIVITÉ DU CONTENU, DU TEXTE, DES IMAGES, DU LOGICIEL, DES GRAPHIQUES OU DES COMMUNICATIONS FOURNIES PAR DES TIERS SUR OU PAR L'APPLICATION, Y COMPRIS DANS SECRET CHATS. CERTAINS ÉTATS/PAYS NE PERMETTENT PAS DE LIMITER LES GARANTIES IMPLICITES, DONC, LES LIMITATIONS CI-DESSUS PEUVENT NE PAS S'APPLIQUER À VOUS.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '14. Limite de responsabilité',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "EN AUCUN CAS, LA SOCIÉTÉ, SES DIRIGEANTS, ADMINISTRATEURS, AGENTS, SOCIÉTÉS AFFILIÉES, EMPLOYÉS, ANNONCEURS OU FOURNISSEURS DE DONNÉES NE PEUVENT ÊTRE TENUS RESPONSABLES DE TOUT DOMMAGE INDIRECT, SPÉCIAL, ACCESSOIRE OU PUNITIF (Y COMPRIS, MAIS SANS S'Y LIMITER, LA PERTE D'UTILISATION, LA PERTE DE PROFITS OU LA PERTE DE DONNÉES) QUE CE SOIT UNE ACTION CONTRACTUELLE, UN DÉLIT (Y COMPRIS, MAIS SANS S'Y LIMITER, LA NÉGLIGENCE), L'ÉQUITÉ OU AUTREMENT, DÉCOULANT DE TOUTE MANIÈRE LIÉE À L'UTILISATION DE CETTE APPLICATION. EN AUCUN CAS, LA RESPONSABILITÉ TOTALE DE LA SOCIÉTÉ DÉCOULANT OU EN RELATION AVEC CES CONDITIONS OU AVEC L'UTILISATION OU L'INCAPACITÉ D'UTILISER L'APPLICATION, NE DÉPASSERA LES MONTANTS QUE VOUS AVEZ VERSÉS À LA SOCIÉTÉ POUR L'UTILISATION DE L'APPLICATION OU CENT DOLLARS (100\$) SI VOUS N'AVIEZ AUCUNE OBLIGATION DE PAIEMENT ENVERS LA SOCIÉTÉ, LE CAS ÉCHÉANT. CERTAINES JURIDICTIONS N'AUTORISANT PAS L'EXCLUSION OU LA LIMITATION DE RESPONSABILITÉ, IL EST POSSIBLE QUE LES LIMITATIONS SUSMENTIONNÉES NE S'APPLIQUENT PAS À VOUS. LA SOCIÉTÉ OU TOUT TIERS MENTIONNÉ SUR L'APPLICATION NE PEUVENT ÊTRE TENUS RESPONSABLES POUR AUCUNE BLESSURE PERSONNELLE, Y COMPRIS LA MORT, CAUSÉE PAR VOTRE UTILISATION OU MAUVAISE UTILISATION DE L'APPLICATION.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '15. Utilisation d\'appareils mobiles',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Veuillez noter que les tarifs et frais normaux de votre opérateur, tels que les frais de messagerie textuelle et de données, continueront de s'appliquer si vous utilisez l'Application sur un appareil mobile.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '16. Services tiers',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "L'Application peut vous donner accès à des liens vers des sites Internet tiers, des applications ou d'autres produits ou services (« Services tiers »). La Société ne contrôle d'aucune manière les Services tiers et, par conséquent, n'assume aucune responsabilité liée auxdits Services tiers. Vous devez prendre les mesures pertinentes pour déterminer si l'accès à un Service tiers est approprié, y compris la protection de vos informations personnelles et de votre vie privée lors de l'utilisation de ces Services tiers et le respect des accords applicables.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '17. Vos commentaires',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Vos commentaires sur l'Application sont les bienvenus. Sauf indication contraire expresse, toutes les communications que vous nous envoyez ou que vous publiez dans les boutiques d'applications sont réputées être soumises de manière non confidentielle. Vous acceptez que nous puissions décider de publier un tel contenu à notre propre discrétion. Vous acceptez de nous autoriser à utiliser gratuitement ces contenus et à réviser, modifier, ajuster et changer contextuellement, ou apporter toute autre modification que nous jugerons appropriée.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '18. Droits d\'exécution',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Nous ne sommes pas tenus de surveiller l'accès ou l'utilisation de l'Application. Cependant, nous nous réservons le droit de le faire à des fins d'exploitation et de maintenance de l'Application, pour nous assurer de votre conformité au présent Contrat et pour nous conformer aux exigences légales applicables. Nous pouvons divulguer un comportement illégal aux autorités chargées de l'application des lois et, conformément à une procédure légale valide, nous pouvons coopérer avec les autorités chargées de l'application des lois pour poursuivre les utilisateurs qui enfreignent la loi. Nous nous réservons le droit (sans obligation) de supprimer ou de désactiver tout contenu publié sur l'Application ou l'accès à l'Application à tout moment et sans préavis, et à notre seule discrétion, si nous déterminons que votre contenu ou votre utilisation de l'Application est répréhensible ou en violation du présent Contrat. La Société n'assume aucune responsabilité envers les utilisateurs de l'Application ou toute autre personne ou entité pour l'exécution ou la non-exécution des activités susmentionnées.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '19. Modifications de l\'application',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "De temps à autre et sans préavis, nous pouvons changer, étendre et améliorer l'Application. Nous pouvons également, à tout moment, cesser d'exploiter l'intégralité ou une partie de l'Application ou désactiver de manière sélective certaines fonctionnalités de l'Application. Votre utilisation de l'Application ne vous donne pas droit à la fourniture ou à la disponibilité continue de l'Application. Toute modification ou élimination de l'Application ou de toute fonctionnalité particulière sera faite à notre seule et absolue discrétion et sans obligation permanente ni responsabilité envers vous.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '20. Dégagement de responsabilité',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Vous acceptez de défendre, de protéger et de dégager la Société, ses dirigeants, administrateurs, employés, mandataires, concédants de licence et fournisseurs, de toute responsabilité en cas de plainte, d'action, demande et règlement, y compris, sans limitation, pour les frais juridiques et comptables raisonnables, résultant de votre violation effective ou supposée du présent Contrat ou qui en résulterait.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '21. Divers',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Tout différend découlant du présent Contrat sera régi par les lois de l'État de Californie, sans égard à ses dispositions en matière de conflit de lois. LA JURIDICTION UNIQUE ET EXCLUSIVE POUR TOUTE ACTION OU PROCÉDURE DÉCOULANT DE OU LIÉE AU PRÉSENT CONTRAT SERA SITUÉE DANS UN ÉTAT APPROPRIÉ OU UNE COUR FÉDÉRALE SITUÉE DANS LE COMTÉ DE SAN FRANCISCO, L'ÉTAT DE CALIFORNIE, ET LES PARTIES RENONCERONT INCONDITIONELLEMENT À LEURS DROITS À UN PROCÈS DEVANT JURY.Toute action en justice que vous pourriez intenter concernant votre utilisation de l'Application doit être introduite dans l'année suivant la réclamation ou l'événement à l'origine de cette action.Si, pour quelque motif que ce soit, un tribunal compétent juge inapplicable une disposition du présent Contrat ou une partie de celui-ci, celle-ci sera appliquée dans la mesure maximale autorisée pour respecter les intentions du présent Contrat et le reste du présent Contrat continuera de s'appliquer de plein effet. Une version imprimée du présent Contrat est recevable dans les procédures judiciaires ou administratives.Aucune renonciation de la part de la Société à une modalité ou condition énoncée dans le présent Contrat ne sera considérée comme une renonciation ultérieure ou continue à cette modalité ou condition, ni à la renonciation à toute autre modalité ou condition, et tout manquement de la part de la Société à exercer un droit ou une disposition en vertu du présent Contrat ne constituera pas une renonciation à ce droit ou à cette disposition. Si une disposition du présent Contrat est jugée sans effet, illégale ou inexécutable pour quelque raison que ce soit par une cour de justice ou un autre tribunal de la juridiction compétente, cette disposition sera supprimée ou limitée au strict minimum de manière à ce que les autres dispositions du présent Contrat gardent leur plein effet et restent en vigueur.Lors de la résiliation, toutes les dispositions du présent Contrat, qui, par leur nature, devraient survivre à la résiliation, survivront à la résiliation, y compris, sans limitation, les dispositions relatives à la propriété, les exclusions de garantie et les limitations de responsabilité.Tous les différends entre les parties liés au présent Contrat feront l'objet d'un règlement individuel et les parties ne consolideront ni ne demanderont un traitement collectif pour tout différend, sauf accord préalable écrit des parties.Nous avons le droit de refuser le service, de fermer des comptes et de modifier les conditions d'éligibilité à tout moment.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '22. Procédures de notification et de retrait',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Si vous pensez que le matériel accessible sur ou à partir de l'Application enfreigne vos droits d'auteur, vous pouvez demander le retrait de ce matériel (ou l'accès à celui-ci) de cette Application en contactant la Société et en fournissant les informations suivantes : \n а. Identification de l'œuvre protégée qui, selon vous, a été compromise. Veuillez décrire l’œuvre et, si possible, inclure une copie ou l'emplacement (par exemple, la page de l'Application) d'une version autorisée de l'œuvre.\n b. Identification du document qui selon vous est à l'origine de la violation et son emplacement. Veuillez décrire le document et nous fournir son URL ou toute autre information pertinente qui nous permettra de le localiser.\n c. Votre nom, adresse, numéro de téléphone et adresse de messagerie électronique (si disponible).\n d. Une déclaration selon laquelle vous croyez de bonne foi que l'utilisation des documents visés par la plainte n'est pas autorisée par le détenteur des droits d'auteur, son agent ou la loi.\n e. Une déclaration selon laquelle les informations que vous avez fournies sont exactes et qui indique « sous peine de parjure » que vous êtes le titulaire du droit d'auteur ou que vous êtes autorisé à agir en son nom.\n f. Une signature ou son équivalent électronique émanant du détenteur des droits d'auteur ou de son représentant autorisé.\n Afin de protéger les droits des titulaires de droits d'auteur, la Société maintient une politique de résiliation, dans des circonstances appropriées, des abonnés et des titulaires de compte de l'Application qui sont des récidivistes.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '23. Questions et commentaires',
                        style: textes.h2b,
                        textAlign: TextAlign.center,
                      ),
                      Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            "Pour tous commentaires ou questions sur une partie de l'Application ou une partie des présentes Conditions d'utilisation, si vous avez besoin d'assistance ou si vous avez des réclamations à faire, veuillez nous contacter sur notre service client.",
                            textAlign: TextAlign.justify,
                            style: textes.h4l.copyWith(height: 2),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                decoration: BoxDecoration(
                    gradient: gradients.greenGradient,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 20,
                        )),
                    Positioned(
                        top: 50,
                        right: 40,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 08,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 5,
                        right: 40,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 15,
                        )),
                    Positioned(
                        top: MediaQuery.of(context).size.height / 5,
                        left: 40,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 25,
                        )),
                    Positioned(
                        top: 0,
                        left: MediaQuery.of(context).size.width / 1.5,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 28,
                        )),
                    Positioned(
                        top: 40,
                        left: 40,
                        child: CircleAvatar(
                          backgroundColor: couleurs.white.withOpacity(0.05),
                          radius: 08,
                        )),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(
                                    icones.back2,
                                    color: couleurs.white,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'terms'.tr,
                              style: textes.h3l.copyWith(color: couleurs.white),
                            ),
                            SizedBox(),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
