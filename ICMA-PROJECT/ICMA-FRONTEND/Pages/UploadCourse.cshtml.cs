using ICMA_LEARNFRONTEND.DTO;
using ICMA_LEARNFRONTEND.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using OfficeOpenXml;
using System.Text.Json;
using System.Text;

namespace ICMA_LEARNFRONTEND.Pages
{
    public class UploadCourseModel : PageModel
    {

        public IConfiguration _configuration;
        private readonly IHttpClientFactory _httpClientFactory;

        public UploadCourseModel(IConfiguration config, IHttpClientFactory httpClientFactory)
        {

            _configuration = config;
            _httpClientFactory = httpClientFactory;
        }

        public string Message { get; set; }

        [BindProperty]
        public CreateCourse course { get; set; } = new();


        [BindProperty]
        public IFormFile ExcelFile { get; set; }

        public List<CourseUploadData> ExcelDataList { get; set; } = new();

        public void OnGet()
        {
            Message = TempData["Message"] as string;

        }



        public async Task<IActionResult> OnPostAsync()
        {

            if (ExcelFile == null || ExcelFile.Length == 0)
            {
                ModelState.AddModelError(string.Empty, "Please upload a valid Excel file.");
                return Page();
            }

            ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // Set the license context

            using (var stream = new MemoryStream())
            {
                await ExcelFile.CopyToAsync(stream);
                using (var package = new ExcelPackage(stream))
                {
                    var worksheet = package.Workbook.Worksheets[0]; // Assuming data is in the first worksheet
                    var rowCount = worksheet.Dimension.Rows;

                    for (int row = 2; row <= rowCount; row++) // Assuming row 1 is the header
                    {
                        var data = new CourseUploadData
                        {
                            Title = worksheet.Cells[row, 1].Text,
                            Description = worksheet.Cells[row, 2].Text,
                            Category = worksheet.Cells[row, 3].Text
                        };

                        ExcelDataList.Add(data);
                    }
                }
            }


            // Post each ExcelData entry to the API
            string baseUrl = _configuration["APIUrl:BaseUrl"];

            var client = _httpClientFactory.CreateClient();
            client.BaseAddress = new System.Uri(baseUrl);

            foreach (var data in ExcelDataList)
            {
                var jsonContent = JsonSerializer.Serialize(data);
                var httpContent = new StringContent(jsonContent, Encoding.UTF8, "application/json");

                var response = await client.PostAsync("api/Course/CreateCourse", httpContent);

                if (!response.IsSuccessStatusCode)
                {
                    // Handle error (log, throw exception, add error message)
                    ModelState.AddModelError(string.Empty, $"Error saving record: {data.Title}");
                    return Page();
                }
            }

            // Optionally, redirect or show a success message
            TempData["Message"] = "Course Saved Successfully";
            //return RedirectToPage("UploadCourse");
            return Page(); // Return the page to display the data







        }
            
        }
    }

