// reading a text file
#include <iostream>
#include <fstream>
#include <string>
#include <cstring>
using namespace std;
#include <stdlib.h>

int main(int argc, char** argv){
	string line;
	double totalScore = 0.0;
	double numberScore = 0;
	double averageScore = 0.0;
	double score = 0.0;

	if (argc==4){
		ifstream myfile ("Deals.csv");
		if (myfile.is_open()){
			while (getline(myfile,line,',')){
				if (line==argv[2]){
					getline(myfile,line,',');
					if (line==argv[3]){
						for (int i=0; i<5; i++){
							getline(myfile,line,',');
						}

						if(line.c_str()=="nan"){
							score = 0;
						}else{
							score = atof(line.c_str());
						}
						totalScore += score;
						numberScore ++;
					}
				}
			}
			myfile.close();
		}
		else{
			cout << "Unable to open file";
		}
	}else{
		cout << "USAGE: ./parseFile Deals.csv numberDeparture numberDestination";
	}
	averageScore = totalScore/numberScore;
	cout << "average score "<< averageScore << '\n';
	return 0;
}
