path = "Button.zip"
File = working_directory+"NewContent2/"
 var files = zip_unzip(path, File);
      if files > 0
         {
         global.ExtraContent = true;
		 show_message("本地解压成功"+string(File))
         }
show_message(file_exists(File))