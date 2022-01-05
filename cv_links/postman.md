# HW_2 Postman

###### http://162.55.220.72:5005/first
1. Отправить запрос.
2. Статус код 200
```javascript
pm.test("Status code is 200", function () {
	pm.response.to.have.status(200);
});
```
3. Проверить, что в body приходит правильный string.
```javascript
// pm.test("Body matches string", function () {
//     pm.expect(pm.response.text()).to.include("This is the first responce from server!");
// });
pm.test("Body matches string", function () {
    var responseText = pm.response.text();
    pm.expect(responseText).to.be.a("string");
});
```

###### http://162.55.220.72:5005/user_info_3
1. Отправить запрос. 
(method: POST
request form data: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Проверить, что name в ответе равно name s request (name вбить руками.)
```javascript
pm.test("Name is Dmitry", () => {
    pm.expect(responseJson.name).to.eql("Dmitry");
});
```
5. Проверить, что age в ответе равно age s request (age вбить руками.)
```javascript
// console.log(typeof(responseJson.age)); - to check if age is a String type
pm.test("Age is 31", () => {
    pm.expect(responseJson.age).to.eql("31");
});
```
6. Проверить, что salary в ответе равно salary s request (salary вбить руками.)
```javascript
// console.log(typeof(responseJson.salary)); - to check if salary is a Number
pm.test("Salary is 1000", () => {
    pm.expect(responseJson.salary).to.eql(1000);
});
```
7. Спарсить request.
```javascript
var requestBody = request.data;
```
8. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestBody.name);
});
// pm.test("Name from response equals name from request (manually)", () => {
//     pm.expect("Dmitry").to.eql(requestBody.name);
// });
```
9. Проверить, что age в ответе равно age s request (age забрать из request.)
```javascript
pm.test("Age from response equals age from request", () => {
    pm.expect(responseJson.age).to.eql(requestBody.age);
});
```
10. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```javascript
pm.test("Salary from response equals salary from request", () => {
	pm.expect(parseInt(responseJson.salary)).to.eql(parseInt(requestBody.salary));
});
```
11. Вывести в консоль параметр family из response.
```javascript
console.log(responseJson.family);
```
12. Проверить что u_salary_1_5_year в ответе равно salary*4 (salary забрать из request)
```javascript
pm.test("Salary in 4 years from response equals salary*4", () => {
	pm.expect(responseJson.family.u_salary_1_5_year).to.eql(requestBody.salary * 4);
});
```

###### http://162.55.220.72:5005/object_info_3
1. Отправить запрос.
(method: GET
params: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestParams.name);
});
```
6. Проверить, что age в ответе равно age s request (age забрать из request.)
```javascript
pm.test("Age from response equals age from request", () => {
    pm.expect(responseJson.age).to.eql(requestParams.age);
});
```
7. Проверить, что salary в ответе равно salary s request (salary забрать из request.)
```javascript
pm.test("Salary from response equals salary from request", () => {
    pm.expect(responseJson.salary).to.eql(parseInt(requestParams.salary));
});
```
8. Вывести в консоль параметр family из response.
```javascript
console.log(responseJson.family);
```
9. Проверить, что у параметра dog есть параметры name.
```javascript
pm.test("Dog parameter has a Name parameter", () => {
    pm.expect(pm.response.json("dog")).to.have.property("name");
});
// pm.test("Dog parameter has a Name parameter", () => {
//     pm.expect(responseJson.family.pets.dog).to.have.property("name");
// });
```
10. Проверить, что у параметра dog есть параметры age.
```javascript
pm.test("Dog parameter has an Age parameter", () => {
    pm.expect(pm.response.json("dog")).to.have.property("age");
});
```
11. Проверить, что параметр name имеет значение Luky.
```javascript
pm.test("Name equals 'Luky'", () => {
    pm.expect(responseJson.family.pets.dog.name).to.eql("Luky");
});
```
12. Проверить, что параметр age имеет значение 4.
```javascript
pm.test("Age equals 4", () => {
    pm.expect(responseJson.family.pets.dog.age).to.eql(4);
});
```

