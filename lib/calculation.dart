
 class Calculation
{
  dynamic _result = 0;
  dynamic get result => _result;
    

  Calculation.add(String str)
  {
    if(str.contains('+'))
    {
      var frstIndex = str.indexOf('+');
      var leftString = str.substring(0,frstIndex);
      var rightString = str.substring(frstIndex + 1, str.length);
      if(leftString.isNotEmpty && rightString.isNotEmpty)
      {
        int leftNum = int.parse(leftString);
        int rightNum = int.parse(rightString);
        _result = leftNum + rightNum;
      }
     
    }
    print(str);
  }

  get get => null;
}
