*   *   Ruby Version:
        
    
    *   3.4.2
        
    
    *   Rails Version:
        
    
    *   8.0.1
        
    
    *   Postgresql Version:
        
    
    *   14.17
        
    *   Make sure postgresql is running when you start the application
        
    
    *   Configuration and Deployment:
        
    
    *   Live version of the app can be found at:
        
    
    *   [https://strongmind-pizza-restaurant-50abb8b25dc5.herokuapp.com/](https://strongmind-pizza-restaurant-50abb8b25dc5.herokuapp.com/)
        
    
    *   The app defaults to development when running local
        
    
    *   This means you can start the app by running \`rails s\` or \`rails server\`
        
    
    *   Heroku runs the app in production by default
        
    
    *   When interacting with Heroku, use the format:
        
    
    *   \`heroku run <command>\`
        
    
    *   Example usage:
        
    
    *   \`heroku run rails c\`
        
    *   This allows you to interact with the server while the app is running
        
    
    *   Use the command format:
        
    
    *   \`RAILS\_ENV=<environment> rails server\`
        
    
    *   Example usage:
        
    
    *   \`RAILS\_ENV=development rails server\`
        
    
    *   You can also access the console by replacing “server” with “console” in the command line
        
    
    *   How to run the test suite:
        
    
    *   To run all the tests, use the command \`rspec\`
        
    *   To run specific tests, add the location of the test file after \`rspec\` using this format:
        
    
    *   \`rspec <file location>\`
        
    *   For example:
        
    
    *   \`rspec spec/models/pizza\_spec.rb\`
        
    
    My Thought Process
    
    My philosophy when approaching this challenge was to get the simplest possible thing to work, and then build on that. I chose the most up-to-date, stable, versions of ruby, rails, etc, that Heroku uses. I used database tables for toppings and pizzas, and implemented the standard CRUD operations to manage both. Because many pizzas have many toppings, I chose to have a many-to-many table, so that removing a topping would automatically remove it from each of the pizzas that had that as an ingredient. My approach to testing was to make sure that the logic worked in the controllers, as well as on the request side. As such, I have test coverage of the main features.
    
*