###### http://162.55.220.72:5005/object_info_4
1. Отправить запрос.
(method GET
params: name: str, age: int, salary: int)
2. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
3. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
4. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
5. Проверить, что name в ответе равно name s request (name забрать из request.)
```javascript
pm.test("Name from response equals name from request", () => {
    pm.expect(responseJson.name).to.eql(requestParams.name);
});
```
6. Проверить, что age в ответе равно age из request (age забрать из request.)
```javascript
pm.test("Age from response equals Age from request", () => {
    pm.expect(responseJson.age).to.eql(parseInt(requestParams.age));
});
```
7. Вывести в консоль параметр salary из request.
```javascript
console.log(requestParams.salary);
```
8. Вывести в консоль параметр salary из response.
```javascript
console.log(responseJson.salary);
```
9. Вывести в консоль 0-й элемент параметра salary из response.
```javascript
console.log("The first element of salary from response: " + responseJson.salary[0]);
```
10. Вывести в консоль 1-й элемент параметра salary параметр salary из response.
```javascript
console.log("The second element of salary from request: " + responseJson.salary[1]);
```
11. Вывести в консоль 2-й элемент параметра salary параметр salary из response.
```javascript
console.log("The third element of salary from request: " + responseJson.salary[2]);
```
12. Проверить, что 0-й элемент параметра salary равен salary из request (salary забрать из request.)
```javascript
pm.test("The first element of salary from response equals salary from request", () => {
    pm.expect(JSON.stringify(responseJson.salary[0])).to.eql(requestParams.salary);
})
```
13. Проверить, что 1-й элемент параметра salary равен salary*2 из request (salary забрать из request.)
```javascript
pm.test("The second element of salary from response equals salary*2 from request", () => {
    pm.expect(parseInt(responseJson.salary[1])).to.eql(parseInt(requestParams.salary) * 2);
})
```
14. Проверить, что 2-й элемент параметра salary равен salary*3 из request (salary забрать из request.)
```javascript
pm.test("The third element of salary from response equals salary*3 from request", () => {
    pm.expect(parseInt(responseJson.salary[2])).to.eql(parseInt(requestParams.salary) * 3);
})
```
15. Создать в окружении переменную name
16. Создать в окружении переменную age
17. Создать в окружении переменную salary
18. Передать в окружение переменную name
```javascript
pm.environment.set("name", requestParams.name);
```
19. Передать в окружение переменную age
```javascript
pm.environment.set("age", requestParams.age);
```
20. Передать в окружение переменную salary
```javascript
pm.environment.set("salary", requestParams.salary);
```
21. Написать цикл который выведет в консоль по порядку элементы списка из параметра salary.
```javascript
for (var i = 0; i < responseJson.salary.length; i++) {
	console.log(responseJson.salary[i]);
}
```

