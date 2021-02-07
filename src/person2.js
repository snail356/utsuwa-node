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
    }
}

export default Person;
