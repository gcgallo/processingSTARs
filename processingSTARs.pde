int n, c, i, k1, k2, BL, Rule, Gen, rn, j, r;
int[] bin = {0,0,1,0,1,0,1,0,1,0};
int[] RuleB = {1,0,0,1,1,1,0,1};
int[] bin2 = {0,0,0,0,0,0,0,0,0,0};
float e = 4;
    
void setup(){
  
   
   
   size(480, 640);

}


void draw(){
  
  textSize(24);
  background(0);
  frameRate(e);
  
  //Input:  1 <= Rule # <= 255
  //      0 <= # of Generations < 1000
  //      8 <= Width of Generation <= 64
  //      0 <= Initial configuration  <= 2^BL-1
  
  
  Rule = 55;
  
  Gen = 100;
  
  BL = 8;
  
  n = 112;


  //printArray(RuleB);

  
  /*bin[0]=0;    //edge is assumed FALSE
  //print("1   -"); //label for 1st generation
  bin[1] = 1;
  bin[2] = 0;
  bin[3] = 1;
  bin[4] = 0;
  bin[5] = 1;
  bin[6] = 0;
  bin[7] = 1;
  bin[8] = 0;
  bin[BL+1]=0;  //other edge also assumed FALSE*/
  

  for (i = 1; i <= BL; i++)
    {
      if (bin[i] == 0){
        text(" ", i*30, 30);
        }
      if (bin[i] == 1){
        text("*", i*30, 30);
        }
  }
  
  //j = 1; //initlize generation label to one
  
  //Generation Loop
  for(c = 1; c <= Gen; c++)
  { 
    j++;        //increment generation label
    bin2[0]=0;      //set edge cell to FALSE
    //print("%-4d-", j);  //print generation label
    bin2[BL+1]=0;    //set other edge cell to FALSE
    
     if ( c < 5 ){
        //translate(0,-30);
      }
      
    for (i = 1; i <= BL; i++)  
    {
      rn = (bin[i-1]*4) + (bin[i]*2) + (bin[i+1]*1);  //generate decimal number for neighboring cell conditions
      bin2[i] = RuleB[rn];  //based on neighboring cell conditions and Rule chose whether cell i LIVES or DIES
      
      if (bin2[i] == 0){    //print out a blank if cell dies
        text(" ", i*30, c*30);
        }
      if (bin2[i] == 1){    //print out a star if cell lives
        text("*", i*30, c*30);
        }
    }
    
   
    //print("-");        //end line with dash and 
    //print("\n");        //perform carriage return
    
    for (i = 0; i <= BL+1; i++)
    {
      bin[i]=bin2[i];      //overwrite previous generation with new generation
    }
  }

  for(c = 1; c <= Gen; c++)
    { 
      translate(0, - 30);
    }

}

void mouseWheel(MouseEvent event) {
  e += event.getCount();
  if(e < 1){
    e=1;
  }
  if(e > 60){
    e=60;
  }
  println(e);
}