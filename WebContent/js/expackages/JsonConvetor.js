var $changeNodes = function(inputGenes,Nodes,shape,bgColor){    
    for(var i=0;i<Nodes.length;i++){
    	for(var j = 0;j<inputGenes.length;j++){
        		if(Nodes[i].data.id == inputGenes[j].id){
        			//array.push(Edges[i]);
        			Nodes[i].data.nodecolor = bgColor;
        			Nodes[i].data.favorshape = shape;
        			//Edges[i].data.linestyle = lineStyle;
        		}
    	}    	
    }
    return Nodes;
};
var $changeBrowseEdges= function(inputGenes,Edges,lineColor,lineStyle){
	for(var i=0;i<Edges.length;i++){
		if(Edges[i].data.source == inputGenes && Edges[i].data.target == inputGenes){
			Edges[i].data.edgecolor = lineColor;
			Edges[i].data.linestyle = lineStyle; 
		}	
    }
	return Edges;
};
var $changeEdges= function(inputGenes,Edges,lineColor,lineStyle){
	for(var i=0;i<Edges.length;i++){
    	for(var j = 0;j<inputGenes.length;j++){
    		for(var k = 0;k<inputGenes.length;k++){
        		if(Edges[i].data.source == inputGenes[j].id && Edges[i].data.target == inputGenes[k].id /*|| (Edges[i].data.target == inputGenes[j].id && Edges[i].data.source == inputGenes[k].id)*/){
        			Edges[i].data.edgecolor = lineColor;
        			Edges[i].data.linestyle = lineStyle;
        		}
    		}
    	}   	
    }
	return Edges;
};
var $changeLayout = function(node,nodes,nodecolor,favorshape){
	for(var i = 0;i < nodes.length;i++){
		if(nodes[i].data.id == node){
			nodes[i].data.nodecolor = nodecolor;
			nodes[i].data.favorshape = favorshape;
		}
	}
	return nodes;
};


//innerSearch
var $changeTable = function(inputGenes,table){
	var innerTable = new Array();
	for(var i=0;i<table.length;i++){
    	for(var j = 0;j<inputGenes.length;j++){
    		for(var k = 0;k<inputGenes.length;k++){
        		if(table[i].genename1 == inputGenes[j].id && table[i].genename2 == inputGenes[k].id /*|| (table[i].genename1 == inputGenes[j].id && table[i].genename2 == inputGenes[k].id)*/){
        			innerTable.push(table[i]);
        		}
    		}
    	}   	
    }
	return innerTable;	
}

var $changeInnerNodes = function(inputGenes,Nodes){ 
	var innerNodes = new Array();
    for(var i=0;i<Nodes.length;i++){
    	for(var j = 0;j<inputGenes.length;j++){
        		if(Nodes[i].data.id == inputGenes[j].id){
        			innerNodes.push(Nodes[i]);
        		}
    	}    	
    }
    return innerNodes;
};
var $changeInnerEdges= function(inputGenes,Edges){
	var innerEdges = new Array();
	for(var i=0;i<Edges.length;i++){
    	for(var j = 0;j<inputGenes.length;j++){
    		for(var k = 0;k<inputGenes.length;k++){
        		if(Edges[i].data.source == inputGenes[j].id && Edges[i].data.target == inputGenes[k].id /*|| (Edges[i].data.target == inputGenes[j].id && Edges[i].data.source == inputGenes[k].id)*/){
        			innerEdges.push(Edges[i]);
        		}
    		}
    	}   	
    }
	return innerEdges;
};