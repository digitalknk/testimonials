# Testimonials

### Why did I make it?
I wanted to create a simple app that I can easily collect testimonials from my clients. Now I can just send them the link and wait for the testimonials to come in. 

### What did I use?
 - [Sinatra][1] gem
 - [Sinatra-captcha][2] gem
 - [Mongoid][3] gem
 - bson_ext gem
 - [Blueprint CSS Framework][7]

### How do install?
I decided to use [Heroku][5] as it is the easiest and quickest way to deploy an app. Getting it up and running is pretty easy, just follow the steps below.

*Make an account at [Heroku.com][5] first if you don't have an account. If this is your first time using Heroku then make sure you have installed the Heroku gem and setup your Heroku account correctly. You can see how at this link [Getting Started with Heroku][6].*

    git clone git://github.com/digitalknk/testimonials.git
    cd testimonials
    bundle
    heroku apps:create -s cedar
    heroku addons:add mongolab:small
    git push heroku master
    heroku open

**NOTE:** You don't have to use the app with the cedar stack but this has become a habit for me.

### TODO
Right now you can only submit testimonials. I will have it so you can **see the testimonials in HTML** and **JSON**. Most likely be my next commit :-)

### Support
If you have any problems or questions just contact me and I would be more then happy to help you out.

  [1]: http://www.sinatrarb.com/
  [2]: https://github.com/bmizerany/sinatra-captcha
  [3]: https://github.com/mongoid/mongoid
  [4]: http://blueprintcss.org
  [5]: http://www.heroku.com
  [6]: http://devcenter.heroku.com/articles/quickstart
  [7]: http://blueprintcss.org