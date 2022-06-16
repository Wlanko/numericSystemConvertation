# NUMERIC SYSTEM CONVERTATION
#### Video Demo: [(https://www.youtube.com/watch?v=z7igIejYzBY)](https://www.youtube.com/watch?v=z7igIejYzBY)
#### Description: 
  this is application that helps converting numbers to different base
  in order to use it you only need to download this repository and open it at Xcode
  run application, authorize with phone number
  and after it yo can write input numeriic system, iput number and output numric system in signed text field
  press button convert and see the result in output nuumber text field
  
TODO


## Minimum distance function
Our first function is called min_distance and it will return a vertex with a minimum distance from the source.
We use the for loop for the vertex variable in a certain range, which we define using the len function.
If the condition of the loop is true, then we go to the condition if and check the validity of the conditions specified in it,
if they are true, the vertex with the minimum distance from the source will be found. After the cycle, return the found vertex.

## Dijkstra algorithm function
Next we call a function that describes the Dijkstra algorithm that we use to modify the graph.
Find the number of vertices in the graph using the len () function. Then use the defaultdict dictionary
to check if this vertex is already included in the shortest path tree.
Then find the shortest distance for all vertices from the source.

# First for cycle
After completing the steps,
run the for loop for the variable count in the range of all vertices of the graph and determine the current vertex,
which is not yet included in the tree of the shortest path. Performing this action gives it the value True.

# Second for cycle
If the condition of the loop is true, and the actions in its body have been performed, we move on to the next loop for
inside the given for the vertex variable in the range of all vertices of the graph. Inside the loop we enter the condition if,
which in the absence of a given vertex in the graph tree, the weight of the source is greater than the weight of the current
vertex in the sum of the weight of the modified edge and the weight of this edge in the graph is not zero.

# Third for cycle
Then run another for loop, which will display the vertex number and the shortest distance to it from the source.

## Bellman-Ford algorithm function
Next, we turn to the function that describes the Bellman-Ford algorithm. Add the source vertex s to the existing graph.
We start a loop for the variable i in the range of all vertices of the graph with which we add edges to the graph.
After that, in the for loop for the variable i in the range of all vertices, we run another cycle, which uses the
condition inside it to calculate the minimum weight from the added vertex to each existing vertex.
After exiting the loop, use the return function so that the values ​​do not return to the added source.

## Johnson's algorithm function
Next, we turn to the main function that implements Johnson's algorithm. We create a list of edges of the graph determined
by the Bellman-Ford algorithm. To do this, run the for loop for the variable i, in the body of which run another for loop
for the variable j. If the edge under consideration is not equal to 0, the condition if specified in the loop is true and
this edge is added to the list.

# Creating altered graph and altered weights
We create a variable that will indicate the weights of the ribs that we use to change the original weights.
To do this, we take the data determined by the function describing the Bellman-Ford algorithm. Next, create a
new modified graph with the same number of vertices as in the input using the for loop and the len () function.

Gojo: I will now announce our destination. The hell!? Ouit spouting nonsense! Roppongi

Itadori/Nobara: Ro-ppo-ngi!!

Gojo: There is a curse here

#Itadory/Nobara: You are a lier
Itadori: This isn’t even Roppongi!
Nobara: You were toying with us, country folk!
Gojo: There is a big cemetery nearby. The double whammy of that and an abandoned building brought out the curse.
Itadori: So they really do pop up more often around graves? 
Nobara: Who does he thinks is responsible for the rice he gets to eat, huh? 
Megumi: The issue isn’t the cemetery itself. Its the fact that people associate cemetery with fear. 
#Itadori: Oh, it was the same for schools too, wasn’t it?
Nobara: Hold up, he didn’t even know that yet?
Megumi: To be honest…
Nobara: He swallowed a special grade cursed object?! Gvvh? Unbelievable?! That’s so unsanitary and disgusting! 
Nobara: No way.(4x)(said with fear and trembling)
Itadori: What? 
Megumi: I agree with her
Gojo: I want to know what all of you are capable of. Just think of it as a field test. Nobara, Yuuji you two go exorcise the curse inside that building. 
#Nobara: Шо…?
Itadori: Га, I thought only curses could exorcise curses, right? I cannot use any jujutsu yet.
Gojo: you are basically halve a curse already. There is a cursed energy flowing throughout your body. Thou controlling that energy isn’t something you can learn over night. So use this.
*every one is confused* 
Gojo: It’s the cursed tool, Slaughter Demon. Its a weapon imbued with a cursed energy. It will work on curses too.
Nobara: Lame 

#Gojo: O one more thing, don’t let Sukuna out. 
Gojo: If you use it you will get rid of all the curses nearby in a flash. But you will also drag everyone around into it
Itadori: Got it, I won’t let Sukuna out
Nobara: Hurry it up!
Itadori: Yeh yeh, go on now
