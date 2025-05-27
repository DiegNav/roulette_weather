# Ruleta Clima - Rails Project

This is a Ruby on Rails application for a weather-based roulette game.

## Requirements
- Ruby 3.x (recommended: 3.2+)
- Rails 7.x
- PostgreSQL
- Node.js & Yarn (for assets)
- Unix-based OS (Linux, macOS, WSL)

## Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone <your-repo-url>
   cd ruleta_clima
   ```

2. **Install dependencies:**
   ```bash
   bundle install
   yarn install --check-files
   ```

3. **Configure the database:**
   - Edit `config/database.yml` if needed for your PostgreSQL setup.

4. **Create and migrate the database:**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed # (Optional) if you have seeds
   ```

5. **Run the development server:**
   ```bash
   rails server
   ```
   The app will be available at [http://localhost:3000](http://localhost:3000)

6. **Run the test suite:**
   ```bash
   rails db:migrate RAILS_ENV=test
   bundle exec rails test
   ```

## Services
- Weather data is fetched via `ClimaService` (see `app/services/clima_service.rb`).
- Background jobs use ActiveJob (see `app/jobs/`).

## Additional Notes
- For asset compilation, Tailwind CSS is used (see `tailwind.config.js`).
- If using Docker, see `Dockerfile` and `Procfile` for deployment options.

## Troubleshooting
- Ensure PostgreSQL is running and accessible.
- If you encounter missing gems or node modules, re-run `bundle install` and `yarn install`.
- For any migration issues, try `rails db:reset` (this will erase all data).

---
For more details, see the code comments and each directory's README or documentation files if present.
