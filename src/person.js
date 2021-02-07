class Person {
    constructor(name='noname', age=20) {
        this.name = name;
        this.age = age;
        this.bbb = 'abc';
    }
    toJSON(){
        return {
            name: this.name,
            age: this.age,
        }
        // return JSON.stringify({
        //     name: this.name,
        //     age: this.age,
        // })
    }
    /*
    aaa = ()=>{
        return 123;
    }
     */
}

module.exports = Person;