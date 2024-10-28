using Dapper;
using ICMA_LEARN.DTOs;
using ICMA_LEARN.Models;
using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace ICMA_LEARN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CourseController: ControllerBase
    {

        private readonly IDbConnection _dbConnection;

        public CourseController(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        [HttpPost("CreateCourse")]
        public async Task<IActionResult> CreateCourse(CourseDTO coursedto)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Status", 1);
            parameters.Add("@title", coursedto.Title);
            parameters.Add("@description", coursedto.Description);
            parameters.Add("@category", coursedto.category);
            parameters.Add("@created_at", DateTime.Now);

            await _dbConnection.ExecuteAsync("Sp_Course", parameters,
                commandType: CommandType.StoredProcedure);
            return Ok("Course created successfully");
        }


        // GET: api/Course Get All Books

        [HttpGet("GetAllCourses")]
        public async Task<IActionResult> GetAllCoursess()
        {
            List<Course> courses = new List<Course>();

            var parameter = new DynamicParameters();
            parameter.Add("@Status", 5);

            var results = await _dbConnection.QueryAsync<Course>("Sp_Course", parameter,
                commandType: CommandType.StoredProcedure);
            courses = results.ToList();

            return Ok(courses);
        }

        [HttpGet("GetCoursebyID")]
        public async Task<IActionResult> GetCoursebyID([FromQuery] long courseId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Status", 7);
            parameters.Add("@course_id", courseId);

            // Execute the stored procedure
            var course = await _dbConnection.QueryFirstOrDefaultAsync<CourseDTO>(
                "Sp_Course",
                parameters,
                commandType: CommandType.StoredProcedure);
           
            if (course == null)
            { return NotFound(); }

            return Ok(course);
        }

        [HttpPut("UpdateCourse")]
        public async Task<IActionResult> UpdateCourse(long courseId, CourseDTO course)
        {
            // Check if the course exists before updating

            var parameter = new DynamicParameters();
            parameter.Add("@Status", 7);
            parameter.Add("@course_id", courseId);

            var existingCourse = await _dbConnection.QueryFirstOrDefaultAsync<CourseDTO>(
                "Sp_Course", parameter,commandType: CommandType.StoredProcedure);

            if (existingCourse == null)
            {
                return NotFound($"No course found with ID = {courseId}");
            }
            var parameters = new DynamicParameters();
            parameters.Add("@Status", 2);
            parameters.Add("@course_id", courseId);
            parameters.Add("@title", course.Title);
            parameters.Add("@description", course.Description);
            parameters.Add("@category", course.category);

            await _dbConnection.ExecuteAsync("Sp_Course", parameters,
                commandType: CommandType.StoredProcedure);

            return Ok("Course updated successfully");
        }

        [HttpDelete("DeleteCourse")]
        public async Task<IActionResult> DeleteCourse(long courseId)
        {
            // Check if the course exists before deleting
            var par = new DynamicParameters();
            par.Add("@Status", 7);
            par.Add("@course_id", courseId);
            var existingCourse = await _dbConnection.QueryFirstOrDefaultAsync<Course>(
                "Sp_Course",par,commandType: CommandType.StoredProcedure);

            if (existingCourse == null)
            {
                return NotFound($"No course found with ID = {courseId}");
            }
            var parameter = new DynamicParameters();
            parameter.Add("@Status", 3);
            parameter.Add("@course_id", courseId);

            await _dbConnection.ExecuteAsync("Sp_Course", parameter,
                commandType: CommandType.StoredProcedure);
            return Ok("Course deleted successfully");
        }

        [HttpGet("Leaderboard")]
        public async Task<IActionResult> GetLeaderboard()
        {
            List<Attempt> attempt = new List<Attempt>();

            var results = await _dbConnection.QueryAsync<Attempt>("Sp_GetLeaderboard", 
                commandType: CommandType.StoredProcedure);
            attempt = results.ToList();
            return Ok(attempt);

        }
    }
}
