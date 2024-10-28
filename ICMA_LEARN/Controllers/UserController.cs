using Dapper;
using ICMA_LEARN.DTOs;
using ICMA_LEARN.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Data;
using System.Data.Common;

namespace ICMA_LEARN.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController: ControllerBase
    {
        private readonly IDbConnection _dbConnection;

        public UserController(IDbConnection dbConnection)
        {
            _dbConnection = dbConnection;
        }

        // Create the user
        [HttpPost("CreateUser")]
        public async Task<IActionResult> CreateUser(UserDTO user)
        {
            var par = new DynamicParameters();
            par.Add("@Status", 1);
            par.Add("@first_name", user.first_name);
            par.Add("@last_name", user.last_name);
            par.Add("@email", user.Email);
            par.Add("@password_hash", user.password_hash);
            par.Add("@role", user.Role);
            par.Add("@bio", user.Bio);

            await _dbConnection.ExecuteAsync("Sp_Users", par, 
                commandType: CommandType.StoredProcedure);
            return Ok("User created successfully");
        }

        // Get All Users
        [HttpGet("GetAllUsers")]
        public async Task<IActionResult> GetAllUsers()
        {
            List<User> users = new List<User>();
            var parameter = new DynamicParameters();
            parameter.Add("@Status", 5);

            var results = await _dbConnection.QueryAsync<User>("Sp_Users", parameter,
                commandType: CommandType.StoredProcedure);
            users = results.ToList();

            return Ok(users);
        }

        // Get Users by ID
        [HttpGet("GetUserbyID")]
        public async Task<IActionResult> GetUserbyID([FromQuery] long userId)
        {
            var parameter = new DynamicParameters();
            parameter.Add("@user_id", userId);
            parameter.Add("@Status", 6);

            var user = await _dbConnection.QueryFirstOrDefaultAsync<UserDTO>("Sp_Users",
                parameter, commandType: CommandType.StoredProcedure);
            if (user == null)
            { return NotFound(); }

            return Ok(user);

        }
        // Get Users by Email
        [HttpGet("GetUserbyEmail")]
        public async Task<IActionResult> GetUserbyEmail([FromQuery] string email)
        {
            var parameter = new DynamicParameters();
            parameter.Add("@email", email);
            parameter.Add("@Status", 8);

            var user = await _dbConnection.QueryFirstOrDefaultAsync<UserDTO>("Sp_Users",
                parameter, commandType: CommandType.StoredProcedure);
            if (user == null)
            { return NotFound(); }

            return Ok(user);
        }

        // Update the user details
        [HttpPut("UpdateUser")]
        public async Task<IActionResult> UpdateUser(long userId, UserDTO userDTO)
        {
            // Check if the course exists before updating

            var parameter = new DynamicParameters();
            parameter.Add("@Status", 6);
            parameter.Add("@user_id", userId);

            var existingUser = await _dbConnection.QueryFirstOrDefaultAsync<UserDTO>(
                "Sp_Users", parameter, commandType: CommandType.StoredProcedure);

            if (existingUser == null)
            {
                return NotFound($"No user found with ID = {userId}");
            }
            var parameters = new DynamicParameters();
            parameters.Add("@Status", 2);
            parameters.Add("@user_id", userId);
            parameters.Add("@first_name", userDTO.first_name);
            parameters.Add("@last_name", userDTO.last_name);
            parameters.Add("@email", userDTO.Email);
            parameters.Add("@password_hash", userDTO.password_hash);
            parameters.Add("@bio", userDTO.Bio);
            parameters.Add("@role", userDTO.Role);

            await _dbConnection.ExecuteAsync("Sp_Users", parameters,
                commandType: CommandType.StoredProcedure);

            return Ok("User updated successfully");
        }

        // Delete the user
        [HttpDelete("DeleteUser")]
        public async Task<IActionResult> DeleteUser(long userId)
        {
            // Check if the course exists before deleting
            var par = new DynamicParameters();
            par.Add("@Status", 6);
            par.Add("@user_id", userId);
            var existingUser = await _dbConnection.QueryFirstOrDefaultAsync<UserDTO>(
                "Sp_Users", par, commandType: CommandType.StoredProcedure);

            if (existingUser == null)
            {
                return NotFound($"No user found with ID = {userId}");
            }
            var parameter = new DynamicParameters();
            parameter.Add("@Status", 3);
            parameter.Add("@user_id", userId);
            await _dbConnection.ExecuteAsync("Sp_Users", parameter,
                commandType: CommandType.StoredProcedure);
            return Ok("User deleted successfully");
        }
    }
}
