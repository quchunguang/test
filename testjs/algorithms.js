var util = require('util');

function Graph(v) {
    this.vertices = v;
    this.edges = 0;
    this.adj = [];
    for(var i = 0;i<v;i++){
        this.adj[i] = [];
    }
    this.addEdge = addEdge;
    this.showGraph = showGraph;
}

function addEdge(v, w) {
    this.adj[v].push(w);
    this.adj[w].push(v);
    this.edges++;
}

function showGraph() {
    for(var i = 0; i<this.vertices; i++) {
        util.print(i,' -> ');
        for(var j=0;j<this.adj[i].length;j++){
            util.print(this.adj[i][j], ", ");
        }
        util.print("\n");
    }
}
g= new Graph(5);
g.addEdge(0,1);
g.addEdge(0,2);
g.addEdge(1,3);
g.addEdge(2,4);
g.showGraph();
