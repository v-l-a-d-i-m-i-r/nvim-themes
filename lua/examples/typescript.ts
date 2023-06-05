import * as fs from 'fs'

const myRetgex = /^(.)*\//;

abstract class MyClass {
  constructor() {}

  public async myMethod(string1: string, unusedString: string): Promise<boolean> {
    console.log(`before ${this.constructor.name} after`, string1);

    console.log(fs, true);

    return false
  }
}

class OtherClass extends MyClass {}
