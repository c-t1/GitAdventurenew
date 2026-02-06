class Node {
  constructor(value, adjacent = new Set()) {  //every Node starts with an empty Set of neighbors.
    this.value = value;
    this.adjacent = adjacent;
  }
}

class Graph {
  constructor() {
    this.nodes = new Set();
  }

  // this function accepts a Node instance and adds it to the nodes property on the graph
  addVertex(vertex) {
    this.nodes.add(vertex)  //this.nodes is a Set that stores all vertices in the graph. .add(vertex) puts that Node into the Set. 
  }

  // this function accepts an array of Node instances and adds them to the nodes property on the graph
  addVertices(vertexArray) {
    for(let vertex of vertexArray) {
      this.addVertex(vertex)
    }
  }

  // this function accepts two vertices and updates their adjacent values to include the other vertex
  addEdge(v1, v2) {
    v1.adjacent.add(v2);
    v2.adjacent.add(v1);
  }

  // this function accepts two vertices and updates their adjacent values to remove the other vertex
  removeEdge(v1, v2) {
    v1.adjacent.delete(v2);
    v2.adjacent.delete(v1);
  }

  // this function accepts a vertex and removes it from the nodes property, it also updates any adjacency lists that include that vertex
  removeVertex(vertex) {
    for (let neighbor of vertex.adjacent){
      neighbor.adjacent.delete(vertex);
    }

    vertex.adjacent.clear();

    this.nodes.delete(vertex);
  }

  // this function returns an array of Node values using DFS
  depthFirstSearch(start) {
    const stack = [start];
    const visited = new Set([start]);
    const result = [];

    while (stack.length) {
      const node = stack.pop();
      result.push(node.value);

      for (let neighbor of node.adjacent){
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          stack.push(neighbor);
        }
      }
    }

    return result;
  }

  // this function returns an array of Node values using BFS
  breadthFirstSearch(start) {
    const queue = [start];
    const visited = new Set([start]);
    const result = [];

    while (queue.length) {
      const node = queue.shift();
      result.push(node.value);

      for (let neighbor of node.adjacent) {
        if (!visited.has(neighbor)) {
          visited.add(neighbor);
          queue.push(neighbor);
        }
      }
    }
    
    return result;
  }
}

module.exports = {Graph, Node}

//set.add(x) > add
//set.has(x) > checks if exists
//set.delete(x) > remove
//for (let item of set) > loop through it