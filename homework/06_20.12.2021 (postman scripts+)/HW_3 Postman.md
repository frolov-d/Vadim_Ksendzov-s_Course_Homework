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
```json
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
```json
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

Тесты:
1) Можете взять любой объект из присланного списка, используйте js random.
В объекте возьмите Cur_ID и передать через окружение в следующий запрос.

 ===================

7) http://162.55.220.72:5005/curr_byn
req.
POST
auth_token
curr_code: int

Resp.
{
    "Cur_Abbreviation": str
    "Cur_ID": int,
    "Cur_Name": str,
    "Cur_OfficialRate": float,
    "Cur_Scale": int,
    "Date": str
}

Тесты:
1) Статус код 200
2) Проверка структуры json в ответе.


===============
***
1) получить список валют
2) итерировать список валют
3) в каждой итерации отправлять запрос на сервер для получения курса каждой валюты
4) если возвращается 500 код, переходим к следующей итреации
5) если получаем 200 код, проверяем response json на наличие поля "Cur_OfficialRate"
6) если поле есть, пишем в консоль инфу про фалюту в виде response
{
    "Cur_Abbreviation": str
    "Cur_ID": int,
    "Cur_Name": str,
    "Cur_OfficialRate": float,
    "Cur_Scale": int,
    "Date": str
}
7) переходим к следующей итерации