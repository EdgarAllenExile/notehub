# Udemy Course

Build the back-end of a .NET 7 web application with a Web API, Entity Framework 7 & SQL Server in no time!

## Service

### Service Response

Notes

- You can create a wrapper around the service object, which lets you attach additional information to return. Such as return codes.
  - Use this by calling a new serviceResponse object, then getting the data and adding it to the service response object with serviceResponse.data = data
- In instances of using such methods
  - You should wrap the return in a try catch block, with the try being the function body and the catch returning any error messages
