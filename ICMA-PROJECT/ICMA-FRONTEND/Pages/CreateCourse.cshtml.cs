using ICMA_LEARNFRONTEND.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using System.Text.Json;
using System.Text;
using System.Net.Http;
using System.Threading.Tasks;
using ICMA_LEARNFRONTEND.DTO;

namespace ICMA_LEARNFRONTEND.Pages
{
    public class CreateCourseModel : PageModel
    {

        public IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;

        public CreateCourseModel(IConfiguration config, IHttpClientFactory httpClientFactory)
        {
            
            _configuration = config;
            _httpClientFactory = httpClientFactory;
        }

        public string Message { get; set; }

        [BindProperty]
        public CreateCourse course { get; set; } = new();



        public void OnGet()
        {
            Message = TempData["Message"] as string;

        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (ModelState.IsValid)
            {
                string baseUrl = _configuration["APIUrl:BaseUrl"];
                var client = _httpClientFactory.CreateClient();

                var jsonContent = JsonSerializer.Serialize(course);
                var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");

                var response = await client.PostAsync(baseUrl+"api/Course/CreateCourse", httpContent);

                if (response.IsSuccessStatusCode)
                {
                    // Redirect or update UI upon success
                    TempData["Message"] = "Course Added Successfully.";
                   // return RedirectToPage("Index");
                    return RedirectToPage("CreateCourse");
                }
                else
                {
                    // Handle error (log, display message, etc.)
                    TempData["Message"] = "Error occured adding courses.";
                    ModelState.AddModelError(string.Empty, "There was an error saving the data.");
                    return Page();
                }
                
            }

                   
            return RedirectToPage("Index");
        }
    }
}

