class rules
{
  rule[] stuff = new rule[1000];
  int nrule = 0;
  
  void rules()
  {
    
  }
  
  void addRule(String _name, int _value)
  {
    this.stuff[nrule]=new rule(_name,_value);
    nrule++;
  }
  
  void emptyRules()
  {
    this.stuff = new rule[1000];
    this.nrule = 0;
    initRules();
  }
  
  void modifyRule(String name, int val)
  {
    for(int i=0; i < this.nrule;i++)
    {
      if(name.equals(this.stuff[i].name))
      {
        this.stuff[i].value = this.stuff[i].value+val;
      }
    }
  }
  
  void printRules()
  {
    for(int i=0; i < this.nrule; i++)
    {
      text(this.stuff[i].name +" :: "+ this.stuff[i].value,800,(i*10)+20);
    }
  }
}

class rule
{
  String name = "";
  int value = 0;
  
  rule(String _name, int _value)
  {
    this.name=_name;
    this.value=_value;
  }
  
  void mod(int _value)
  {
    this.value=_value;
  }
}