###### http://162.55.220.72:5005/user_info_2
1. Вставить параметр salary из окружения в request
2. Вставить параметр age из окружения в age
3. Вставить параметр name из окружения в name
4. Отправить запрос.
5. Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
6. Спарсить response body в json.
```javascript
var responseJson = pm.response.json();
```
7. Спарсить request.
```javascript
var requestParams = pm.request.url.query.toObject();
```
8. Проверить, что json response имеет параметр start_qa_salary
```javascript
pm.test("Response has start_qa_salary parameter", () => {
    pm.expect(responseJson).to.have.property("start_qa_salary");
});
```
9. Проверить, что json response имеет параметр qa_salary_after_6_months
```javascript
pm.test("Response has qa_salary_after_6_months parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_6_months");
});
```
10. Проверить, что json response имеет параметр qa_salary_after_12_months
```javascript
pm.test("Response has qa_salary_after_12_months parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_12_months");
});
```
11. Проверить, что json response имеет параметр qa_salary_after_1.5_year
```javascript
pm.test("Response has qa_salary_after_1.5_year parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_1.5_year");
});
```
12. Проверить, что json response имеет параметр qa_salary_after_3.5_years
```javascript
pm.test("Response has qa_salary_after_3.5_years parameter", () => {
    pm.expect(responseJson).to.have.property("qa_salary_after_3.5_years");
});
```
13. Проверить, что json response имеет параметр person
```javascript
pm.test("Response has person parameter", () => {
    pm.expect(responseJson).to.have.property("person");
});
```
14. Проверить, что параметр start_qa_salary равен salary из request (salary забрать из request.)
```javascript
pm.test("start_qa_salary from response equals start_qa_salary from request", () => {
    pm.expect(responseJson.start_qa_salary).to.eql(parseInt(requestParams.salary));
});
```
15. Проверить, что параметр qa_salary_after_6_months равен salary*2 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_6_months from response equals salary*2 from request", () => {
    pm.expect(responseJson.qa_salary_after_6_months).to.eql(parseInt(requestParams.salary) * 2);
});
```
16. Проверить, что параметр qa_salary_after_12_months равен salary*2.7 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_12_months from response equals salary*2.7 from request", () => {
    pm.expect(responseJson.qa_salary_after_12_months).to.eql(parseInt(requestParams.salary) * 2.7);
});
```
17. Проверить, что параметр qa_salary_after_1.5_year равен salary*3.3 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_1.5_year from response equals salary*3.3 from request", () => {
    pm.expect(responseJson["qa_salary_after_1.5_year"]).to.eql(parseInt(requestParams.salary) * 3.3);
});
// pm.test("qa_salary_after_1.5_year from response equals salary*3.3 from request", () => {
//    pm.expect(responseJson).to.have.property("qa_salary_after_1.5_year").to.eql(parseInt(requestParams.salary) * 3.3);
// });
```
18. Проверить, что параметр qa_salary_after_3.5_years равен salary*3.8 из request (salary забрать из request.)
```javascript
pm.test("qa_salary_after_3.5_years from response equals salary*3.8 from request", () => {
    pm.expect(responseJson["qa_salary_after_3.5_years"]).to.eql(parseInt(requestParams.salary) * 3.8);
});
// pm.test("qa_salary_after_3.5_years from response equals salary*3.8 from request", () => {
//     pm.expect(responseJson).to.have.property("qa_salary_after_3.5_years").to.eql(parseInt(requestParams.salary) * 3.8);
// });
```
19. Проверить, что в параметре person, 1-й элемент из u_name равен salary из request (salary забрать из request.)
```javascript
pm.test("The first (actually the second) element from u_name equals salary from request", () => {
    pm.expect(responseJson.person.u_name[1]).to.eql(parseInt(requestParams.salary));
});
```
20. Проверить, что что параметр u_age равен age из request (age забрать из request.)
```javascript
pm.test("u_age equals age from request", () => {
    pm.expect(responseJson.person.u_age).to.eql(parseInt(requestParams.age));
});
```
21. Проверить, что параметр u_salary_5_years равен salary*4.2 из request (salary забрать из request.)
```javascript
pm.test("u_salary_5_years from response equals salary*4.2 from request", () => {
    pm.expect(responseJson.person.u_salary_5_years).to.eql(parseInt(requestParams.salary) * 4.2);
});
```
22. ** *Написать цикл который выведет в консоль по порядку элементы списка из параметра person.**
```javascript
for (const key in responseJson.person) {
    console.log(`${key}: ${responseJson.person[key]}`);
}
```

# HW_3 Postman

###### 1) http://162.55.220.72:5005/login
необходимо залогиниться
POST
login : str (кроме /)
password : str

Приходящий токен необходимо передать во все остальные запросы.
```javascript
var responseData = pm.response.json();
pm.environment.set("auth_token", responseData.token);
```
дальше все запросы требуют наличие токена.

###### 2) http://162.55.220.72:5005/user_info
req. (RAW JSON)
POST
age: int
salary: int
name: str
auth_token

resp.
```javascript
{'start_qa_salary':salary,
 'qa_salary_after_6_months': salary * 2,
 'qa_salary_after_12_months': salary * 2.9,
 'person': {'u_name':[user_name, salary, age],
                                'u_age':age,
                                'u_salary_1.5_year': salary * 4}
                                }
```

Тесты:
1) Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
2) Проверка структуры json в ответе.
```javascript
var schema = {
  "type": "object",
  "properties": {
    "person": {
      "type": "object",
      "properties": {
        "u_age": {
          "type": "integer"
        },
        "u_name": {
          "type": "array",
          "items": [
            {
              "type": "string"
            },
            {
              "type": "integer"
            },
            {
              "type": "integer"
            }
          ]
        },
        "u_salary_1_5_year": {
          "type": "integer"
        }
      },
      "required": [
        "u_age",
        "u_name",
        "u_salary_1_5_year"
      ]
    },
    "qa_salary_after_12_months": {
      "type": "number"
    },
    "qa_salary_after_6_months": {
      "type": "integer"
    },
    "start_qa_salary": {
      "type": "integer"
    }
  },
  "required": [
    "person",
    "qa_salary_after_12_months",
    "qa_salary_after_6_months",
    "start_qa_salary"
  ]
}
```
```javascript
pm.test("Validate schema", () => {
    pm.response.to.have.jsonSchema(schema);
});
```
3) В ответе указаны коэффициенты умножения salary, напишите тесты по проверке правильности результата перемножения на коэффициент.
```javascript
var requestData = request.data;
var responseData = pm.response.json();
var salary_from_request = pm.variables.get("salary");

pm.test("Salary in 6 months should be equal 1000 * 2", () => {
    pm.expect(responseData.qa_salary_after_6_months).to.eql(salary_from_request * 2);
});

