const obj = {
  sayHello(a, b, c) {
    console.log(a, b, c)
  }
}

[].forEach(obj.sayHello)
