function [Y,Xf,Af] = Bbroke(X,~,~)
%MYNEURALNETWORKFUNCTION neural network simulation function.
%
% Auto-generated by MATLAB, 01-Jul-2021 15:31:51.
%
% [Y] = myNeuralNetworkFunction(X,~,~) takes these arguments:
%
%   X = 1xTS cell, 1 inputs over TS timesteps
%   Each X{1,ts} = Qx6 matrix, input #1 at timestep ts.
%
% and returns:
%   Y = 1xTS cell of 1 outputs over TS timesteps.
%   Each Y{1,ts} = Qx2 matrix, output #1 at timestep ts.
%
% where Q is number of samples (or series) and TS is the number of timesteps.

%#ok<*RPMT0>

% ===== NEURAL NETWORK CONSTANTS =====

% Input 1
x1_step1.xoffset = [-7.55151818142394;-36.5683737393915;-40.5000000020176;-49.4516870358608;-12.8053011514656;-29.500000001186];
x1_step1.gain = [0.1374427035857;0.0327039590367092;0.0373831775700104;0.0216329205461023;0.0659950545110385;0.0253164556926355];
x1_step1.ymin = -1;

% Layer 1
b1 = [2.8383834589463656783;2.9331936380127374697;-3.1627925753420029764;-4.1175332773260864272;-3.5168987020061401871;2.5583415918684928592;4.6503441555292086562;2.3606441725548985566;-3.2032609197887857988;2.2726213622966011663;4.7047486379688052693;-3.8635216287219242837;-1.5977742246020067984;-0.66598476751504243065;2.8330038526356369211;-0.23665987969878105046;-2.0275018776395312692;3.2809726775822505296;-2.4572405893538471489;0.82457231645758732874;-0.65833659928279386619;4.343937459521122868;3.13267928770950288;0.94522705719828448157;0.13612111745492513903;3.0517154473691365801;-1.9903698467925670101;4.1642031226733813298;-3.9128897396242203754;-1.800516116080398632;1.6624704376878429724;-1.8002701389530322285;-0.65018224424016246576;-2.4568059802688466675;3.2790767536902594159;-2.6116401666097552869;0.26445048973936008396;-1.3823388435001917607;1.9536728041488182761;-0.54133218215487921565;1.0079231789415543652;0.0086383695976170078723;2.0729821047679566348;-1.5352623195664074629;-0.33954416949760091171;-0.87670121679641821455;-1.7073511836629711169;-0.46808815266713632575;0.46153612626003215347;-0.72996574771384747926;-0.33419775150547814668;-2.2055977864714817471;0.97859070852793428319;0.2656736658035161458;0.45600607832684708631;-0.75612747627198406697;-0.82379580426073106825;-2.0710977026816475011;-0.030053561606982207022;1.8254171969474015658;-2.283119609963759622;1.3150282242354738305;0.77641909705087652771;0.43387117891008186721;-0.31534430416729247737;0.96384665240463196501;-1.2747074471669257445;-1.5829368412630400176;0.33366861341264975049;1.2828645275301739925;-1.9906073661305048184;1.975256592204685413;-0.38488670360909887913;-0.8827990980368797258;1.8716740752244169776;0.022991468053767186164;-1.9225205001353828926;-1.2965222254053456741;-0.80509620667438830388;1.9898266003888525066;2.5265362254326624303;0.75234506655554522769;-2.1844188690903685313;-1.8002506356174639013;2.771106375910717734;1.556857357369644701;0.94286921550768121314;2.1555134215045166357;2.2712539144683501213;2.6259994968307034391;-2.3257836775823199638;3.0266540253205556077;-3.1857546916125807357;3.3539981801971778808;-3.0020209403149675786;-3.2270827177510010841;-3.3369165747260747246;4.0171863704479546797;-3.8824631170154826343;-2.8284464117448337994];
IW1_1 = [-0.41830865741271611169 0.55670159033435639984 1.6824238565436857584 1.9710079087316187962 0.51377007818664344185 -1.4270204773083088323;-1.0177533128878528679 2.5454344671402258093 -0.48418880788137685922 1.3066585215187487279 2.854639767520584126 -0.40788630934306518983;1.617041882859018731 0.31164422754592568943 0.58509767397576695203 2.1196791526701592723 1.3610902595341465293 1.108131260731489931;2.4228804410555229154 0.40151022528860702554 3.0722636899304767155 -1.1150850969682912783 -0.78064700618648996677 1.2682092395657067474;2.4966524333178523598 0.76596709341250834857 -0.19208998060444132383 1.0025089690976234369 0.23564324651406187705 2.5747161785689929303;-0.22740425178603515532 1.6603219495845877862 -1.383003135842844733 1.552234059880700956 -1.5154196634191323678 -1.6002810856790294913;-3.306427188819677454 3.0968866601626348078 -1.402097758813219075 0.34517849231999814252 0.45247648743975671382 0.043259338747755463062;-1.4716471594137308099 -1.7033023956493076323 0.64155550330084720745 2.6029072807003434953 0.57371839252114253949 -0.82578956282512494536;1.3346239963727557498 -1.7447892800363513643 -1.6666402506981792264 -0.80200078534321339596 -0.016230000660646656807 0.17880397076441242876;0.26587487408911342213 -0.11524868692613479682 3.1761200045282151905 0.68084752643944568273 -1.6299548878141445485 1.2315111531309990145;-3.4373129801028121655 -1.2357248548611678984 -6.8012612719800911165 -0.29543839331393956238 -1.9261938416159571918 3.1484113146420482643;1.0379394672900752461 -0.25716947472082429815 1.6956041843006737224 -0.03801315861361940357 -1.061423887612838346 1.2675544225045796143;1.8142276635594853929 -0.7222255269148937229 -1.2224604687201694464 -1.0359895188705556812 -1.4335638314837439999 -0.75448313763234586826;1.5233190540695531467 0.61783141533462682116 0.32451475869939905294 -0.95957164065639888317 -1.0705968543364909884 2.3743484851899352428;-0.7181419981373043937 -1.139584694835394707 0.12866267172783965589 -0.018449753189606080128 -1.8836120263822802023 12.710979330697146139;1.5818844278613894971 -8.9320544841792290924 2.4181763665557194365 0.11398898978485116906 0.1445679587012501377 0.89093557468218764761;1.4385335106191701193 0.23409840571316478663 1.8951153553757746906 -1.4445208686349992888 1.1986276701203533168 1.153685039970458126;-0.10140184207245406256 1.419801904429344841 1.612136069377049008 0.11316622764161426984 0.036104374545977327426 -0.98529978286289909839;-0.88231817454659511313 0.26184801867193713276 1.2188344487640569991 15.937676865793360292 0.55808874686884046845 -0.32194897533080152341;-0.75101277712827252397 0.30250930143220688961 -0.83333777094881134051 4.3244748018821015378 1.3348588637378975275 -2.4813976273011641993;1.7514537445414815053 -0.8524589673948075319 -3.4025234446442995662 2.9315016685098367333 2.5802960423934919731 -2.1582098397239368737;-0.33381867676925536248 -1.353307927270249067 -6.4779084673865643396 0.67089652040960678914 2.4450061499098061368 -0.30659432706347616859;-0.63390454353994829528 2.5759706758829938877 -1.8690694875991740176 -4.6076329196825698276 -0.63965418848910793326 -0.0091596559594350653033;-2.2381410329390925007 -2.4571771304020812998 1.8544882340438175738 -0.84456320823941477549 -2.3685448104948219061 -1.1133528785617008428;1.2401892579509790071 -6.8931826479730125001 2.0890810851892189781 0.061258655308131612638 -0.013142853225923005478 0.78305381344878566274;-0.48170413666323202984 -0.3408805197266286946 -0.071238622177974872396 -0.24648816316972538276 -2.2207523935110815572 12.109321975086400514;0.99611639857773259799 -0.25948476915464829817 0.40459221529180927623 0.31455842900154873387 -0.47165136443590227611 2.2727061726619557369;-1.4551918168621873484 -1.9863943664476688689 -9.6617511918114793446 -1.2532040267661397337 -3.3796839968135943266 -0.69010160129282027697;0.79271281715179919836 -7.9620935055685810866 9.8001303343125503176 0.19518564466726395779 0.068580685930085219515 -3.1229361756420290774;1.940149195183870745 1.0867204294634493777 -0.30499100974854109758 0.44973874820848863676 -0.65732661608344777893 -1.4738628951271619538;-0.42223801692384033135 -3.0343510381850293811 0.30795084105681008735 -1.4706750797861523061 -2.5804906118493935452 1.038329795518422749;-0.74641351520333409919 0.32289567158440324324 0.82277253024518759439 10.761687099704811743 0.44133576161236859337 -0.92737688537338403005;1.5133268877461580892 2.098941787429980721 -1.8531254328322339653 0.44785137569082483777 -2.6099377604981528478 2.4070354267816256311;0.43027975741595680947 -2.6449067259923113582 1.4932687632052310533 2.9990065152845262197 -0.26334679730191473679 1.6185821716576842544;-0.88394744284488546704 6.3528720370325331146 -7.4792540823353910184 -0.10510847778368678784 -0.096271725923831680261 3.0782610339906053554;2.4423650835117518554 -1.4601168740701020443 -0.08685867063620217321 0.83637002305065732966 3.3542043416624265362 1.16206095717666269;-2.9670713611083034955 0.26483617816710058879 3.0575255166751280633 -1.3317750015289848697 -0.17658387606899686451 1.906490245607611822;3.5329615620563115108 0.86678157077653694706 1.309123547322479153 1.429276965553281542 1.1286564234766538473 0.10105544990256278004;-0.82989035135576350033 -5.4409571893640098494 0.126847913191154682 3.3849469793192774603 1.5994503611184842651 -0.36667867418505861732;0.22538616910225117707 -1.4206074798295249551 -2.8026683865869497225 -0.19755101958895332492 -2.2015474407976758364 1.8399518465956967717;-0.17420456079614271561 -0.8944487287736174741 -1.6431590799147195447 1.1952103220301704134 1.1822954324282086702 -3.3231445878679739536;-0.38355682093937920607 0.42297718769527103966 -1.0226818047767338715 4.035168764635017169 -3.6898081321408304767 -1.5482884752494288083;-4.4501094202184372506 0.22274008410615109277 -1.5771166911539695743 -0.51111742543767346714 -1.6011353336170355277 2.8533317212254392103;1.922207922498130328 -0.90860654133508489405 -1.452589743510726894 3.0162350558075212703 2.0909987259877347299 0.16495437837381771162;-2.3313359156112194448 -2.1485486739076260498 4.8927917543971908287 2.4029556296810570259 -1.1522138873910077184 4.5383431809096874687;1.1224575864620658372 2.014661727781111189 0.44535918475331437438 0.60398789298831134786 -2.3574942900721405081 -0.31905825857635239373;2.9018731457467028534 -1.3392979878534987392 -0.027058462008723339898 1.1713985015810326473 3.3005135088552242095 -1.1386605764580284283;-0.071085157509188992564 1.114352922153843295 -0.71451992742571768247 3.3270211636187756454 -1.6502033666110169641 -1.1893984745907619782;-2.3499560862971704545 -0.47287569404140883389 -3.5369183873135696672 1.38380229087388118 0.14494531665196158654 0.60757553139974207479;-1.9874119922395023785 -0.58685994673772579056 1.0097267036921957484 -0.2360396082382895111 1.9088438035549104566 1.581449475739628685;0.59792647399778375839 -1.4712476663591902426 3.8493122976135416557 1.1666034478744529146 2.8394814797308618459 -1.1011493240487555401;-2.397362408744507789 -3.034587499974391811 3.8927597612101889624 -0.21674800197346563713 -1.726257530141948493 -1.5885864718399038686;-2.7411020460024073664 -2.4494822160083660201 -2.2205057129373781954 -2.9126033621147611186 0.22673994666280658516 0.92697306196396167532;-2.6885434316285974354 1.2093565972052116031 -3.2847344640301128216 -0.52167251275402903854 -5.5876204498539578935 2.8661290235858918329;1.5270831217577434114 0.48600315555298950754 -1.5038773683284998306 0.024052963317796632881 1.3061716357492925145 1.304973354155758658;-2.0678483106843921213 0.72277788985799784616 0.45298905251681009787 1.9510571161800276396 -2.0335744572844811628 -0.54290273292353241619;-0.1281445217983634699 -1.1218455270842264682 -0.72225872868425033957 2.7007461206142391319 0.88033264131782495987 -1.2159671693356657318;-0.73980807743604770632 1.2307781875964565188 -0.92919349074981039127 -0.69951021188632844794 -3.8107383118016984191 -7.934866990657342356;4.7409266566496155448 -0.10930719536692655447 -0.24332373274115726147 0.072212705273287269847 -1.3414512991874192327 0.16583005384985330388;1.5123500556936666506 -3.9581820697055380975 1.364969924322329442 -12.19119560312880246 3.1809865628217890432 3.7802719768489083663;-1.1601169439353720136 0.16182835992063829278 -0.10232540514337259974 7.6041182797437469887 0.70696509225989734304 -5.6904497644575409154;8.3497796674327098287 1.1037802850548699141 -2.4702447954465265312 1.2158763349753867189 -1.642581118658995587 0.40546039398593369807;-0.42551697825550788279 0.91266902095221935642 0.59344437108280234661 2.1674592247335882078 -3.4437144950358069551 1.3020355816609454624;-6.1805102543252949943 0.62846435162732561253 0.7432065618177184918 -0.50336509721554834051 -2.5234811413051301265 -2.6766706760868612669;8.2483907329003542941 -0.23006141359405346547 0.13477334923534536881 0.029307634413195178535 -4.6052718851492624452 0.33072129141638773042;-0.13092048252163626665 0.74365971245523032618 0.6500677529427948409 -2.8980773488160020968 -2.0206588040123372174 -0.29181678156601176255;-0.51872161835559826848 -0.76222384205759108333 2.7237109107837413902 0.36751109771537748827 -5.137335144667647846 0.5271786387160460885;-0.55362319544301130669 -1.1088471977050060602 -1.8530706691852931733 -1.4951565586440169753 1.2167369498597111477 0.46206036793456378708;3.8271244694226367322 -2.6626671177019902714 1.2939470270567408061 1.514572105552688619 5.8431446762151919572 1.2180243319673242919;0.92713475398986211484 2.1111463643412520241 -3.8038237265015171218 -0.28373081373902003799 0.97913985307784479062 -0.00079886216252174693797;0.043075742487450080498 -0.96179268575627663296 -0.33647757006063250262 2.0720956903237266467 0.16268896437098570584 -2.49037756805773558;1.9258806130707815107 -0.47477624149685149213 -0.26317938581735278447 2.1608426424442055414 -2.0137722280692851307 0.39491849258356515051;-1.0367291287614315287 1.341523237573809979 -0.17401711151089582774 1.112291719601868234 4.5911150602427790446 -3.7285793701470097972;0.97075027564328941754 1.7188314164534976847 -5.3524128502265986285 -0.11138546135688680294 -2.0835170689177147096 -1.8666533479921700867;0.52114394069051472869 -0.84944057428846375668 1.0086366890524931517 0.72307122069641771578 3.0096993288252855692 6.2652337745340931363;4.5887517089320768449 -0.82733381452573018233 -0.68287558985310725657 -1.6659115305746436952 2.3182569772970884614 0.93501371307378644548;-1.0123630207338398801 -0.82553101404374307215 0.51800924058865616129 -3.0495048325077225293 -0.64534734132351312397 -2.9249056984264454329;0.066566125810997245349 -0.17948314684433649968 -2.6390120433654069565 0.36486193706571012907 0.24231228581665101296 2.5786532225132985374;-1.4263442602008520321 10.103692169874404883 -3.4884041476837772677 0.38048142289023628715 -0.073363136932485917274 0.30007460282047238032;1.3876229074743082759 1.2394078190019264252 1.0867281472574596979 0.52943224360717522359 1.0362385365853929997 -1.555510259796923922;1.3560166930569335086 0.71546568549722511232 -1.5701533637753890549 -2.0249783386814090846 0.22619225387907973546 0.00028930089458782920053;-0.02653381993176509579 -2.6230167282525962413 0.74455252136936211915 -1.6869100023785721376 -0.90982490284351680288 -2.0127997433821338547;-2.0629913576249250262 1.4963315613524688086 -0.86240062658308180854 0.29681595451551123777 -0.20392094299506907662 0.43721122899679071283;-2.608630975368807281 -0.74133788224487107144 -2.3181383245909006341 0.65369755919642213993 0.086486525973496819475 -2.7666937412994481171;3.3912768901376830755 0.93088691887935892666 -0.65396286906699252484 0.39127430292071940787 0.814302186620516677 1.9435721513466710508;0.63767042041823951415 1.5272056419593409426 1.2490849840998752285 -2.1015399517821227171 -0.24413888462283395153 3.2708883427509705122;0.30919946633327494157 -2.4232324613427129734 -1.6241434673101160513 -3.1283421067133168059 -2.3433609218180451172 -1.1681920439644275511;1.0390697414817944289 0.70186874325417281106 -0.47659221166430265626 2.8599253664682926512 -0.43489546818836866127 1.7629349595625467551;1.0229866153475126733 2.1340453788754869535 0.9996705263754452897 0.45523826661897881518 0.30565970385190538439 1.7422782059104198193;0.37650574996074959166 -2.7020710774245215724 0.087506802840455005787 1.8608357984882664127 -0.93592020045047186194 2.5373184286309529156;-1.6758575105075708134 -1.6461586479429730634 -0.046666745309432079714 0.18519378522475346549 -1.1357292131180840578 1.625551673000003694;1.2278442727830616299 0.80609746029929174593 1.1945214259010170643 -0.29825076628913277377 1.4143685912516317238 -1.3227167905918832957;-1.1470339484308422762 -0.45202374112438792331 -1.5180863953432977009 0.79891744655516527818 -1.7686720118372234456 0.1831429326695972748;2.9209742824785740467 -1.1817648325311065349 0.94128402604454897151 -0.90480698811385995572 -0.7127883992249798295 1.0819155579706871695;0.20474901454627963959 -0.68131347956342180883 -1.2166454782663587153 3.9492048293374697465 -0.098273830737633960375 0.42623455732460113765;-0.41591925228476428478 1.294118654936646351 0.029030260882820985158 -1.8735057015639622335 0.97107277287117921283 -1.5130253866008926966;-1.6345458747241590203 -0.85657816219410953806 -0.61718335173283100925 -0.43592173728178262859 0.44367890448225255629 -1.8087760072187872851;0.60553657668994109731 -3.2281578490451581231 -2.8852166486568595616 2.6461795931469804799 1.4727909039833517735 0.84331522295701666359;-0.79786801876783008947 0.2531085652677060871 -1.2047130312134668451 0.80763400013465402871 -1.2497528921052689643 -1.5585754767783994712;-1.3769670710038317551 -1.8966484448045788369 -1.6735705556894870938 -0.67691585794386699426 -0.71762127856644686297 0.27476545037669863891];

