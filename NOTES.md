# Notes 

* using dotenv for environment variables (production safety)
* using slim for templates (cleaner than erb)
* using rspec for testing (i'm more familiar with it than minitest)

## Models

I created an `Uploads` model for file uploads.  
`Image` and `Document` inherit upload so that custom methods can be added to each.

I realise that the requirements only call for images but I thought this would be a good way to show some future proofing in the initial design.

I added a `filename` and `file_type` fields to `uploads`. This is a bit redundant for this project, as this can be inferred from ActiveStorage, but would
help to improve performance at scale.



