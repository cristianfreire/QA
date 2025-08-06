# coding: utf-8

DATABASE = {
    name: {
        name1: 'Tony',
        name2: 'Alberto',
        name3: 'Diana',
        name4: 'Elaine',
        name5: Faker::Name.name
    },

    salary: {
        salary1: 11561,
        salary2: 56151,
        salary3: 65265,
        salary4: 565165,
        salary5: Faker::Number.number
    },

    age: {
        age1: 52,
        age2: 44,
        age3: 25,
        age4: 25,
        age5: Faker::Number.number(digits: 2)
    }
}