% Layer 2
b2 = [-0.52875074445465897188;-0.22341669993993157339];
LW2_1 = [0.65882288452049675431 1.3319493740129877413 -0.20576411191259086353 -1.1420087210977529768 -0.96674277189706625535 -0.019071000037577629654 -0.60378723182426918825 0.87989361094253948359 -0.17555614457767015901 -0.93695894714528327185 -0.64636664542439958847 -0.13549941267276702228 -0.049250742304049896503 0.43011555648248850359 -0.076999915762401352493 1.8037945609050631823 1.0490055058711074132 -0.30015110357542718056 0.44729837947311207325 -0.38962666410252544402 -0.25027890332604213475 -0.67555593139615321974 0.74369958659929735756 -0.25726114348223561024 -3.2323766630915371501 -0.028807390218372596474 0.1546557426804412716 0.63507250424085381901 -2.2349168027752850385 -0.30586346647630413553 0.6260197194767402884 -0.44967697692495112172 0.0011082680553994653239 0.53954068234626051392 -2.7379946884650898653 -0.63973536633663530271 -0.55191241448861028118 -0.51200422239202836305 0.30865647314636890375 0.57134200036219273677 0.26170814019016097607 0.392120257713597542 -0.092831588945801069013 0.255551459895451194 0.85729296580019143104 0.60182696252813538962 -0.69402568283359800105 -1.1444951848597613164 -0.65955136817117299142 -0.83115767062492751371 -0.21151889225123335359 0.102232699545880934 0.12444771235465978965 -0.64420445867306497245 -0.50822752240502533372 -1.6437721180132938148 2.392423371463590076 -2.1637503072799111337 -1.4548401146753866531 -0.48698132015991374422 -0.33146958734593462426 0.50570075574262118856 -0.83013037730936711789 -0.55509660588661646763 0.53161711461510319232 0.50042475173544520572 -0.13694898364864491191 0.80922180578927815908 -0.72037654066442280421 1.2834346841553434526 0.047040409891967588374 -0.16503532818645080815 -0.013399507197418497953 0.10735567302644230536 -2.8072327478127561129 -0.99120005492340557129 -1.4844916571566271202 -1.3988331327063132647 -1.1986048608888206779 -0.16320800731889803514 -0.81918068895995876932 -1.0575121410192296345 1.7766918550474866123 -1.9480614439469903232 -2.463525656315310286 0.33073181270326657 -0.33102568174827340375 -0.83806280495850216106 0.75641941523558309246 0.22229581626227346014 0.99269955216265659548 0.03435605888449828893 -0.71796988266915884314 -0.012861247848927052917 -0.51253944912515170262 -0.26264031903065321316 0.3475201068344879185 0.24029513237949051696 -0.080428989572227813087 0.21838296945752583289;0.14450254706666726401 1.3676960650827147958 -1.7671625403520470066 -1.3441182503968605033 -0.1255007139973942365 -1.1811358549442290133 -0.5199635368127943913 1.7623327635446075501 -0.30032642208777582393 -0.7406807952066791767 0.36958081848293472538 -0.70662306350235715158 1.5301193280549192366 -0.18565939279918503013 -1.9719118042563363868 -1.1177136521850374873 0.62307705422903114645 -1.1051657202557298998 2.200798653026534879 1.0857956958300707395 -0.31455105520775428207 -0.082859519025844360907 1.0273183016155424951 0.73466203094344795232 1.8882775086275969123 2.2905731855441873179 0.30086718768839615379 -0.34717085313751261388 -0.63161182591601905401 0.91069302718020206378 -1.0916703376041358986 -3.4703804789608523329 -0.44702931182865807136 1.5481309991695972883 -1.0293468459126278169 0.65846647577775274662 0.37726408960825830174 -0.60935344099812982499 0.31234800291816300355 0.19240807168686441253 -2.3470169920821262188 -0.37148988745482119933 -0.64693735062111579204 -1.4062687042417436611 0.15707430281178438869 -0.233261480581264391 0.48605636668913387854 0.2509192020087745445 0.35184811258607517903 -1.0853455244940726221 -0.95574140542051733149 0.65066175969466144569 -0.1508614745134234103 -0.054468910292995269262 1.6000391943859431088 0.45639285005535190631 0.95093138774003271863 0.36815217033214631126 0.64042358076095606823 -0.092206126389066403459 1.3256835634546140223 -0.63810318399399768019 0.66531779416060554677 0.47202743891709192381 -0.11498397078780708824 -1.5274590924098832012 0.59771011551445674126 0.3265127645579938287 0.14984922727398947151 0.62781304403018500793 0.49582333499582942338 1.7283146129128208468 0.70308846660838553166 -0.34275830677803270641 0.72712381148361204808 0.41111135826732120302 1.0336824315489578918 -0.98720761151080771434 0.95975308154306215869 -0.25793202998486741695 1.7605526857507232119 1.0091450999047246739 -1.849520962416834502 0.72764044625965507151 -1.5680988546208212142 1.8501537720793490571 0.42058434129613675445 -0.43292622934692837067 -0.50637128824948340888 -2.1808329782511663986 0.68405488765306254884 0.17867748716363571204 -0.039361508052699265003 1.7822406208443133391 2.8150328511514728369 0.13179446947773043597 -0.95136254212089510496 1.6991945971686128747 0.39018091763389911586 0.8654703794653229032];

