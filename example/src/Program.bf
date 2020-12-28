using System;
using NativeFileDialog;

namespace example
{
	class Program
	{
		public static int Main()
		{
			// OpenDialog test
			{
				Console.WriteLine("OpenDialog test!");
				char8 *outPath = null;
				var result = NativeFileDialog.OpenDialog("png,jpg;pdf", null, &outPath);			
				switch(result) {
					case .Okay:
					Console.WriteLine(scope $"OK '{StringView(&outPath[0])}'!");
					break;
					case .Cancel:
					Console.WriteLine("Cancel!");
					break;
					case .Error:
					Console.WriteLine(scope $"Error {StringView(&NativeFileDialog.GetError()[0])}!");
					break;
				}
			}
			// SaveDialog test
			{
				Console.WriteLine("SaveDialog test!");
				char8 *outPath = null;
				var result = NativeFileDialog.SaveDialog("png,jpg;pdf", null, &outPath);			
				switch(result) {
					case .Okay:
					Console.WriteLine(scope $"OK '{StringView(&outPath[0])}'!");
					break;
					case .Cancel:
					Console.WriteLine("Cancel!");
					break;
					case .Error:
					Console.WriteLine(scope $"Error {StringView(&NativeFileDialog.GetError()[0])}!");
					break;
				}
			}
			// OpenDialogMultiple test
			{
				Console.WriteLine("OpenDialogMultiple test!");
				PathSet pathSet;
				var result = NativeFileDialog.OpenDialogMultiple("png,jpg;pdf", null, &pathSet);			
				switch(result) {
					case .Okay:
					for (uint i = 0; i < NativeFileDialog.PathSet_GetCount(&pathSet); ++i )
					{
						var path = NativeFileDialog.PathSet_GetPath(&pathSet, i);
						Console.WriteLine(scope $"Path {i} '{StringView(&path[0])}'!");
					}
					NativeFileDialog.PathSet_Free(&pathSet);					
					break;
					case .Cancel:
					Console.WriteLine("Cancel!");
					break;
					case .Error:
					Console.WriteLine(scope $"Error {StringView(&NativeFileDialog.GetError()[0])}!");
					break;
				}
			}
			{
				Console.WriteLine("PickFolder test!");
				char8 *outPath = null;
				var result = NativeFileDialog.PickFolder(null, &outPath);			
				switch(result) {
					case .Okay:
					Console.WriteLine(scope $"OK '{StringView(&outPath[0])}'!");
					break;
					case .Cancel:
					Console.WriteLine("Cancel!");
					break;
					case .Error:
					Console.WriteLine(scope $"Error {StringView(&NativeFileDialog.GetError()[0])}!");
					break;
				}
			}
			return 0;
		}
	}
}
