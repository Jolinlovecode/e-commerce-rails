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

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Screenshots
***Home page
![home page](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/home-page.png?raw=true)
***Categories electronics
![categories-electronics](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/categories-electronics.png?raw=true)
***Product details
![product details](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/product-details.png?raw=true)
***Signup New User 
![new user](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/signup-new%20user.png?raw=true)
***Login page
![login](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/login%20form.png?raw=true)
***User Authentication
![User Authentication](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/User%20Authentication.png?raw=true)
***Admin-categories page
![Admin-categories page](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/admin-categories%20page.png?raw=true)
***Admin-products page
![admin-products page](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/admin-products%20page.png?raw=true)
***Cart page
![cart](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/cart-page.png?raw=true)
***Card page
![card](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/card%20info%20form.png?raw=true)
***Order page
![order](https://github.com/Jolinlovecode/e-commerce-rails/blob/master/Image/order%20page.png?raw=true)