pm.test("Salary in 12 months should be equal 1000 * 2.9", () => {
    pm.expect(responseData.qa_salary_after_12_months).to.eql(salary_from_request * 2.9);
});

pm.test("Salary in 1,5 year should be equal 1000 * 4", () => {
    pm.expect(responseData.person.u_salary_1_5_year).to.eql(salary_from_request * 4);
});
```
4) Достать значение из поля 'u_salary_1.5_year' и передать в поле salary запроса http://162.55.220.72:5005/get_test_user
```javascript
pm.environment.set("salary_in_1_5_year", responseData.person.u_salary_1_5_year);
```

###### 3) http://162.55.220.72:5005/new_data
req.
POST
age: int
salary: int
name: str
auth_token

Resp.
```javascript
{'name':name,
  'age': int(age),
  'salary': [salary, str(salary*2), str(salary*3)]}
```

Тесты:
1) Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
2) Проверка структуры json в ответе.
```javascript
var schema = {
  "type": "object",
  "properties": {
    "age": {
      "type": "integer"
    },
    "name": {
      "type": "string"
    },
    "salary": {
      "type": "array",
      "items": [
        {
          "type": "integer"
        },
        {
          "type": "string"
        },
        {
          "type": "string"
        }
      ]
    }
  },
  "required": [
    "age",
    "name",
    "salary"
  ]
};

pm.test("Validate schema", () => {
    pm.response.to.have.jsonSchema(schema);
});
```
3) В ответе указаны коэффициенты умножения salary, напишите тесты по проверке правильности результата перемножения на коэффициент.
```javascript
pm.test("Salary * 2 equals 2000", () => {
    pm.expect(parseInt(responseData.salary[1])).to.eql(salary_from_request * 2);
});

pm.test("Salary * 3 equals 3000", () => {
    pm.expect(parseInt(responseData.salary[2])).to.eql(salary_from_request * 3);
});
```
4) проверить, что 2-й элемент массива salary больше 1-го и 0-го
```javascript
pm.test("3rd element in the salary array is greater than the 1st and 2nd", () => {
    pm.expect(parseInt(responseData.salary[2])).to.be.greaterThan(parseInt(responseData.salary[1])).and.to.be.greaterThan(parseInt(responseData.salary[0]));
});
```

###### 4) http://162.55.220.72:5005/test_pet_info
req.
POST
age: int
weight: int
name: str
auth_token

Resp.
```javascript
{'name': name,
 'age': age,
 'daily_food':weight * 0.012,
 'daily_sleep': weight * 2.5}
```

Тесты:
1) Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
2) Проверка структуры json в ответе.
```javascript
var schema = {
  "type": "object",
  "properties": {
    "age": {
      "type": "integer"
    },
    "daily_food": {
      "type": "number"
    },
    "daily_sleep": {
      "type": "number"
    },
    "name": {
      "type": "string"
    }
  },
  "required": [
    "age",
    "daily_food",
    "daily_sleep",
    "name"
  ]
};

pm.test("Validate schema", () => {
    pm.response.to.have.jsonSchema(schema);
});
```
3) В ответе указаны коэффициенты умножения weight, напишите тесты по проверке правильности результата перемножения на коэффициент.
```javascript
var requestData = request.data;
var responseData = pm.response.json();

pm.test("Food * 0.012 equals 0.744", () => {
    pm.expect(requestData.weight * 0.012).to.eql(responseData.daily_food);
});

pm.test("Sleep * 2.5 equals 155.0", () => {
    pm.expect(requestData.weight * 2.5).to.eql(responseData.daily_sleep);
});
```

###### 5) http://162.55.220.72:5005/get_test_user
req.
POST
age: int
salary: int
name: str
auth_token

Resp.
```javascript
{'name': name,
 'age':age,
 'salary': salary,
 'family':{'children':[['Alex', 24],['Kate', 12]],
 'u_salary_1.5_year': salary * 4}
  }
```

Тесты:
1) Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
2) Проверка структуры json в ответе.
```javascript
var schema = {
  "type": "object",
  "properties": {
    "age": {
      "type": "string"
    },
    "family": {
      "type": "object",
      "properties": {
        "children": {
          "type": "array",
          "items": [
            {
              "type": "array",
              "items": [
                {
                  "type": "string"
                },
                {
                  "type": "integer"
                }
              ]
            },
            {
              "type": "array",
              "items": [
                {
                  "type": "string"
                },
                {
                  "type": "integer"
                }
              ]
            }
          ]
        },
        "u_salary_1_5_year": {
          "type": "integer"
        }
      },
      "required": [
        "children",
        "u_salary_1_5_year"
      ]
    },
    "name": {
      "type": "string"
    },
    "salary": {
      "type": "integer"
    }
  },
  "required": [
    "age",
    "family",
    "name",
    "salary"
  ]
};
```
```javascript
pm.test("Validate schema", () => {
    pm.response.to.have.jsonSchema(schema);
});
```
3) Проверить что занчение поля name = значению переменной name из окружения
```javascript
var requestData = request.data;
var responseData = pm.response.json();

