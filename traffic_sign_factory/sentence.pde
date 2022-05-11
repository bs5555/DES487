class sentence
{
  String sent = "";
  word[] mold;
  
  sentence(String s)
  {
    this.sent = s;
    String[] splitted = s.split("_");    
    this.mold = new word[splitted.length];
    for(int i=0; i<splitted.length; i++)
    {    
      this.mold[i] = new word(splitted[i].trim());
    }
  }
  
  void add(String w, String variant)
  {
    
    for(int i=0; i<this.mold.length; i++)
    {
      if(w.equals(this.mold[i].word)) 
      {
        String[] splitted1 = variant.split("_");
        for(int j=0; j< splitted1.length; j++)
        {
          this.mold[i].add(splitted1[j]);
        }
      }
    }
  }
  
  String make()
  {
    String res ="";
    for(int i=0; i<this.mold.length; i++)
    {
      res=res+" "+mold[i].make();
    }
    return(res);
  }
}

class word
{
   String word = "";
   String[] variant = new String[1000];
   int wcount = 0;
   
   word(String w)
   {
     this.word=w;
     this.variant[this.wcount] = w;
     this.wcount++;
   }
   
   void add(String w)
   {
     this.variant[this.wcount] = w;
     this.wcount++;
   }
   
   String make()
   {
     int index = round(random(this.wcount-1));
     return(this.variant[index]);
   }
}
