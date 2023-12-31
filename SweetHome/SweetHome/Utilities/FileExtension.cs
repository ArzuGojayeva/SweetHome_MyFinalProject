﻿namespace SweetHome.Utilities
{
    public static class FileExtension
    {
        public static bool CheckFileType(this IFormFile file, string type)
        {
            return file.ContentType.Contains(type);
        }
        public static bool CheckFileSize(this IFormFile file, int size)
        {
            return file.Length / 1024 < size;
        }
        public static async Task<string> SaveFileAsync(this IFormFile file, string root, string folder)
        {
            string uniquefile = Guid.NewGuid().ToString() + "_" + file.FileName;
            string path = Path.Combine(root, folder, uniquefile);
            using (FileStream stream = new FileStream(path, FileMode.Create))
            {
                await file.CopyToAsync(stream);
            }
            return uniquefile;
        }
        public static void DeleteFile(this IFormFile file, string root,string folder ,string fileName)
        {
            string path = Path.Combine(root, folder, fileName);
            if (System.IO.File.Exists(path))
            {
                System.IO.File.Delete(path);
            }

        }
    }
}
