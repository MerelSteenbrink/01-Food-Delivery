# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb

require_relative 'app/models/meal'    # You need to create this file!
require_relative 'app/controllers/meals_controller'  # You need to create this file!
require_relative "app/repositories/meals_repository"
require_relative 'router'

meals_csv = "data/meals.csv"
meals_repository = MealsRepository.new(meals_csv)
meals_controller = MealsController.new(meals_repository)

router = Router.new(meals_controller)

# Start the app
router.run