% Output 1
y1_step1.ymin = -1;
y1_step1.gain = [0.0800528182123108;0.0800281525621334];
y1_step1.xoffset = [10.0045011160944;10.0016947056354];

% ===== SIMULATION ========

% Format Input Arguments
isCellX = iscell(X);
if ~isCellX
    X = {X};
end

% Dimensions
TS = size(X,2); % timesteps
if ~isempty(X)
    Q = size(X{1},1); % samples/series
else
    Q = 0;
end

% Allocate Outputs
Y = cell(1,TS);

% Time loop
for ts=1:TS
    
    % Input 1
    X{1,ts} = X{1,ts}';
    Xp1 = mapminmax_apply(X{1,ts},x1_step1);
    
    % Layer 1
    a1 = tansig_apply(repmat(b1,1,Q) + IW1_1*Xp1);
    
    % Layer 2
    a2 = repmat(b2,1,Q) + LW2_1*a1;
    
    % Output 1
    Y{1,ts} = mapminmax_reverse(a2,y1_step1);
    Y{1,ts} = Y{1,ts}';
end

% Final Delay States
Xf = cell(1,0);
Af = cell(2,0);

% Format Output Arguments
if ~isCellX
    Y = cell2mat(Y);
end
end

% ===== MODULE FUNCTIONS ========

% Map Minimum and Maximum Input Processing Function
function y = mapminmax_apply(x,settings)
y = bsxfun(@minus,x,settings.xoffset);
y = bsxfun(@times,y,settings.gain);
y = bsxfun(@plus,y,settings.ymin);
end

% Sigmoid Symmetric Transfer Function
function a = tansig_apply(n,~)
a = 2 ./ (1 + exp(-2*n)) - 1;
end

% Map Minimum and Maximum Output Reverse-Processing Function
function x = mapminmax_reverse(y,settings)
x = bsxfun(@minus,y,settings.ymin);
x = bsxfun(@rdivide,x,settings.gain);
x = bsxfun(@plus,x,settings.xoffset);
end