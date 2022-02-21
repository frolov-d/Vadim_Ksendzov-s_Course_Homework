# Jmeter_2 HW

#### 1) http://162.55.220.72:5005/user_info

`req. (RAW JSON)
POST
age: int
salary: int
name: str
auth_token`

    resp.
    {'start_qa_salary':salary,
     'qa_salary_after_6_months': salary * 2,
     'qa_salary_after_12_months': salary * 2.9,
     'person': {'u_name':[user_name, salary, age],
                                    'u_age':age,
                                    'u_salary_1.5_year': salary * 4}
                                    }

Достать из Response значение из поля 'qa_salary_after_6_months' и передать в поле salary запроса http://162.55.220.72:5005/new_data
HTTP Header Manager со значением `Content-type: application/json`

#### 2) http://162.55.220.72:5005/new_data
`req.
POST
age: int
salary: int
name: str
auth_token`

        Resp.
        {'name':name,
          'age': int(age),
          'salary': [salary, str(salary*2), str(salary*3)]}

Достать из Response значение из поля 'name' и передать в поле name запроса http://162.55.220.72:5005/test_pet_info

#### 3) http://162.55.220.72:5005/test_pet_info
`req.
POST
age: int
weight: int
name: str
auth_token`


    Resp.
    {'name': name,
     'age': age,
     'daily_food':weight * 0.012,
     'daily_sleep': weight * 2.5}

Достать из Response значение из поля age и передать в поле age запроса http://162.55.220.72:5005/get_test_user

Задание c \*\*\*
- Изучать как работают Response Assertion.
- Сделать Assertion на проверку статус код 200
- Сделать Assertion на проверку 'daily_food':weight * 0.012

#### 4) http://162.55.220.72:5005/get_test_user
`req.
POST
age: int
salary: int
name: str
auth_token`

    Resp.
    {'name': name,
     'age':age,
     'salary': salary,
     'family':{'children':[['Alex', 24],['Kate', 12]],
     'u_salary_1.5_year': salary * 4}
      }

Тесты:
Задание \*\*\*
- Изучать как работают Response Assertion.
- Сделать Assertion на провекрку статус код 200
- Сделать Assertion на провекрку 'salary': salary

##### [Ссылка на тест-план](./hw2.jmx)