using System.ComponentModel.DataAnnotations;

namespace ICMA_LEARNFRONTEND.DTO
{
    public class CreateCourse
    {
        public int course_id { get; set; }

        [Display(Name = "Title")]
        [Required(ErrorMessage = "Course Title is required")]
        [StringLength(maximumLength: 100, MinimumLength = 6)]
        public string? Title { get; set; }

        [Display(Name = "Description")]
        [Required(ErrorMessage = "Description is required")]
        [MaxLength(50)]
        [MinLength(15)]
        public string? Description { get; set; }

        [Display(Name = "Category")]
        [Required(ErrorMessage = "Course Category is required")]
        [StringLength(maximumLength: 50, MinimumLength = 3)]
        public string? category { get; set; }

    }
}
