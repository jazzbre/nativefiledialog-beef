using System;

namespace NativeFileDialog
{

/* opaque data structure -- see NFD_PathSet_* */
[CRepr]
struct PathSet
{
    char8 *buf;
    uint *indices; /* byte offsets into buf */
    uint count;    /* number of indices into buf */
}

enum Result : int32
{
    Error,       /* programmatic error */
    Okay,        /* user pressed okay, or successful return */
    Cancel       /* user pressed cancel */
}

public static class NativeFileDialog
{
	/* single file open dialog */    
	[LinkName("NFD_OpenDialog")]
	public static extern Result OpenDialog(char8 *filterList, char8 *defaultPath, char8 **outPath);

	/* multiple file open dialog */  
	[LinkName("NFD_OpenDialogMultiple")]  
	public static extern Result OpenDialogMultiple(char8 *filterList, char8 *defaultPath, PathSet *outPaths);

	/* save dialog */
	[LinkName("NFD_SaveDialog")]
	public static extern Result SaveDialog(char8 *filterList, char8 *defaultPath, char8 **outPath);

	/* select folder dialog */
	[LinkName("NFD_PickFolder")]
	public static extern Result PickFolder(char8 *defaultPath, char8 **outPath);

	/* get last error -- set when Result returns NFD_ERROR */
	[LinkName("NFD_GetError")]
	public static extern char8 *GetError();

	/* get the number of entries stored in pathSet */
	[LinkName("NFD_PathSet_GetCount")]
	public static extern uint PathSet_GetCount(PathSet *pathSet);

	/* Get the UTF-8 path at offset index */
	[LinkName("NFD_PathSet_GetPath")]
	public static extern char8  *PathSet_GetPath(PathSet *pathSet, uint index);

	/* Free the pathSet */    
	[LinkName("NFD_PathSet_Free")]
	public static extern void PathSet_Free(PathSet *pathSet);
}

}
