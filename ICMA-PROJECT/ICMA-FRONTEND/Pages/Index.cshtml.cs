using ICMA_LEARNFRONTEND.DTO;
using ICMA_LEARNFRONTEND.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace ICMA_LEARNFRONTEND.Pages
{
	public class IndexModel : PageModel
	{
        public IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;


        // public IEnumerable<Course> CourseList;
        private readonly ILogger<IndexModel> _logger;


        public IndexModel(IConfiguration config, IHttpClientFactory httpClientFactory, ILogger<IndexModel> logger)
        {

            _configuration = config;
            _httpClientFactory = httpClientFactory;
            _logger = logger;
        }

        public string Message { get; set; }

        public List<ListCourse> CourseList { get; set; } = new List<ListCourse>();

        public async Task OnGetAsync()
        {
            string baseUrl = _configuration["APIUrl:BaseUrl"];

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new System.Uri(baseUrl);

            HttpResponseMessage response = await client.GetAsync("api/Course/GetAllCourses");

            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                CourseList = JsonSerializer.Deserialize<List<ListCourse>>(jsonResponse, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            }
            else
            {
                // Handle error
                ModelState.AddModelError(string.Empty, "Error retrieving courses.");
            }
        }
    }
}
