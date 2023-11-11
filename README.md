<h1>Age of Cockest 5</h1>
<blockquote><em>"Il tempo per i giochi &egrave; finito. Ora &egrave; il tempo di fare il gioco"&nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</em></blockquote>
<div style="text-align: right;"><em>cit. Qualcuno</em></div>
<div style="text-align: right;">&nbsp;</div>
<p>Lo sviluppo va a rilento ma non &egrave; momento di droppare tutto. Ci serve solo una <strong>migliore strutturazione
        del progetto</strong> e <strong>compiti specifici </strong>per poter progredire.</p>
<p>&nbsp;</p>
<p>Ho cercato di realizzare entrambi:</p>
<h2>1. Struttura del Progetto</h2>
<p style="padding-left: 40px;">Ho dato (finalmente) struttura alla directory del progetto; si presenta nella seguente
    maniera:</p>
<pre style="padding-left: 40px;">.
└── GodotProject
    ├── .godot
    ├── gamegraphic
    │   ├── characters
    │   │   ├── models
    │   │   └── script
    │   ├── map
    │   │   ├── models
    │   │   └── script
    │   └── UI
    │       ├── examples
    │       ├── ideas
    │       └── script
    ├── menu
    │   ├── img
    │   └── script
    ├── network
    │   └── TBD
    ├── .gitattributes
    ├── .gitignore
    ├── icon.svg
    ├── icon.svg.import
    ├── node_2d.tscn
    ├── project.godot
    └── README.md</pre>
<p style="padding-left: 40px;">&nbsp;</p>
<p style="padding-left: 40px;">in particolare abbiamo che:</p>
<ul style="padding-left: 80px;">
    <li>gamegraphic &egrave; la cartella che riguarda la scena di gioco, che include:
        <ul style="padding-left: 80px;">
            <li>i personaggi (characters), coi loro modelli e animazioni (models) e script che li riguarda,</li>
            <li>la mappa, con modelli 3D e script che manipolano il terreno di gioco e l'ambiente</li>
            <li>UI, ossia i bottoni che governano tutta l'interfaccia di gioco, tramite la quale il giocatore pu&ograve;
                controllare il proprio impero, risorse e diplomazia. Gli examples sono le immagini d'esempio dal quale
                prendere ispirazione per la realizzazione del vero e proprio ui. Ideas &egrave; la cartella di immagini
                di abbozzi di UI del gioco. Script &egrave; la cartella degli script</li>
        </ul>
    </li>
    <li>menu &egrave; la cartella che riguarda il men&ugrave; di gioco, ossia le immagini e gli script che controllano i
        comportamenti dei bottoni</li>
    <li>network &egrave; la cartella in cui successivamente caricare tutta la gestione client del server (To Be Defined)
    </li>
</ul>
<h3>&nbsp;</h3>
<h2>2. Compiti Assegnati</h2>
<p>Ho deciso di suddividere i compiti (<strong>in ordine di priorit&agrave;</strong>) seguendo la struttura della
    directory che ho costruito:</p>
<h3 style="padding-left: 40px;">- Game Graphic:</h3>
<ol>
    <li style="list-style-type: none;">
        <ol>
            <li>Fornire Mesh mappa 3D</li>
            <li>Impostare telecamera, angolazione mappa e illuminazione</li>
            <li>Fornire modelli 3D (in assenza di un vero e proprio character system, possiamo pure usarne a piacere,
                saranno solo a scopo di progettazione)</li>
            <li>Elaborare sistema movimento personaggio da un punto ad un altro&nbsp;</li>
            <li>Studiare principi di Design della UI di videogiochi</li>
            <li>Trovare idee per Design della UI, cercando da internet foto di altri giochi. Abbozzare poi, usando
                magari software online, il design della UI (possibilmente chi segue il il precedente dovrebbe seguire
                pure questo punto)</li>
            <li>Mettere texture e/o materiali alla mappa</li>
            <li>Fornire animazioni dei Modelli&nbsp;</li>
        </ol>
    </li>
</ol>
<p>&nbsp;</p>
<h3 style="padding-left: 40px;">- Menu:</h3>
<ol>
    <li style="list-style-type: none;">
        <ol>
            <li>Dare Struttura all'albero delle scene dei menu</li>
            <li>Sviluppare scena menu principale</li>
            <li>Sviluppare scena menu scelta gioco (single/multiplayer)</li>
            <li>Sviluppare scena menu impostazioni</li>
            <li>implementare bottoni e navigazione tra men&ugrave;</li>
            <li>Sviluppare man mano le altre scene o anche solo abbozzarle</li>
        </ol>
    </li>
</ol>
<h2>Considerazioni Finali</h2>
<p>I compiti che ho elencato <strong>NON SONO QUELLI DEFINITIVI</strong>; man mano che procediamo con lo sviluppo avremo
    una visione pi&ugrave; specifica e meno generale del progetto, cos&igrave; da poter dare compiti sempre pi&ugrave;
    mirati e meno generici. La "developing curve" per ora &egrave; ripida, dovremo fare sacrifici; &egrave; quando
    scaleremo le prime vette che potremo apprezzare la strada percorsa, ma fino ad allora&nbsp;</p>
<p><strong>ROMPETEVI</strong></p>
<p><strong>IL</strong></p>
<p><strong>CULO</strong></p>
<p><strong>SENZA</strong></p>
<p><strong>SOSTA</strong></p>
<p><strong><img
            src="./Big_Brother_1984.jpg"
            alt="" /></strong></p>
<p><strong>TRUST THE PROCESS</strong></p>
<p>grazie per l'attenzione e buon lavoro.</p>
 
