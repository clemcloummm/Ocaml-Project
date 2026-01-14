This project is the minimal Ford-Fulkerson project. We also added some unit tests on known configurations, that you can run with "make tests"

To execute the algorithm, you can use make demo to see it being tested on the 10th graph (with 0 as source and 7 as sink).

If you'd like to choose your own graph and outputfile, you can use the following commands in a terminal :

make build

./ftest.exe your_graph.txt your_source your_sink your_outputfile.txt

dot -Tsvg your_outputfile.txt > some-output-file.svg


Enjoy seeing the graph in the "output.svg" :)



