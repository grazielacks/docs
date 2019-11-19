# JS - ES6

## Arrow Functions
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Functions/Arrow_functions

  let array = [1,2,3,4,5];
  
  let novoArray = array.map(value => value * 10);
  
  let novoArray2 = array.map((value, outraVariavel) => value * 10);
  
  let novoArray3 = array.map((value, outraVariavel) => {
    // executar outras coisas.
    return value * 10;
  });
  
  let semAttributo = () => 22 * 10;


## Classes
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Classes
  
  class Retangulo {
    constructor(altura, largura) {
      this.altura = altura;
      this.largura = largura;
    }
    
    get area() {
      return this.calculaArea()  
    }  
  
    calculaArea() {  
      return this.altura * this.largura;  
    }
    
    static distancia(a, b) {
      const dx = a.x - b.x;
      const dy = a.y - b.y;

      return Math.hypot(dx, dy);
    }
  }
  
  const quadrado = new Retangulo(10, 10);
  console.log(quadrado.area);
  

## Trabalhando com datas
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/DateTimeFormat
  
  let today = new Date();
  
  new Intl.DateTimeFormat('pt-BR').format(date);
  //ex: "19/11/2019"
  
  new Intl.DateTimeFormat('en-US').format(date);
  //ex: "11/19/2019"

  new Intl.DateTimeFormat('pt-BR', { month: 'long' }).format(date);
  //ex: "novembro"
  
  new Intl.DateTimeFormat('pt-BR', { month: 'long', day: 'numeric', year: 'numeric' }).format(date);
  //ex: "19 de novembro de 2019"


## Trabalhando com números
https://developer.mozilla.org/pt-BR/docs/Web/JavaScript/Reference/Global_Objects/NumberFormat

  new Intl.NumberFormat('pt-BR').format(2000.23);
  //ex: "2.000,23"
  
  new Intl.NumberFormat('pt-BR', { minimumFractionDigits: 2 }).format(2000);
  //ex: "2.000,00"

  new Intl.NumberFormat('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2 }).format(2000.23547);
  //ex: "2.000,23"
  
  new Intl.NumberFormat('pt-BR', { minimumFractionDigits: 2, maximumFractionDigits: 2, currency: 'BRL', style: 'currency' }).format(2000.23547);
  //ex: "RS 2.000,23"
  