pm.test("Name from request equals Name variable", () => {
    pm.expect(responseData.name).to.eql(pm.variables.get("name"))
});
```
4) Проверить что занчение поля age в ответе соответсвует отправленному в запросе значению поля age
```javascript
pm.test("Age from response equals name from request", () => {
    pm.expect(responseData.age).to.eql(requestData.age);
});
```

###### 6) http://162.55.220.72:5005/currency
req.
POST
auth_token

Resp. Передаётся список массив объектов.
```javascript
[
{"Cur_Abbreviation": str,
 "Cur_ID": int,
 "Cur_Name": str
}
…
{"Cur_Abbreviation": str,
 "Cur_ID": int,
 "Cur_Name": str
}
]
```

Тесты:
1) Можете взять любой объект из присланного списка, используйте js random.
В объекте возьмите Cur_ID и передать через окружение в следующий запрос.
```javascript
var responseData = pm.response.json();
var array_length = responseData.length;
var random_array_element = responseData[Math.floor(Math.random() * array_length)];
var random_cur_id = random_array_element.Cur_ID;
// console.log(random_cur_id);

pm.environment.set("curr_code", random_cur_id);
```

###### 7) http://162.55.220.72:5005/curr_byn
req.
POST
auth_token
curr_code: int

Resp.
```javascript
{
    "Cur_Abbreviation": str
    "Cur_ID": int,
    "Cur_Name": str,
    "Cur_OfficialRate": float,
    "Cur_Scale": int,
    "Date": str
}
```

Тесты:
1) Статус код 200
```javascript
pm.test("Status code is 200", () => {
    pm.response.to.have.status(200);
});
```
2) Проверка структуры json в ответе.
```javascript
var schema = {
  "type": "object",
  "properties": {
    "Cur_Abbreviation": {
      "type": "string"
    },
    "Cur_ID": {
      "type": "integer"
    },
    "Cur_Name": {
      "type": "string"
    },
    "Cur_OfficialRate": {
      "type": "number"
    },
    "Cur_Scale": {
      "type": "integer"
    },
    "Date": {
      "type": "string"
    }
  },
  "required": [
    "Cur_Abbreviation",
    "Cur_ID",
    "Cur_Name",
    "Cur_OfficialRate",
    "Cur_Scale",
    "Date"
  ]
};
```
```javascript
pm.test("Validate schema", () => {
    pm.response.to.have.jsonSchema(schema);
});
```
\*\*\*
1) получить список валют
2) итерировать список валют
3) в каждой итерации отправлять запрос на сервер для получения курса каждой валюты
4) если возвращается 500 код, переходим к следующей итреации
5) если получаем 200 код, проверяем response json на наличие поля "Cur_OfficialRate"
6) если поле есть, пишем в консоль инфу про валюту в виде response
```javascript
{
    "Cur_Abbreviation": str
    "Cur_ID": int,
    "Cur_Name": str,
    "Cur_OfficialRate": float,
    "Cur_Scale": int,
    "Date": str
}
```
7) переходим к следующей итерации

Решение:
Запрос на http://162.55.220.72:5005/currency
```javascript
var responseData = pm.response.json();

var cur_id_array = [];

for (var i = 0; i < responseData.length; i++) {
    cur_id_array.push(responseData[i].Cur_ID)
};

for (var i = 0; i < cur_id_array.length; i++) {
    var requestInfo = {
        url: 'http://162.55.220.72:5005/curr_byn',
        method: 'POST',
        header: {
            'Content-Type': 'multipart/form-data',
            'Connection': 'keep-alive',
        },
        body: {
            mode: 'formdata',
            formdata: [
                {key: "auth_token", value: pm.environment.get("auth_token")},
                {key: "curr_code", value: cur_id_array[i]}
            ]
        },
    };
    pm.sendRequest(requestInfo, (error, response) => {
        if (response.code != 200) {
        } else {
            var responseData = response.json();
            // console.log(responseData);
            console.log("Курс " + responseData["Cur_Name"] + ": " + responseData["Cur_OfficialRate"]);
        };
    });
};
```
