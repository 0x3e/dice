Die=require('./lib/die').Die;
Dice=require('./lib/dice').Dice;
d=new Dice("3d6");
console.log(d);
console.log(d.get_total());
console.log(d.get_total('2d4+1'));
console.log(d);
console.log(d.get_total('2d4-3'));
console.log(d);
