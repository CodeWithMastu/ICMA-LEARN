# ICMA-LEARN

## Overview
The **ICMA-Project** is a web application designed to facilitate course management on the ICMA-LEARN platform. This project includes:
- A **backend API** developed with .NET and Dapper.
- A **frontend** built with Razor Pages.

## Folder Structure
- **DataUpload**: Contains `CourseUpload.xlsx`, which includes sample data to upload when running the application.
- **ICMA_FRONTEND**: The frontend application, built with Razor Pages.
- **ICMA_LEARN**: The backend API was developed in .NET using Dapper as the ORM.
- **SQL**: Contains scripts for setting up and populating the database.

## Setup Instructions

### Prerequisites
- .NET SDK
- SQL Server
- Visual Studio (optional, for convenient setup and debugging)

### Database Setup
1. Navigate to the **SQL** folder.
2. Run the following scripts in SQL Server Management Studio (SSMS) or another compatible SQL tool:
   - **`ICMAdatascript.sql`**: Creates the database, tables, and stored procedures required for the project.
   - **`ICMAdbscript.sql`**: Populates the tables with initial sample data.

### Running the Application
1. Open **ICMA-PROJECT.sln** in Visual Studio.
2. Set up **Multiple Startup Projects**:
   - Right-click the solution and select **Properties**.
   - Under **Startup Project**, choose **Multiple startup projects** and set the **Action** for both `ICMA_FRONTEND` and `ICMA_LEARN` to **Start**.
3. Press **F5** or select **Start Debugging** to launch both projects simultaneously.

## Usage
The application uses the sample data provided in `CourseUpload.xlsx` to demonstrate course upload functionality for the Bulk Course Upload. 

## Demo

Here’s a quick demo of the project functionality for the single course creation:


![Singleupload - Made with Clipchamp](https://github.com/user-attachments/assets/652671da-53fb-45ed-84bb-ebb5965e9ff0)

