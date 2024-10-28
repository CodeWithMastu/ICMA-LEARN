namespace ICMA_LEARNFRONTEND.DTO
{
    public class TopScorerDTO
    {
        public int UserId { get; set; }
        public string? UserName { get; set; }
        public int CourseId { get; set; }
        public string? CourseName { get; set; }
        public int CategoryId { get; set; }
        public string? CategoryName { get; set; }
        public int HighestScore { get; set; }
    }
}
