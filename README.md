# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## Additional Steps for Apple M1 Machines

1. Make sure that you are runnning Ruby 2.6.6 (`ruby -v`)
1. Install ImageMagick `brew install imagemagick imagemagick@6 --build-from-source`
2. Remove Gemfile.lock
3. Replace Gemfile with version provided [here](https://gist.githubusercontent.com/FrancisBourgouin/831795ae12c4704687a0c2496d91a727/raw/ce8e2104f725f43e56650d404169c7b11c33a5c5/Gemfile)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Admin password
Admin username: "Jungle"
Admin password: "book"

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## ScreenShots

Sold out badge

<img width="1440" alt="Screen Shot 2022-04-13 at 9 24 45 PM" src="https://user-images.githubusercontent.com/97773707/163296071-1d44a881-a70d-41c6-8261-bf2aa244cf53.png">


Admin product pages

<img width="1440" alt="Screen Shot 2022-04-13 at 9 26 56 PM" src="https://user-images.githubusercontent.com/97773707/163296158-45343b0d-5dfd-49ab-b313-2edfc59fb52d.png">


Admin add categories

<img width="1440" alt="Screen Shot 2022-04-13 at 9 27 21 PM" src="https://user-images.githubusercontent.com/97773707/163296177-d6963298-b2f0-407a-98c5-ec9935627408.png">


Shopping cart

<img width="1440" alt="Screen Shot 2022-04-13 at 9 25 30 PM" src="https://user-images.githubusercontent.com/97773707/163296218-42c96bce-2b7e-4fc5-95b5-76ba26a9dfb9.png">


