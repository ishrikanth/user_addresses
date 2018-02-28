
## Problem Statement

Create a Rails application with enough test coverage (RSpec)  that
1. Stores the users and their addresses
2. Provides a REST API to manage them (No HTML viwes, only JSON output)

### The User Entity
The user has the following properties
1. First Name (mandatory to have)
2. Middle Name (optional)
3. Last Name (optional)
4. Age
5. The user can have multiple addresss, with each address has the properties
	- Name (mandatory) – (Shipping, Billing, Home, Office, etc)
	- Line 1 (mandatory)
	- Line 2
	- City (mandatory)
	- State (mandatory)
	- Country (mandatory)
	- Zip (mandatory)

The Full Name of the user is

	First Name + " " + Middle Name + " " + Last Name

Please note that Middle Name and Last Name can be blank. So, make sure you don't have extra spaces in Full Name.

### RESTful API to Manage Users
* One should be able to `GET`, `POST`, `PATCH` and `DELETE` users.
* Both request and response body should be JSON.
* If there is an error, return with an appropriate HTTP status code with enough information in JSON format.
* For a successful transaction, respond back with the appropriate HTTP status code and JSON body.

#### User Object
```json
{
   "id": 123,
   "full_name":"John Michael Doe",
   "age":45,
   "addresses":[
      {
         "shipping":{
            "line1":"Apt #14, Suite #22",
            "line2":"ABC Street, BCDTown",
            "city":"XYCity",
            "state":"Foo",
            "country":"Bar",
            "zip":"0102"
         }
      }
   ]
}
```

#### List Users

* `GET /users` – List users in the alphabetical order of
* `GET /users/children` – List all users between 0-8 years of age
* `GET /uses/adolescenents` – List all users between 9-18 years
* `GET /users/adult`s – List all users above 18 years

#### Retrieve a single user
* `GET /users/:id` – Get the details of a user

#### Create User

* `POST /users`
	Sample request body is given below:
	```json
	{
	   "first_name":"John Doe",
	   "middle_name": "Michael",
	   "last_name": "Doe",
	   "age":45,
	   "addresses":[
	      {
	         "shipping":{
	            "line1":"Apt #14, Suite #22",
	            "line2":"ABC Street, BCDTown",
	            "city":"XYCity",
	            "state":"Foo",
	            "country":"Bar",
	            "zip":"0102"
	         }
	      }
	   ]
	}
	```
	* The post body must be of type – application/json, otherwise error with appropriate status code
	* If `first_name` is not present, error with appropriate status code
	* `addresses` if present – must be passed as an array of objects (even if the user has only one). All mandatory fields of an address object must be present, otherwise error with appropriate status code.
	* Age must be a number, if not error wit appropriate status code.
	* Upon successful creation, respond with appropriate status code.

#### Update User

 - PATCH /users/:id
	* Allow all or a subset of the properties to be updated.
	* All validation rules for `POST /user` should be applied here.
	* Mandatory fields can't be nullified.
	* Upon updating an address, check if an address with the same name already exists, if so update the address otherwise, create.

#### Delete a User
- `DELETE /users/:id` – Should delete all the information of a user including address.

### Test Cases

 - Please use RSpec for testing
 - Your RSpec suite when run should give you the basic documentation of the system
 - Please include unit (model, service, etc.) & functional (controller) test cases

### Code Quality
 - Follow the basic styleguide rules of Ruby (may use tools like Rubocop)
 - Consider the best and optimized ways to achieve the desired behaviour of the system.

### Basic Documentation
- Provide basic documentation on how the system needs to be setup and run, including test cases.
### Suggest Improvements
- Suggest improvements for
	- The overall design of the system
	- Your implementation

## Solution

### Create User

 `curl -X POST \
  http://localhost:3000/users.json \
  -H 'content-type: application/json' \
  -d '{
    "first_name":"John Doe",
    "middle_name": "Michael",
    "last_name": "Doe",
    "age":"45",
    "addresses":[
       {
          "shipping":{
             "line1":"Apt #14, Suite #22",
             "line2":"ABC Street, BCDTown",
             "city":"XYCity",
             "state":"Foo",
             "country":"Bar",
             "zip":"0102"
          }
       }
    ]
 }'`

### List User

`curl -X GET http://localhost:3000/users/adults.json`

### List adolescenents

`curl -X GET http://localhost:3000/users/adolescenents.json`

#### List adults

`curl -x GET http://localhost:3000/users/adults.json`

### List childrens

`curl -X GET http://localhost:3000/users/childrens.json`

### Update Users

`curl -X PUT \
  http://localhost:3000/users/1.json \
  -H 'content-type: application/json' \
  -d '{
    "first_name":"John Doe",
    "middle_name": "Michael",
    "last_name": "Doe",
    "age":"45",
    "addresses":[
       {
          "shipping":{
             "line1":"Apt #14, Suite #22",
             "line2":"ABC Street, BCDTown",
             "city":"XYCity",
             "state":"Foo",
             "country":"Bar",
             "zip":"0102"
          }
       }
    ]
 }'`

### Delete User

 `curl -X DELETE \
   http://localhost:3000/users/1.json \
   -H 'content-type: application/json'`

### Improvements
* More test cases can be added
* JSON schema validation can be added so that any new changes to the schema will not break existing things.
* Some of the logic in the controllers can be moved to service layer or Model
