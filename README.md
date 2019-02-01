# FaireBnb

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
