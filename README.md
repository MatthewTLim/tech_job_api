# Tech Job API

## Description

The Tech Job API is a Ruby on Rails application designed to provide job listings from various sources. The API allows users to query job data, including details about positions, companies, and job types.

## Prerequisites

Before setting up the project locally, ensure you have the following installed:

- Ruby (version 3.0 or later)
- Rails (version 7.0 or later)
- PostgreSQL (for the database)
- Bundler (for managing Ruby gems)

## Setup

1. **Clone the Repository**

   ```bash
   git clone https://github.com/MatthewTLim/tech_job_api.git
   cd tech_job_api
   ```

2. **Install Dependencies**

   Install the required gems using Bundler:

   ```bash
   bundle install
   ```

3. **Database Setup**

   Set up the database by running the following commands:

   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

   This will create the database, run migrations, and seed it with initial data.

4. **Configuration**

   Ensure any configuration settings for the API are correctly set up in the environment files or the Rails configuration files.

## Running the API

To start the Rails server, use the following command:

```bash
rails server
```

The API will be accessible at `http://localhost:3000`.

## Endpoints

The API provides several endpoints for querying job listings:

- **GET /jobs**: Retrieves a list of job postings.
- **GET /jobs/:id**: Retrieves details for a specific job posting.
- **POST /jobs**: Creates a new job posting (authentication required).
- **PUT /jobs/:id**: Updates an existing job posting (authentication required).
- **DELETE /jobs/:id**: Deletes a job posting (authentication required).

## JSON Contract

The API responses adhere to the following JSON contract:

### GET /jobs

**Response:**

```json
[
  {
    "id": 1,
    "title": "Software Engineer",
    "company": "Tech Corp",
    "location": "Remote",
    "description": "A great job at Tech Corp."
  },
  {
    "id": 2,
    "title": "Data Scientist",
    "company": "Data Inc.",
    "location": "New York, NY",
    "description": "Work with data to make decisions."
  }
]
```

### GET /jobs/:id

**Response:**

```json
{
  "id": 1,
  "title": "Software Engineer",
  "company": "Tech Corp",
  "location": "Remote",
  "description": "A great job at Tech Corp."
}
```

### POST /jobs

**Request Body:**

```json
{
  "title": "Senior Software Engineer",
  "company": "Tech Corp",
  "location": "Remote",
  "description": "An exciting opportunity for a senior role."
}
```

**Response:**

```json
{
  "id": 3,
  "title": "Senior Software Engineer",
  "company": "Tech Corp",
  "location": "Remote",
  "description": "An exciting opportunity for a senior role."
}
```

### PUT /jobs/:id

**Request Body:**

```json
{
  "title": "Lead Software Engineer",
  "company": "Tech Corp",
  "location": "Remote",
  "description": "A leadership role at Tech Corp."
}
```

**Response:**

```json
{
  "id": 1,
  "title": "Lead Software Engineer",
  "company": "Tech Corp",
  "location": "Remote",
  "description": "A leadership role at Tech Corp."
}
```

### DELETE /jobs/:id

**Response:**

```json
{
  "message": "Job posting deleted successfully."
}
```

## Gem Details

- **`rails`**: The core framework for building web applications with Ruby. It handles routing, database interactions, and API responses.
  
- **`pg`**: The PostgreSQL adapter for Ruby on Rails, used to interact with the PostgreSQL database.

- **`dotenv-rails`**: Loads environment variables from a `.env` file, useful for managing configuration settings and sensitive information.

- **`rspec-rails`**: Provides a framework for writing and running tests in Rails applications. It is used to ensure the functionality of the API endpoints.

- **`faker`**: Generates fake data for seeding the database. It helps populate the API with sample job postings.

## API Usage

### Example Requests

- **Retrieve All Jobs**

   To retrieve all job listings, send a GET request to `http://localhost:3000/jobs`.

- **Retrieve a Specific Job**

   To retrieve details for a specific job posting, send a GET request to `http://localhost:3000/jobs/:id`, replacing `:id` with the job ID.

- **Create a New Job**

   To create a new job posting, send a POST request to `http://localhost:3000/jobs` with the job data in the request body.

- **Update a Job**

   To update an existing job posting, send a PUT request to `http://localhost:3000/jobs/:id` with the updated job data in the request body.

- **Delete a Job**

   To delete a job posting, send a DELETE request to `http://localhost:3000/jobs/:id`.

## Troubleshooting

- **Dependencies Issues**: Ensure all gems are installed correctly. If you encounter errors, try running `bundle install` again or check for version compatibility issues.

- **Database Issues**: Ensure PostgreSQL is running and the database configuration is correct. If you encounter issues, verify the `DATABASE_URL` in your `.env` file and check PostgreSQL logs.

- **API Errors**: Check the Rails server logs for detailed error messages. Ensure that the API endpoints are correctly defined and that any required parameters are provided in requests.

## Contributing

If you want to contribute to the project, please fork the repository and submit a pull request with your changes. Ensure that you adhere to the coding standards and include tests for any new functionality.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

---
