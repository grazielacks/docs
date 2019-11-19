# JS - ES6

## Variáveis

    cons foo = 'Teste'; // não pode ser atribuido o valor na variavel, somente nas propriedades quando for um objeto
    let foo2 = 'Teste 2'; // não pode ser declarado mais de uma vez no mesmo escopo
    var foo3 = 'Teste 3'; // tentar não utilizar mais

## String
    
    let foo = 'Interpolação de strings';
    
    let text = `
    linha 1
    ${foo}
    linha 2
    linha 3
    `;
    

## For

    let array = [1,2,3,4];
    let obj = {
        first_name: 'Elton',
        last_name: 'Kolling'
    };
    
    for(let i in array) {
        console.log(i, array[i]);
    }
    
    for(let obj of array) {
        console.log(obj);
    }
    
    for(let [index, obj] of array.entries()) {
        console.log(index, obj);
    }
    
    for(let i in obj) {
        console.log(i, obj[i]);
    }
    
    for(let i of Object.keys(obj)) {
        console.log(i, obj[i]);
    }


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
    console.log(Retangulo.distancia(10, 20));
  

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
  

## Rest parameters

    function funcao(param1, param2, ...otherParams) {
        console.log(otherParams);
    }
    
    funcao(1,2,3,4,5,6);
    //ex: "(4) [3,4,5,6]"

    let array1 = [1,2,3,4];
    let array2 = [5,6,7,8,...array1];
    
    console.log(array2);
    //ex: [5,6,7,8,1,2,3,4]
    
    let string = 'Elton Luis';
    let stringArray = [...string];
    
    console.log(stringArray);
    //ex: ['E', 'l', 't', 'o', 'n', ' ', 'L', 'u', 'i', 's'];


## Property shortland

    let first_name = 'Elton',
        last_name = 'Kolling';
    
    let obj = {
        first_name,
        last_name,
        method(param1, param2) {
        }        
    };
    
    function funcao({first_name, last_name}) {
        console.log(first_name, last_name);
    }
    
    funcao(obj);
    //ex: "Elton Kolling"
    
    
