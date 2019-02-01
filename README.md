# FaireBnb

---

Hello, welcome to the Airbnb app with only the models ! This is an exercice where you will learn how to make robust models. 

## Database
There should be four models :

- `User`
- `City`
- `Listing`
- `Reservation`

## Tests
Stack for tests include :

- Rspec
- Factory_bot
- nyan-cat-formatter
- shoulda_matchers

To run the tests : `$ rspec`

---

## Cogitations

### User

- email
- phone
- description

can have many : flats, bookings

### Flat

- beds
- price
- descrition
- wifi (bool)

belongs to : user, city

### Booking

- start_date
- length

belongs to : user, flat

### City

has many : flats

## Model

- flat can only be booked by one user at a time (disponibilité)
- user cannot book his own flat?
