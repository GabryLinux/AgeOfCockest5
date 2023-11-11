<h1>Age of Cockest 5</h1>
<blockquote><em>"Il tempo per i giochi &egrave; finito. Ora &egrave; il tempo di fare il gioco"&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</em></blockquote>
<div style="text-align: right;"><em>cit. Qualcuno</em></div>
<div style="text-align: right;">&nbsp;</div>
<p>Lo sviluppo va a rilento ma non &egrave; momento di droppare tutto. Ci serve solo una <strong>migliore strutturazione del progetto</strong> e <strong>compiti specifici </strong>per poter progredire.</p>
<p>&nbsp;</p>
<p>Ho cercato di realizzare entrambi:</p>
<h2>1. Struttura del Progetto</h2>
<p style="padding-left: 40px;">Ho dato (finalmente) struttura alla directory del progetto; si presenta nella seguente maniera:</p>
<pre style="padding-left: 40px;"><code>.
└── GodotProject
    ├── .godot
    ├── <strong>gamegraphic</strong>
    │   ├── <strong>characters</strong>
    │   │   ├── <strong>models</strong>
    │   │   └── <strong>script</strong>
    │   ├── <strong>map</strong>
    │   │   ├── <strong>models</strong>
    │   │   └── <strong>script</strong>
    │   └── <strong>UI</strong>
    │       ├── <strong>examples</strong>
    │       ├── <strong>ideas</strong>
    │       └── <strong>script</strong>
    ├── <strong>menu</strong>
    │   ├── <strong>img</strong>
    │   └── <strong>script</strong>
    ├── <strong>network</strong>
    │   └── TBD
    ├── .gitattributes
    ├── .gitignore
    ├── icon.svg
    ├── icon.svg.import
    ├── node_2d.tscn
    ├── project.godot
  	└── README.md</code></pre>
<p style="padding-left: 40px;">&nbsp;</p>
<p style="padding-left: 40px;">In particolare abbiamo che:</p>
<ul style="padding-left: 80px;">
<li><code>gamegraphic</code> &egrave; la cartella che riguarda la scena di gioco, che include:
<ul style="padding-left: 80px;">
<li>i personaggi (<code>characters</code>), coi loro modelli e animazioni (<code>models</code>) e <code>script </code>che li riguarda,</li>
<li>la <code>mappa</code>, con modelli 3D e script che manipolano il terreno di gioco e l'ambiente</li>
<li><code>UI</code>, ossia i bottoni che governano tutta l'interfaccia di gioco, tramite la quale il giocatore pu&ograve; controllare il proprio impero, risorse e diplomazia. Gli <code>examples</code> sono le immagini d'esempio dal quale prendere ispirazione per la realizzazione del vero e proprio ui. <code>Ideas </code>&egrave; la cartella di immagini di abbozzi di UI del gioco. <code>Script</code> &egrave; la cartella degli script</li>
</ul>
</li>
<li><code>menu</code> &egrave; la cartella che riguarda il men&ugrave; di gioco, ossia le immagini e gli script che controllano i comportamenti dei bottoni</li>
<li><code>network</code> &egrave; la cartella in cui successivamente caricare tutta la gestione client del server (To Be Defined)</li>
</ul>
<h3>&nbsp;</h3>
<h2>2. Compiti da Assegnare</h2>
<p>Ho deciso di suddividere i compiti (<strong>in ordine di priorit&agrave;</strong>) seguendo la struttura della directory che ho costruito:</p>
<h3 style="padding-left: 40px;">- Game Graphic:</h3>

<ol>
<li>Fornire <strong>Mesh mappa 3D</strong></li>
<li>Impostare <strong>telecamera</strong>, <strong>angolazione </strong>mappa e <strong>illuminazione</strong></li>
<li>Fornire <strong>modelli 3D personaggi </strong>(in assenza di un vero e proprio character system, possiamo pure usarne a piacere, saranno solo a scopo di progettazione)</li>
<li>Elaborare <strong>sistema movimento</strong> personaggio da un punto ad un altro&nbsp;</li>
<li><strong>Studiare principi di Design</strong> della UI di videogiochi</li>
<li><strong>Trovare idee per Design della UI</strong>, cercando da internet foto di altri giochi. Abbozzare poi, usando magari software online, il design della UI (possibilmente chi segue il il precedente dovrebbe seguire pure questo punto)</li>
<li>Mettere <strong>texture </strong>e/o <strong>materiali </strong>alla mappa</li>
<li>Fornire <strong>animazioni </strong>dei modelli personaggi</li>
<li>Fornire <strong>algoritmo </strong>di <strong>generazione </strong>e <strong>partizionamento </strong>casuale di <strong>mappe</strong>, con altrettanta distribuzione casuale di risorse</li>
<li><strong>Editor delle mappe</strong> per la comunit&agrave;</li>
</ol>
<p>&nbsp;</p>
<h3 style="padding-left: 40px;">- Menu:</h3>

<ol>
<li>Dare <strong>Struttura all'albero </strong>delle scene dei menu</li>
<li>Sviluppare scena <strong>menu principale</strong></li>
<li>Sviluppare scena <strong>menu scelta gioco</strong> (single/multiplayer)</li>
<li>Sviluppare scena <strong>menu impostazioni</strong></li>
<li>implementare <strong>bottoni </strong>e <strong>navigazione </strong>tra men&ugrave;</li>
<li>Sviluppare man mano le altre scene o anche solo <strong>abbozzarle</strong></li>
</ol>

<h2>Considerazioni Finali</h2>
<p>Chiunque pu&ograve; prendere i compiti che vuole <strong>ma&nbsp;</strong>bisogna considerare che : Bruno e Demetrio lavorano gi&agrave; alla UI, il <strong>Sottoscritto </strong>e Nicolas lavoriamo alla game graphic (<strong>io</strong> ai modelli 3d/ambiente, nicolas alla generazione della mappa). Per qualsiasi cosa, chiedere sul gruppo o personalmente a me.</p>
<p>I compiti che ho elencato <strong>NON SONO QUELLI DEFINITIVI</strong>; man mano che procediamo con lo sviluppo avremo una visione pi&ugrave; specifica e meno generale del progetto, cos&igrave; da poter dare compiti sempre pi&ugrave; mirati e meno generici. La "developing curve" per ora &egrave; ripida, dovremo fare sacrifici; &egrave; quando scaleremo le prime vette che potremo apprezzare la strada percorsa e <strong>ballare la fresca </strong>, ma fino ad allora&nbsp;</p>
<p><strong>ROMPETEVI</strong></p>
<p><strong>IL</strong></p>
<p><strong>CULO</strong></p>
<p><strong>SENZA</strong></p>
<p><strong>SOSTA</strong></p>
