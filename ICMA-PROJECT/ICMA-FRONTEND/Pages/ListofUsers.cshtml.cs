using ICMA_LEARNFRONTEND.DTO;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;

namespace ICMA_LEARNFRONTEND.Pages
{
    public class ListofUsersModel : PageModel
    {
        public IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;


        // public IEnumerable<Course> CourseList;
        private readonly ILogger<IndexModel> _logger;


        public ListofUsersModel(IConfiguration config, IHttpClientFactory httpClientFactory, ILogger<IndexModel> logger)
        {

            _configuration = config;
            _httpClientFactory = httpClientFactory;
            _logger = logger;
        }

        public string Message { get; set; }


        public List<Attempt> TopscorerList { get; set; } = new List<Attempt>();

        public async Task OnGetAsync()
        {
            string baseUrl = _configuration["APIUrl:BaseUrl"];

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new System.Uri(baseUrl);

            HttpResponseMessage response = await client.GetAsync("api/Course/Leaderboard");

            if (response.IsSuccessStatusCode)
            {
                var jsonResponse = await response.Content.ReadAsStringAsync();
                TopscorerList = JsonSerializer.Deserialize<List<Attempt>>(jsonResponse, new JsonSerializerOptions { PropertyNameCaseInsensitive = true });
            }
            else
            {
                // Handle error
                ModelState.AddModelError(string.Empty, "Error retrieving courses.");
            }
        }
    }
}

